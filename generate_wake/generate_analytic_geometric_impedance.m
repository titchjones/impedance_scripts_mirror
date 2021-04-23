function struct = generate_analytic_geometric_impedance(file,sampling_points,betas)
%% Process analytic geometric data

    %% Read in data

    % Read file
    fileID = fopen(file);
    data = textscan(fileID,'%f %f %f %f %f','CommentStyle','#');
    fclose(fileID);        
    data = cell2mat(data);
    
    % Split file for type
    index = find(data(:,1) == 0);
    data_res_ind = data(index,2:3);

    index = find(data(:,1) == 1);
    data_resonators = data(index,2:5);

    % Split resonators for planes
    index = find(data_resonators(:,1) == 0);    
    data_lon = data_resonators (index,:);

    index = find(data_resonators (:,1) == 1);    
    data_hor = data_resonators (index,:);  

    index = find(data_resonators (:,1) == 2);    
    data_ver = data_resonators (index,:);

    %% Create output wakes
    
    ImpedanceFreq = zeros(length(sampling_points),1);
    ImpedanceRealZ = zeros(length(sampling_points),1);
    ImpedanceImagZ = zeros(length(sampling_points),1);
    ImpedanceRealX = zeros(length(sampling_points),1);
    ImpedanceImagX = zeros(length(sampling_points),1);  
    ImpedanceRealY = zeros(length(sampling_points),1);
    ImpedanceImagY = zeros(length(sampling_points),1);     
       
    %% Longitudinal resonators

    for i = 1:size(data_lon,1)
        
        R = data_lon(i,2);
        Q = data_lon(i,3);
        fres = data_lon(i,4);
        
        impedance = lon_resonator_impedance(sampling_points,R,Q,fres);   
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
%     for i = 1:size(data_hor,1)
%         
%         RW_length = data_hor(i,2);
%         rho = data_hor(i,3);
%         beff = data_hor(i,4); 
%         
%         %wake = trans_RW_wake(sampling_points,rho,beff,RW_length);
%         %WakeDX = WakeDX + wake.*average_betax(i);
%         %WakeDX = WakeDX + wake;
%     end    
        
    % Vertical wake
    
%     % Calculate average vertical beta over element lengths       
%     element_length = data_ver(:,2);
%     element_s = [0, cumsum(element_length)]';
%     average_betay = zeros(1,length(element_s)-1);
%     for i = 1:length(element_s)-1                   
%         average_betay(i) = integrate(beta_struct.betay,element_s(i+1),element_s(i))./element_length(i);            
%     end 
%     
%     for i = 1:size(data_ver,1)
%         
%         RW_length = data_ver(i,2);
%         rho = data_ver(i,3);
%         beff = data_ver(i,4);
%         
%        % wake = trans_RW_wake(sampling_points,rho,beff,RW_length);
%         %WakeDY = WakeDY + wake.*average_betay(i); 
%         %WakeDY = WakeDY + wake; 
%     end

    %% Resistive and inductive components
    for i = 1:size(data_res_ind,1)
    
    R = data_res_ind(i,1);
    L = data_res_ind(i,2);
    
    impedance = resistive_inductive_impedance(sampling_points,R,L);   
    ImpedanceRealZ = ImpedanceRealZ + real(impedance);
    ImpedanceImagZ = ImpedanceImagZ + imag(impedance);  
            
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

%%%%%%%%%%%%%%%%% Analytic impedance %%%%%%%%%%%%%%%%%%%%%%

function impedance = resistive_inductive_impedance(freq,R,L)
% Based on equation 15 in Skripka et al., "Simultaneous computation of
% intrabunch and interbunch collective beam motions in storage rings"

    omega = 2.*pi.*freq;           
    impedance = R + L.*1i.*omega;
    
end

function impedance = lon_resonator_impedance(freq,R,Q,fres)
% Using resonator conventions according to Elegant ZLONGIT element

    impedance = R./(1 + 1i.*Q.*(freq./fres - fres./freq));
end