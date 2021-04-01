%% Generate_wake
%% Script to generate input wake to AT and Elegant

%% Define input sources
% Resistive-wall flag: 0 = not include, 1 = analytic, 2 = IW2D
% Geometric flag: 0 = not include, 1 = analytic, 2 = CST

resistive_wall_flag = 1;
resistive_wall_file = 'analytic_resistive_wall.txt'; 

geometric_flag = 0;
geometric_file = 'CST_geometric_impedance.txt';

% Beta functions for transverse normalisation
% Beta flag: 0 = no normalisation, 1 = normalisation

beta_flag = 0;
beta_file = 'beta.txt';

%% Wake properties
% Unit: m

wake_range = 0.1;

% Number or points to sample wake
n_points = 1e6; % Number of points for sampling wake

% Bin length to sample wake for Elegant
elegant_bin_length = 10e-6; % Bin length

convolution_bunch_length = 0e-3; % Bunch length to convolute longitudinal resistive-wall wake: necessary to reduce number of bins in simulation

%% Interpolate beta functions for transverse normalisation 

if beta_flag == 1
    beta_functions = interpolate_beta();
else
    %TODO
    beta_functions.betax = 1;
    beta_functions.betay = 1;
end

%% Generate sampling points

sp = linspace(-wake_range,wake_range,n_points)';
elegant_sp = (-wake_range:elegant_bin_length:wake_range)';

% Check so number of sampling points is odd number
if mod(length(sp),2) ~= 1
    sp = linspace(-wake_range,wake_range,n_points+1)'; 
    fprintf('Number of sampling points is adjusted to %10e\n to have odd number of points\n',length(sp));
end

if mod(length(elegant_sp),2) ~= 1
    elegant_sp = linspace(-wake_range,wake_range,length(elegant_sp)+1)';
    elegant_bin_length = elegant_sp(2) - elegant_sp(1);
    fprintf('Elegant bin length is adjusted to %10e\n to have odd number of points\n',elegant_bin_length);
end

%% Generate resitive-wall wake

switch resistive_wall_flag
    
    case 1 % Analytic wake
        
        if convolution_bunch_length ~= 0
            
            % Generate wake using n_points sampled wake
            RW = generate_analytic_resistive_wall_wake(resistive_wall_file,sp,beta_functions,convolution_bunch_length);            
            AT_RW = RW;
                        
            % Resample convoluted wake for Elegant
            elegant_RW.WakeT = elegant_sp;           
            elegant_RW.WakeZ = interp1(RW.WakeT,RW.WakeZ,elegant_sp);
            elegant_RW.WakeDX = interp1(RW.WakeT,RW.WakeDX,elegant_sp);
            elegant_RW.WakeDY = interp1(RW.WakeT,RW.WakeDY,elegant_sp);
            elegant_RW.WakeQX = zeros(length(elegant_sp),1);       
            elegant_RW.WakeQY = zeros(length(elegant_sp),1);    
                    
        else
             AT_RW = generate_analytic_resistive_wall_wake(resistive_wall_file,sp,beta_functions,0);
             
             % Calculate wake directly using Elegant bin length
             elegant_RW = generate_analytic_resistive_wall_wake(resistive_wall_file,elegant_sp,beta_functions,0);
         end
        
    case 2 % Wake from IW2D
        %TODO
        
    otherwise
        %AT_RW.WakeT = sp;       
        AT_RW.WakeZ = zeros(length(sp),1);
        AT_RW.WakeDX = zeros(length(sp),1);
        AT_RW.WakeDY = zeros(length(sp),1);        
        AT_RW.WakeQX = zeros(length(sp),1);       
        AT_RW.WakeQY = zeros(length(sp),1);

        %elegant_RW.WakeT = elegant_sp;    
        elegant_RW.WakeZ = zeros(length(elegant_sp),1);
        elegant_RW.WakeDX = zeros(length(elegant_sp),1);
        elegant_RW.WakeDY = zeros(length(elegant_sp),1);        
        elegant_RW.WakeQX = zeros(length(elegant_sp),1);       
        elegant_RW.WakeQY = zeros(length(elegant_sp),1);                  
end

%% Generate geometric wake

switch geometric_flag
    
    case 1 % Analytic wake
        %AT_geom = generate_analytic_geometric_wake(geometric_file,sp,beta_functions);
        %elegant_geom = generate_analytic_geometric_wake(geometric_file,elegant_sp,beta_functions);
        
    case 2 % Wake from CST
        
        AT_geom = import_CST_wake(geometric_file,sp,beta_functions);
        elegant_geom = import_CST_wake(geometric_file,elegant_sp,beta_functions);       
                            
    otherwise
        %AT_geom.WakeT = sp;       
        AT_geom.WakeZ = zeros(length(sp),1);
        AT_geom.WakeDX = zeros(length(sp),1);
        AT_geom.WakeDY = zeros(length(sp),1);        
        AT_geom.WakeQX = zeros(length(sp),1);       
        AT_geom.WakeQY = zeros(length(sp),1);

        %elegant_geom.WakeT = elegant_sp;    
        elegant_geom.WakeZ = zeros(length(elegant_sp),1);
        elegant_geom.WakeDX = zeros(length(elegant_sp),1);
        elegant_geom.WakeDY = zeros(length(elegant_sp),1);        
        elegant_geom.WakeQX = zeros(length(elegant_sp),1);       
        elegant_geom.WakeQY = zeros(length(elegant_sp),1);    
end
    
%% Combine structs into single wake

AT_WakeT = sp;
AT_WakeZ = AT_RW.WakeZ + AT_geom.WakeZ;
AT_WakeDX = AT_RW.WakeDX + AT_geom.WakeDX;
AT_WakeDY = AT_RW.WakeDY + AT_geom.WakeDY;
AT_WakeQX = AT_RW.WakeQX + AT_geom.WakeQX;
AT_WakeQY = AT_RW.WakeQY + AT_geom.WakeQY;

elegant_WakeT = elegant_sp;
elegant_WakeZ = elegant_RW.WakeZ + elegant_geom.WakeZ;
elegant_WakeDX = elegant_RW.WakeDX + elegant_geom.WakeDX;
elegant_WakeDY = elegant_RW.WakeDY + elegant_geom.WakeDY;
elegant_WakeQX = elegant_RW.WakeQX + elegant_geom.WakeQX;
elegant_WakeQY = elegant_RW.WakeQY + elegant_geom.WakeQY;

%% Save txt file for import onto AT

fileID = fopen('wake_AT.txt','w');
fprintf(fileID,'WakeT [m] WakeZ [V/C] WakeDX WakeDY WakeQX WakeQY\n');

for i = 1:length(sp)
    fprintf(fileID,'%10.7f %10.7f %10.7f %10.7f %10.7f %10.7f\n',AT_WakeT(i),AT_WakeZ(i),AT_WakeDX(i),AT_WakeDY(i),AT_WakeQX(i),AT_WakeQY(i));
end
fclose(fileID);
 
%% Save txt file for import into Elegant

% Longitudinal file
clight = 299792458;
time = elegant_WakeT./clight; % Change to time to match Elegant conventions
lon_wake = elegant_WakeZ; % Sign to match Elegant conventions

fileID = fopen('lon_elegant_wake.txt','w');
for i = 1:length(time)
    fprintf(fileID,'%10e %10e\n',time(i),lon_wake(i));
end
fclose(fileID);
system('plaindata2sdds lon_elegant_wake.txt wake_elegant.sdds -inputMode=ascii -outputMode=ascii -separator=" " -noRowCount -column=Time,double,units=s  -column=Wake,double,units=V/C');
delete('lon_elegant_wake.txt');

%% Plot wakes

figure(1)
plot(AT_WakeT,AT_WakeZ,'.')
hold on
plot(elegant_WakeT,elegant_WakeZ,'.')
hold off
legend('AT','Elegant')

%% Save mat file
save('wake.mat','AT_WakeT','AT_WakeZ','AT_WakeDX','AT_WakeDY','AT_WakeQX','AT_WakeQY','elegant_WakeT','elegant_WakeZ','elegant_WakeDX','elegant_WakeDY','elegant_WakeQX','elegant_WakeQY');



% %% Create output wakes
% 
% WakeT = linspace(-wake_range, wake_range, n_points)';
% WakeZ = zeros(n_points,1);
% WakeDX = zeros(n_points,1);
% WakeDY = zeros(n_points,1);
% WakeQX = zeros(n_points,1);
% WakeQY = zeros(n_points,1);
% 
% 
% %% Beta functions for transverse normalisation
% 
% % Load beta data
% 
% load(ring_name);
% 
% [twissdata,~] = atx(THERING);
% beta_data = [cat(1,twissdata.SPos),cat(1,twissdata.beta)];
% 
% % Make data unique
% 
% [~,index,~] = unique(beta_data(:,1));
% beta_data = beta_data(index,:);
% 
% % Interpolate data for better resolution
% 
% sq = linspace(min(beta_data(:,1)),max(beta_data(:,1)),1e4);
% 
% betax = interp1(beta_data(:,1),beta_data(:,2),sq,'linear');
% betay = interp1(beta_data(:,1),beta_data(:,3),sq,'linear');
% 
% % Fit function to interpolated data
% 
% fit_betax = fit(sq',betax','linearinterp');
% fit_betay = fit(sq',betay','linearinterp');
% 
% % Plot figures for checks
% 
% % figure(1)
% % plot(beta_data(:,1),beta_data(:,2),'.')
% % hold on
% % %plot(sq,betax,'.')
% % plot(sq,fit_betax(sq))
% % hold off
% % 
% % figure(2)
% % plot(beta_data(:,1),beta_data(:,3),'.')
% % hold on
% % plot(sq,fit_betay(sq))
% % hold off
% 
% %% Create output wakes
% 
% WakeT = linspace(-wake_range, wake_range, n_points)';
% WakeZ = zeros(n_points,1);
% WakeDX = zeros(n_points,1);
% WakeDY = zeros(n_points,1);
% WakeQX = zeros(n_points,1);
% WakeQY = zeros(n_points,1);
% 
% 
% 
% %% Save output
% 
% % Save mat file
% save('wake_for_input.mat','WakeT','WakeZ','WakeDX','WakeDY','WakeQX','WakeQY');
% 
% % Save txt file
% fileID = fopen('wake_for_input.txt','w');
% fprintf(fileID,'WakeT [m] WakeZ [V/C] WakeDX WakeDY WakeQX WakeQY\n');
% 
% for i = 1:n_points
%     fprintf(fileID,'%10.7f %10.7f %10.7f %10.7f %10.7f %10.7f\n',WakeT(i),WakeZ(i),WakeDX(i),WakeDY(i),WakeQX(i),WakeQY(i));
% end
% fclose(fileID);
% 
% function new_wake = make_equally_spaced(wake)
% 
% s = wake(:,1);
% values = wake(:,2);
% 
% % Find index closes to zero
% [value, index] = min(abs(s));
% 
% % Find values of index next to zero
% low_index = index - 1;
% high_index = index + 1;
% 
% low_value = values(low_index);
% high_value = values(high_index);
% 
% mean_value = (low_value+high_value)./2;
% 
% % Replace these three points with a single point at zero
% new_values = values;
% new_values(index) = mean_value;
% 
% new_s = s;
% new_s(index) = 0;
% 
% new_values(low_index) = [];
% new_values(index) = [];
% 
% new_s(low_index) = [];
% new_s(index) = [];
% 
% new_wake = cat(2,new_s,new_values);
% 
% end


