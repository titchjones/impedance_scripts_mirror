function struct = import_IW2D_impedance(file,sampling_points,betas)
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
    
    %% Create output wakes

    ImpedanceFreq = zeros(length(sampling_points),1);
    ImpedanceRealZ = zeros(length(sampling_points),1);
    ImpedanceImagZ = zeros(length(sampling_points),1);
    ImpedanceRealX = zeros(length(sampling_points),1);
    ImpedanceImagX = zeros(length(sampling_points),1);  
    ImpedanceRealY = zeros(length(sampling_points),1);
    ImpedanceImagY = zeros(length(sampling_points),1);     
    
    %% Longitudinal wake
    for i = 1:size(data_lon,1)
        
        RW_length = data_lon{2}(i);
        filename = char(data_lon{4}(i));
            
        lon_impedance = importdata(filename);
        lon_impedance = lon_impedance.data;
                                      
        % Resample impedance
        impedance_real = interp1(lon_impedance(:,1),lon_impedance(:,2),sampling_points,'linear',0);
        impedance_imag = interp1(lon_impedance(:,1),lon_impedance(:,3),sampling_points,'linear',0);        
        
        % Multiply impedance with length
        impedance_real  = impedance_real.*RW_length;        
        impedance_imag  = impedance_imag.*RW_length;
       
        ImpedanceRealZ = ImpedanceRealZ + impedance_real;
        ImpedanceImagZ = ImpedanceImagZ + impedance_imag;          
                                                                                                               
    end
        
    % Horizontal wake

%     % Calculate average horizontal beta over element lengths       
%     element_length = data_hor(:,2);
%     element_s = [0, cumsum(element_length)]';         
%     average_betax = zeros(1,length(element_s)-1);         
%     for i = 1:length(element_s)-1                   
%         average_betax(i) = integrate(beta_struct.betax,element_s(i+1),element_s(i))./element_length(i);            
%     end
%

    for i = 1:size(data_hor,1)
        
        RW_length = data_hor{2}(i);
        filename = char(data_hor{3}(i));
            
%         hor_wake = importdata(filename);
%         hor_wake = hor_wake.data;
%                        
%         % Make the wake equally spaced
%         hor_wake = make_equally_spaced(hor_wake); 
%         
%         % Resample wake
%         wake = interp1(hor_wake(:,1),hor_wake(:,2),sampling_points,'linear',0);  
%                                                     
%         % Multiply wake with length and change sign to to fit with AT
%         % conventions
%         wake = -wake.*RW_length;
%         
% %        WakeDX = WakeDX + wake.*average_betax(i);
%         WakeDX = WakeDX + wake;
                            
    end
               
    % Vertical wake
    
%     % Calculate average vertical beta over element lengths       
%     element_length = data_ver(:,2);
%     element_s = [0, cumsum(element_length)]';
%     average_betay = zeros(1,length(element_s)-1);
%     for i = 1:length(element_s)-1                   
%         average_betay(i) = integrate(beta_struct.betay,element_s(i+1),element_s(i))./element_length(i);            
%     end 
%

    for i = 1:size(data_ver,1)
        
        RW_length = data_ver{2}(i);
        filename = char(data_ver{3}(i));
            
%         ver_wake = importdata(filename);
%         ver_wake = ver_wake.data;
%                        
%         % Make the wake equally spaced
%         ver_wake = make_equally_spaced(ver_wake); 
%         
%         % Resample wake
%         wake = interp1(ver_wake(:,1),ver_wake(:,2),sampling_points,'linear',0);  
%                                                     
%         % Multiply wake with length and change sign to to fit with AT
%         % conventions
%         wake = -wake.*RW_length;
%         
% %        WakeDX = WakeDX + wake.*average_betay(i);
%         WakeDY = WakeDY + wake;        
        
    end

    %% Create output struct

    struct.ImpedanceFreq = sampling_points;
    struct.ImpedanceRealZ = ImpedanceRealZ;
    struct.ImpedanceImagZ = ImpedanceImagZ;
    struct.ImpedanceRealX = ImpedanceRealX;
    struct.ImpedanceImagX = ImpedanceImagX;
    struct.ImpedanceRealY = ImpedanceRealY;
    struct.ImpedanceImagY = ImpedanceImagY;

end