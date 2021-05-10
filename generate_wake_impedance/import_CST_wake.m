function struct = import_CST_wake(file,sampling_points,betas)
%% Import wake from CST output and resample to required sampling points

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

    WakeZ = zeros(length(sampling_points),1);
    WakeDX = zeros(length(sampling_points),1);
    WakeDY = zeros(length(sampling_points),1);        
    
    %% Longitudinal wake
    
    fprintf('Reading CST wake files\n'); 
       
    fprintf('Reading longitudinal files\n');
    for i = 1:size(data_lon{1},1)
        
        filename = char(data_lon{3}(i));
        
        if ~isempty(filename)
            fileID = fopen(filename);
            data = textscan(fileID,'%f %f','CommentStyle','#');
            fclose(fileID);          
            lon_wake = cell2mat(data);  % Units mm, V/pC

            % Change units to mm and V/C and sign to match AT conventions
            s = lon_wake(:,1).*1e-3;
            wake = -lon_wake(:,2).*1e12;

            % Resample at sample points
            new_wake = interp1(s,wake,sampling_points,'linear',0);  
            WakeZ = WakeZ + new_wake;
        end

    end
    fprintf('Finished reading longitudinal files. Read %d lines.\n\n',i);
    
        
    %% Horizontal wake
    
%     if ~isempty(betas)
%         % Calculate average horizontal beta over element lengths       
%         element_length = data_hor{2}(i);
%         element_s = [0, cumsum(element_length)]';         
%         average_betax = zeros(1,length(element_s)-1);         
%         for i = 1:length(element_s)-1                   
%             average_betax(i) = integrate(betas.betax,element_s(i+1),element_s(i))./element_length(i);            
%         end
%     else
%         average_betax = 1;
%     end
%     
%     fprintf('Reading horizontal files\n');    
%     for i = 1:size(data_hor,1)
%         
%         filename = char(data_hor{3}(i));
%         
%         if ~isempty(filename) 
%         
%             % TODO: change importdata
%             %hor_wake = importdata(filename);
%             %hor_wake = hor_wake.data;
% 
%     %         % Change units to mm and V/C and sign to match AT conventions
%     %         s = lon_wake(:,1).*1e-3;
%     %         wake = -lon_wake(:,2).*1e12;
%     %         
%     %         % Resample at sample points
%     %         new_wake = interp1(s,wake,sampling_points,'linear',0);  
%     %         WakeZ = WakeZ + new_wake;
%         end
% 
%     end
%     fprintf('Finished reading horizontal files\n');    
             
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
% %         RW_length = data_ver(i,2);
% %         rho = data_ver(i,3);
% %         beff = data_ver(i,4);
% %         
% %         wake = trans_RW_wake(sampling_points,rho,beff,RW_length);
% %         %WakeDY = WakeDY + wake.*average_betay(i); 
% %         WakeDY = WakeDY + wake; 
%     end
    
    %% Create output struct

    struct.WakeT = sampling_points;
    struct.WakeZ = WakeZ;
    struct.WakeDX = WakeDX;
    struct.WakeDY = WakeDY;     
    struct.WakeQX = zeros(length(sampling_points),1); 
    struct.WakeQY = zeros(length(sampling_points),1);       
    
end