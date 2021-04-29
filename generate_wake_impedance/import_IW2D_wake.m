function struct = import_IW2D_wake(file,sampling_points,betas,convolution_bunch_length)
%% Process impedanceWake2D input

    %% Read in data
    
    % Read file
    fileID = fopen(file);
    data = textscan(fileID,'%f %f %s %s','CommentStyle','#');
    fclose(fileID);        
        
    % Split file for planes
    index = find(data{1} == 0);
    data_lon = cellfun(@(v)v (index),data,'UniformOutput',false);

    index = find(data{1} == 1);
    data_hor = cellfun(@(v)v (index),data,'UniformOutput',false);

    index = find(data{1} == 2);       
    data_ver = cellfun(@(v)v (index),data,'UniformOutput',false);    
    
    %% If convolution, even number of points required for numerical convolution to work correctly

    if convolution_bunch_length ~= 0
        initial_sampling_points = sampling_points;  
        sampling_points = linspace(min(sampling_points),max(sampling_points),length(sampling_points)+1)';    
    end

    %% Create output wakes

    WakeZ = zeros(length(sampling_points),1);
    WakeDX = zeros(length(sampling_points),1);
    WakeDY = zeros(length(sampling_points),1); 
    
    %% Longitudinal wake
    for i = 1:size(data_lon,1)
        
        RW_length = data_lon{2}(i);
        filename = char(data_lon{3}(i));
            
        lon_wake = importdata(filename);
        lon_wake = lon_wake.data;
                                
        % Make the wake equally spaced
        lon_wake = make_equally_spaced(lon_wake); 
        
        % Resample wake
        wake = interp1(lon_wake(:,1),lon_wake(:,2),sampling_points,'linear',0);
        
        % Multiply wake with length
        wake = wake.*RW_length;         
                                                                           
        WakeZ = WakeZ + wake;         
                             
    end
        
    %% Horizontal wake

    if ~isempty(betas)
        % Calculate average horizontal beta over element lengths       
        element_length = data_hor{2}(i);
        element_s = [0, cumsum(element_length)]';         
        average_betax = zeros(1,length(element_s)-1);         
        for i = 1:length(element_s)-1                   
            average_betax(i) = integrate(betas.betax,element_s(i+1),element_s(i))./element_length(i);            
        end
    else
        average_betax = 1;
    end

    for i = 1:size(data_hor,1)
        
        RW_length = data_hor{2}(i);
        filename = char(data_hor{3}(i));
            
        hor_wake = importdata(filename);
        hor_wake = hor_wake.data;
                       
        % Make the wake equally spaced
        hor_wake = make_equally_spaced(hor_wake); 
        
        % Resample wake
        wake = interp1(hor_wake(:,1),hor_wake(:,2),sampling_points,'linear',0);  
                                                    
        % Multiply wake with length and change sign to to fit with AT
        % conventions
        wake = -wake.*RW_length;
        
        WakeDX = WakeDX + wake.*average_betax(i);
                            
    end
               
    %% Vertical wake
    
    if ~isempty(betas)   
        % Calculate average vertical beta over element lengths       
        element_length = data_ver{2}(i);
        element_s = [0, cumsum(element_length)]';
        average_betay = zeros(1,length(element_s)-1);
        for i = 1:length(element_s)-1                   
            average_betay(i) = integrate(betas.betay,element_s(i+1),element_s(i))./element_length(i);            
        end
    else
       average_betay = 1; 
    end

    for i = 1:size(data_ver,1)
        
        RW_length = data_ver{2}(i);
        filename = char(data_ver{3}(i));
            
        ver_wake = importdata(filename);
        ver_wake = ver_wake.data;
                       
        % Make the wake equally spaced
        ver_wake = make_equally_spaced(ver_wake); 
        
        % Resample wake
        wake = interp1(ver_wake(:,1),ver_wake(:,2),sampling_points,'linear',0);  
                                                    
        % Multiply wake with length and change sign to to fit with AT
        % conventions
        wake = -wake.*RW_length;
        
        WakeDY = WakeDY + wake.*average_betay(i);      
        
    end
    
    %% Convolute wake

    if convolution_bunch_length ~= 0

        conv_lon_wake = convolute(sampling_points,WakeZ,convolution_bunch_length);
        conv_hor_wake = convolute(sampling_points,WakeDX,convolution_bunch_length);     
        conv_ver_wake = convolute(sampling_points,WakeDY,convolution_bunch_length); 

        % Changing sampling points back to initial points
        WakeZ = interp1(sampling_points,conv_lon_wake,initial_sampling_points);
        WakeDX = interp1(sampling_points,conv_hor_wake,initial_sampling_points);
        WakeDY = interp1(sampling_points,conv_ver_wake,initial_sampling_points);

        sampling_points = initial_sampling_points;

    end

    %% Create output struct

    struct.WakeT = sampling_points;
    struct.WakeZ = WakeZ;
    struct.WakeDX = WakeDX;
    struct.WakeDY = WakeDY;     
    struct.WakeQX = zeros(length(sampling_points),1); 
    struct.WakeQY = zeros(length(sampling_points),1);
    struct.average_betax = average_betax;
    struct.average_betay = average_betay;      

end

%%%%%%%%%%%%%%%%% Format IW2D input %%%%%%%%%%%%%%%%%%%%%%


function new_wake = make_equally_spaced(wake)

s = wake(:,1);
values = wake(:,2);

% Find index closes to zero
[value, index] = min(abs(s));

% Find values of index next to zero
low_index = index - 1;
high_index = index + 1;

low_value = values(low_index);
high_value = values(high_index);

mean_value = (low_value+high_value)./2;

% Replace these three points with a single point at zero
new_values = values;
new_values(index) = mean_value;

new_s = s;
new_s(index) = 0;

new_values(low_index) = [];
new_values(index) = [];

new_s(low_index) = [];
new_s(index) = [];

new_wake = cat(2,new_s,new_values);

end