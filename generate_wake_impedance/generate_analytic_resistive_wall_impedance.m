function struct = generate_analytic_resistive_wall_impedance(file,sampling_points,betas)
%% Process analytic resistive-wall input

    disp(betas)

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
    
    %% Horizontal impedance

    if ~isempty(betas)
        % Calculate average horizontal beta over element lengths       
        element_length = data_hor(:,2);
        element_s = [0; cumsum(element_length)]';         
        average_betax = zeros(1,length(element_s)-1);         
        disp('beta_x')
        for i = 1:length(element_s)-1                   
            average_betax(i) = integrate(betas.betax,element_s(i+1),element_s(i))./element_length(i);
            disp(element_s(i))
            disp(average_betax(i))
        end
    else
        average_betax = 1;
    end
    
    for i = 1:size(data_hor,1)
        
        RW_length = data_hor(i,2);
        rho = data_hor(i,3);
        beff = data_hor(i,4);
        
        impedance = trans_RW_impedance(sampling_points,rho,beff,RW_length);   
        ImpedanceRealX = ImpedanceRealX + real(impedance).*average_betax(i);
        ImpedanceImagX = ImpedanceImagX + imag(impedance).*average_betax(i);  
       
    end    
        
    %% Vertical impedance
    
    if ~isempty(betas)   
        % Calculate average vertical beta over element lengths       
        element_length = data_ver(:,2);
        element_s = [0; cumsum(element_length)]';
        average_betay = zeros(1,length(element_s)-1);
        disp('beta_y')
        for i = 1:length(element_s)-1                   
            average_betay(i) = integrate(betas.betay,element_s(i+1),element_s(i))./element_length(i);
            disp(element_s(i))
            disp(average_betay(i))
        end
    else
       average_betay = 1; 
    end
    
    for i = 1:size(data_ver,1)
        
        RW_length = data_ver(i,2);
        rho = data_ver(i,3);
        beff = data_ver(i,4);
        
        impedance = trans_RW_impedance(sampling_points,rho,beff,RW_length);   
        ImpedanceRealY = ImpedanceRealY + real(impedance).*average_betay(i);
        ImpedanceImagY = ImpedanceImagY + imag(impedance).*average_betay(i); 
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

function Z = trans_RW_impedance(sampling_points,rho,beff,RW_length)
% Based of equation 3 in Smaluk et al., "Beam-based model of broad-band
% impedance of the Diamond Light Source"
% This equation doesn't include the low frequency behaviour(?)
% The equation is the impedance per length unit
% Sign of imaginary part changed to fit with Elegant conventions
% DC components set to zero

    clight = 299792458;
    Z0 = 376.730313669; % Impedance of free space
    
    omega = 2.*pi.*sampling_points;
    skin_depth = sqrt(2.*clight.*rho./(Z0.*abs(omega)));
    
    Z = (sign(omega)-1i).*(Z0.*skin_depth./(2.*pi.*beff.^3)).*RW_length;
    
    % Set DC components to zero
    index = find(omega == 0);
    Z(index) = 0;
    
end