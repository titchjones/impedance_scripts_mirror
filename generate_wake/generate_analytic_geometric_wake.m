function struct = generate_analytic_geometric_wake(file,sampling_points,betas,convolution_bunch_length)
%% Process analytic geometric impedance input

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
    
    %% If convolution, even number of points required for numerical convolution to work correctly

    if convolution_bunch_length ~= 0
        initial_sampling_points = sampling_points;  
        sampling_points = linspace(min(sampling_points),max(sampling_points),length(sampling_points)+1)';    
    end  
    
    %% Create output wakes

    WakeZ = zeros(length(sampling_points),1);
    WakeDX = zeros(length(sampling_points),1);
    WakeDY = zeros(length(sampling_points),1);
        
    %% Longitudinal resonators

    for i = 1:size(data_lon,1)
        
        R = data_lon(i,2);
        Q = data_lon(i,3);
        fres = data_lon(i,4);
        
        wake = lon_resonator_wake(sampling_points,R,Q,fres);
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
%     for i = 1:size(data_hor,1)
%         
%         RW_length = data_hor(i,2);
%         rho = data_hor(i,3);
%         beff = data_hor(i,4); 
%         
%         wake = trans_RW_wake(sampling_points,rho,beff,RW_length);
%         %WakeDX = WakeDX + wake.*average_betax(i);
%         WakeDX = WakeDX + wake;
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
%         wake = trans_RW_wake(sampling_points,rho,beff,RW_length);
%         %WakeDY = WakeDY + wake.*average_betay(i); 
%         WakeDY = WakeDY + wake; 
%     end

    %% Convolute resonator wakes

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

    %% Resistive and inductive components
    for i = 1:size(data_res_ind,1)
    
    R = data_res_ind(i,1);
    L = data_res_ind(i,2);
    
    wake = resistive_inductive_convoluted_wake(sampling_points,R,L,convolution_bunch_length);
    WakeZ = WakeZ + wake;
            
    end

    %% Create output struct

    struct.WakeT = sampling_points;
    struct.WakeZ = WakeZ;
    struct.WakeDX = WakeDX;
    struct.WakeDY = WakeDY;     
    struct.WakeQX = zeros(length(sampling_points),1); 
    struct.WakeQY = zeros(length(sampling_points),1);   

end

%%%%%%%%%%%%%%%%% Analytic geometric wakes %%%%%%%%%%%%%%%%%%%%%%

function wake = resistive_inductive_convoluted_wake(s,R,L,sigma_L)
% Based on equation 17 in Skripka et al. 'Simultaneous computation of intrabunch and interbunch collective beam motions in storage rings'
% Changed sign in front of differential since otherwise the formula do not agree with
% the Fourier transform

    % Add extra point at end to get same number of points at input after
    % taking diff
    step_size = s(2) - s(1);   
    s = [s; s(end)+step_size];
        
    clight = 299792458;
    tau = s./clight;
    sigma_t = sigma_L./clight;
    
    lambda = 1./(sqrt(2.*pi).*sigma_t).*exp(-tau.^2./(2.*sigma_t.^2));
    
    step_size = tau(2)-tau(1);
            
    wake = R.*lambda(1:end-1,1) + L.*diff(lambda)./step_size;
    
end

function wake = lon_resonator_wake(s,R,Q,fres)
% Based on equation 2.84 in Chao, "Physics of Collective Beam Instabilities
% in High Energy Accelerators"
% Sign changed to match AT conventions

    clight = 299792458;

    omegar = 2.0*pi*fres;
    alpha = omegar/(2.0*Q);
    omegabar = sqrt(omegar*omegar-alpha*alpha);
    
    wake = zeros(length(s),1);

	for i = 1:length(s)
        if s(i) < 0.0
            % Keep zero       
        elseif s(i) == 0.0
            wake(i) = alpha*R; 
            %output(i) = -alpha*R;
        else
            wake(i) = 2.0*alpha*R*exp(alpha*(-s(i))/clight)*(cos(omegabar*(-s(i))/clight) + alpha/omegabar*sin(omegabar*(-s(i))/clight));
            %output(i) = -2.0*alpha*R*exp(alpha*(-s(i))/clight)*(cos(omegabar*(-s(i))/clight) + alpha/omegabar*sin(omegabar*(-s(i))/clight));
        end

    end 

end
