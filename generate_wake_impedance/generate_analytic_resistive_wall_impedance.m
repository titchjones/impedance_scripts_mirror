function struct = generate_analytic_resistive_wall_impedance(file,sampling_points,betas)
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

    %% Create output wakes
    
    ImpedanceFreq = zeros(length(sampling_points),1);
    ImpedanceRealZ = zeros(length(sampling_points),1);
    ImpedanceImagZ = zeros(length(sampling_points),1);
    ImpedanceRealX = zeros(length(sampling_points),1);
    ImpedanceImagX = zeros(length(sampling_points),1);  
    ImpedanceRealY = zeros(length(sampling_points),1);
    ImpedanceImagY = zeros(length(sampling_points),1);     
       
    %% Longitudinal impedance
    for i = 1:size(data_lon,1)

        RW_length = data_lon(i,2);
        rho = data_lon(i,3);
        beff = data_lon(i,4);

        impedance = lon_RW_impedance(sampling_points,rho,beff,RW_length);   
        ImpedanceRealZ = ImpedanceRealZ + real(impedance);
        ImpedanceImagZ = ImpedanceImagZ + imag(impedance);        

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
        
        %wake = trans_RW_wake(sampling_points,rho,beff,RW_length);
        %WakeDX = WakeDX + wake.*average_betax(i);
        %WakeDX = WakeDX + wake;
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
        
       % wake = trans_RW_wake(sampling_points,rho,beff,RW_length);
        %WakeDY = WakeDY + wake.*average_betay(i); 
        %WakeDY = WakeDY + wake; 
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

%%%%%%%%%%%%%%%%% Analytic resistive-wall impedance %%%%%%%%%%%%%%%%%%%%%%

function Z = lon_RW_impedance(sampling_points,rho,beff,RW_length)
% Based on equation 8 in Bane & Sands, The Short-Range Resistive Wall
% Wakefields, 1995 converted to SI units and changed sign for imaginary
% part
% The equation is the impedance per length unit

    clight = 299792458;
    Z0 = 376.730313669; % Impedance of free space
    
    omega = 2.*pi.*sampling_points;
    
    k = omega./clight;
    
    s0 = (2.*beff.^2.*rho/Z0).^(1./3);
    
    Z = 2.*s0./(clight.*beff.^2).*( (-1i.*sign(k.*s0) + 1)./sqrt(abs(k.*s0)) + 1i.*k.*s0./2 ).^(-1).*30.*clight.*RW_length;

    %skin_depth = sqrt(2.*clight.*rho./(Z0.*abs(omega)));    
    %Z = (1 + 1i.*sign(omega)).*Z0.*abs(omega).*skin_depth./(4.*pi.*clight.*beff).*RW_length;
    
end

% function wake = trans_RW_wake(sampling_points,rho,beff,RW_length)
% % Based on equation 25 in Skripka et al. 'Simultaneous computation of intrabunch and interbunch collective beam motions in storage rings'
% % Multiplied with s0 since missing in formula
% % The equation is the wake function per length unit
% 
%    clight = 299792458;
%    Z0 = 376.730313669; % Impedance of free space
% 
%    %s = linspace(-wake_range,wake_range,n_points);
%    s = sampling_points;
% 
%    s0 = (2.*beff.^2.*rho./Z0).^(1./3);
%    tau0 = s0./clight;
% 
%    wake = zeros(length(s),1);        
%               
%    % Find index of s >= 0               
%    index = find(s>=0);
%        
%    tau = s(index)./clight;                
%    f = @(x) -exp(-x.^2.*tau./tau0)./(x.^6+8);
%        
%    % Negative sign on wake necessary to get detuning in tracking
%    wake(index) = -s0.*8.*Z0.*clight/(pi.*beff.^4).*(1./12.* (-exp(-tau./tau0).*cos(sqrt(3).*tau./tau0) + sqrt(3).*exp(-tau./tau0).*sin(sqrt(3).*tau./tau0) ) - sqrt(2)./pi.*integral(f,0,inf,'ArrayValued',true)).*RW_length;
%        
% end

