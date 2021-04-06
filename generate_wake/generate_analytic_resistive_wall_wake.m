function struct = generate_analytic_resistive_wall_wake(file,sampling_points,betas,convolution_bunch_length)
%% Process analytic resistive-wall input

    %% Read in data

    % Read file
    fileID = fopen(file);
    data = textscan(fileID,'%f %f %f %f','CommentStyle','#');
    fclose(fileID);        
    data = cell2mat(data);

    % Split file for planes
    index = find(data(:,1) == 0);    
    data_lon = data(index,:);

    index = find(data(:,1) == 1);    
    data_hor = data(index,:);  

    index = find(data(:,1) == 2);    
    data_ver = data(index,:);

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

        RW_length = data_lon(i,2);
        rho = data_lon(i,3);
        beff = data_lon(i,4);

        wake = lon_RW_wake(sampling_points,rho,beff,RW_length);   
        WakeZ = WakeZ + wake;

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
        
        RW_length = data_hor(i,2);
        rho = data_hor(i,3);
        beff = data_hor(i,4); 
        
        wake = trans_RW_wake(sampling_points,rho,beff,RW_length);
        %WakeDX = WakeDX + wake.*average_betax(i);
        WakeDX = WakeDX + wake;
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
        
        RW_length = data_ver(i,2);
        rho = data_ver(i,3);
        beff = data_ver(i,4);
        
        wake = trans_RW_wake(sampling_points,rho,beff,RW_length);
        %WakeDY = WakeDY + wake.*average_betay(i); 
        WakeDY = WakeDY + wake; 
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

end

%%%%%%%%%%%%%%%%% Analytic resistive-wall wakes %%%%%%%%%%%%%%%%%%%%%%

function wake = lon_RW_wake(sampling_points,rho,beff,RW_length)
% Based on equation 22 in Skripka et al. 'Simultaneous computation of intrabunch and interbunch collective beam motions in storage rings'
% The equation is the wake function per length unit

    clight = 299792458;
    Z0 = 376.730313669; % Impedance of free space

    %s = linspace(-wake_range,wake_range,n_points);
    s = sampling_points;

    s0 = (2.*beff.^2.*rho./Z0).^(1./3);
    tau0 = s0./clight;

    wake = zeros(length(s),1);

    % Find index of s >= 0               
    index = find(s>=0);

    tau = s(index)./clight;              
    f = @(x) x.^2.*exp(-x.^2.*tau./tau0)./(x.^6+8);

    % Positive sign on wake necessary to get bunch lengthening in AT tracking
    wake(index) = 4.*Z0.*clight/(pi.*beff.^2).*( exp(-tau./tau0)./3.*cos(sqrt(3).*tau./tau0) - sqrt(2)./pi.*integral(f,0,inf,'ArrayValued',true) ).*RW_length;

end

function wake = trans_RW_wake(sampling_points,rho,beff,RW_length)
% Based on equation 25 in Skripka et al. 'Simultaneous computation of intrabunch and interbunch collective beam motions in storage rings'
% Multiplied with s0 since missing in formula
% The equation is the wake function per length unit

    clight = 299792458;
    Z0 = 376.730313669; % Impedance of free space

    %s = linspace(-wake_range,wake_range,n_points);
    s = sampling_points;

    s0 = (2.*beff.^2.*rho./Z0).^(1./3);
    tau0 = s0./clight;

    wake = zeros(length(s),1);        
               
    % Find index of s >= 0               
    index = find(s>=0);
        
    tau = s(index)./clight;                
    f = @(x) -exp(-x.^2.*tau./tau0)./(x.^6+8);
        
    % Negative sign on wake necessary to get detuning in tracking
    wake(index) = -s0.*8.*Z0.*clight/(pi.*beff.^4).*(1./12.* (-exp(-tau./tau0).*cos(sqrt(3).*tau./tau0) + sqrt(3).*exp(-tau./tau0).*sin(sqrt(3).*tau./tau0) ) - sqrt(2)./pi.*integral(f,0,inf,'ArrayValued',true)).*RW_length;
        
end

