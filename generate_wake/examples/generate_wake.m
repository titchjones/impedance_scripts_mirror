%% Generate_wake
%% Script to generate input wake and impedance to AT and Elegant

%% Define input sources
% Resistive-wall flag: 0 = not include, 1 = analytic, 2 = IW2D
% Geometric flag: 0 = not include, 1 = analytic, 2 = CST

resistive_wall_flag = 1;
resistive_wall_file = 'analytic_resistive_wall.txt';
%resistive_wall_file = 'IW2D_resistive_wall.txt'; 

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
n_points = 1e6;

% Bin length to sample wake for Elegant
elegant_bin_length = 1e-6; % Bin length

convolution_bunch_length = 0e-3; % Bunch length to convolute longitudinal resistive-wall wake: necessary to reduce number of bins in simulation

%% Impedance properties
% Unit: Hz

freq_range = 2000e9;

% Frequency step to sample impedance for Elegant
elegant_freq_step = 1e6;

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
elegant_freq_sp = (0:elegant_freq_step:freq_range)';

% Check so number of wake sampling points is odd number
if mod(length(sp),2) ~= 1
    sp = linspace(-wake_range,wake_range,n_points+1)'; 
    fprintf('Number of sampling points is adjusted to %10e\n to have odd number of points\n',length(sp));
end

if mod(length(elegant_sp),2) ~= 1
    elegant_sp = linspace(-wake_range,wake_range,length(elegant_sp)+1)';
    elegant_bin_length = elegant_sp(2) - elegant_sp(1);
    fprintf('Elegant bin length is adjusted to %10e\n to have odd number of points\n',elegant_bin_length);
end

% Convert number of frequency sampling points to 2^(n+1) since required
% by Elegant
n_freq = length(elegant_freq_sp);
n_freq = 2^nextpow2(n_freq)+1;
elegant_freq_sp = linspace(0,freq_range,n_freq)';
elegant_freq_step = elegant_freq_sp(2) - elegant_freq_sp(1);
fprintf('Elegant frequency step is adjusted to %10e\n to have 2^(n+1) number of points\n',elegant_freq_step);

%% Generate resitive-wall wake

switch resistive_wall_flag
    
    case 1 % Analytic
        
        % Generate wakes for AT and Elegant
        if convolution_bunch_length ~= 0
            
            % Generate wake using n_points sampled wake
            RW_wake = generate_analytic_resistive_wall_wake(resistive_wall_file,sp,beta_functions,convolution_bunch_length);            
            AT_RW = RW_wake;
                        
            % Resample convoluted wake for Elegant
            elegant_RW.WakeT = elegant_sp;           
            elegant_RW.WakeZ = interp1(RW_wake.WakeT,RW_wake.WakeZ,elegant_sp);
            elegant_RW.WakeDX = interp1(RW_wake.WakeT,RW_wake.WakeDX,elegant_sp);
            elegant_RW.WakeDY = interp1(RW_wake.WakeT,RW_wake.WakeDY,elegant_sp);
            elegant_RW.WakeQX = zeros(length(elegant_sp),1);       
            elegant_RW.WakeQY = zeros(length(elegant_sp),1);    
                    
        else
            AT_RW = generate_analytic_resistive_wall_wake(resistive_wall_file,sp,beta_functions,0);
             
            % Calculate wake directly using Elegant bin length
            elegant_RW = generate_analytic_resistive_wall_wake(resistive_wall_file,elegant_sp,beta_functions,0);
        end
        
        % Generate impedance for Elegant
        RW_impedance = generate_analytic_resistive_wall_impedance(resistive_wall_file,elegant_freq_sp,beta_functions);
        
        elegant_RW.ImpedanceFreq = elegant_freq_sp;
        elegant_RW.ImpedanceRealZ = RW_impedance.ImpedanceRealZ;
        elegant_RW.ImpedanceImagZ = RW_impedance.ImpedanceImagZ;
        elegant_RW.ImpedanceRealX = RW_impedance.ImpedanceRealX;
        elegant_RW.ImpedanceImagX = RW_impedance.ImpedanceImagX;
        elegant_RW.ImpedanceRealY = RW_impedance.ImpedanceRealY;
        elegant_RW.ImpedanceImagY = RW_impedance.ImpedanceImagY;
        
    case 2 % Wake from IW2D
                
        % Generate wake using n_points sampled wake
        RW_wake = generate_IW2D_wake(resistive_wall_file,sp,beta_functions,convolution_bunch_length);            
        AT_RW = RW_wake;
                        
        % Resample convoluted wake for Elegant
        elegant_RW.WakeT = elegant_sp;           
        elegant_RW.WakeZ = interp1(RW_wake.WakeT,RW_wake.WakeZ,elegant_sp);
        elegant_RW.WakeDX = interp1(RW_wake.WakeT,RW_wake.WakeDX,elegant_sp);
        elegant_RW.WakeDY = interp1(RW_wake.WakeT,RW_wake.WakeDY,elegant_sp);
        elegant_RW.WakeQX = zeros(length(elegant_sp),1);       
        elegant_RW.WakeQY = zeros(length(elegant_sp),1);
        
        % Generate impedance for Elegant
        %TODO
        %RW_impedance = generate_analytic_resistive_wall_impedance(resistive_wall_file,elegant_freq_sp,beta_functions);
        
%         elegant_RW.ImpedanceFreq = elegant_freq_sp;
%         elegant_RW.ImpedanceRealZ = RW_impedance.ImpedanceRealZ;
%         elegant_RW.ImpedanceImagZ = RW_impedance.ImpedanceImagZ;
%         elegant_RW.ImpedanceRealX = RW_impedance.ImpedanceRealX;
%         elegant_RW.ImpedanceImagX = RW_impedance.ImpedanceImagX;
%         elegant_RW.ImpedanceRealY = RW_impedance.ImpedanceRealY;
%         elegant_RW.ImpedanceImagY = RW_impedance.ImpedanceImagY;
        
         elegant_RW.ImpedanceFreq = zeros(length(elegant_freq_sp),1);
        elegant_RW.ImpedanceRealZ = zeros(length(elegant_freq_sp),1);
        elegant_RW.ImpedanceImagZ = zeros(length(elegant_freq_sp),1);
        elegant_RW.ImpedanceRealX = zeros(length(elegant_freq_sp),1);
        elegant_RW.ImpedanceImagX = zeros(length(elegant_freq_sp),1);
        elegant_RW.ImpedanceRealY = zeros(length(elegant_freq_sp),1);
        elegant_RW.ImpedanceImagY = zeros(length(elegant_freq_sp),1);
                                    
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
        
        elegant_RW.ImpedanceFreq = zeros(length(elegant_freq_sp),1);
        elegant_RW.ImpedanceRealZ = zeros(length(elegant_freq_sp),1);
        elegant_RW.ImpedanceImagZ = zeros(length(elegant_freq_sp),1);
        elegant_RW.ImpedanceRealX = zeros(length(elegant_freq_sp),1);
        elegant_RW.ImpedanceImagX = zeros(length(elegant_freq_sp),1);
        elegant_RW.ImpedanceRealY = zeros(length(elegant_freq_sp),1);
        elegant_RW.ImpedanceImagY = zeros(length(elegant_freq_sp),1);
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

%% Combine structs into single impedance
% TODO Add geometric impedance

elegant_ImpedanceFreq = elegant_freq_sp;
elegant_ImpedanceRealZ = elegant_RW.ImpedanceRealZ;
elegant_ImpedanceImagZ = elegant_RW.ImpedanceImagZ;
elegant_ImpedanceRealX = elegant_RW.ImpedanceRealX;
elegant_ImpedanceImagX = elegant_RW.ImpedanceImagX;
elegant_ImpedanceRealY = elegant_RW.ImpedanceRealY;
elegant_ImpedanceImagY = elegant_RW.ImpedanceImagY;

%% Save txt file for import onto AT

fileID = fopen('wake_AT.txt','w');
fprintf(fileID,'WakeT [m] WakeZ [V/C] WakeDX WakeDY WakeQX WakeQY\n');

for i = 1:length(sp)
    fprintf(fileID,'%10.7f %10.7f %10.7f %10.7f %10.7f %10.7f\n',AT_WakeT(i),AT_WakeZ(i),AT_WakeDX(i),AT_WakeDY(i),AT_WakeQX(i),AT_WakeQY(i));
end
fclose(fileID);
 
%% Save txt file for import into Elegant

% Wake file
clight = 299792458;
time = elegant_WakeT./clight; % Change to time to match Elegant conventions
lon_wake = elegant_WakeZ; % Sign to match Elegant conventions

fileID = fopen('elegant_wake.txt','w');
for i = 1:length(time)
    fprintf(fileID,'%10e %10e\n',time(i),lon_wake(i));
end
fclose(fileID);
system('plaindata2sdds elegant_wake.txt wake_elegant.sdds -inputMode=ascii -outputMode=ascii -separator=" " -noRowCount -column=Time,double,units=s  -column=WakeZ,double,units=V/C');
delete('elegant_wake.txt');

% Impedance file
fileID = fopen('elegant_impedance.txt','w');
for i = 1:length(elegant_ImpedanceFreq)
    fprintf(fileID,'%10e %10e %10e\n',elegant_ImpedanceFreq(i),elegant_ImpedanceRealZ(i),elegant_ImpedanceImagZ(i));
end
fclose(fileID);
system('plaindata2sdds elegant_impedance.txt impedance_elegant.sdds -inputMode=ascii -outputMode=ascii -separator=" " -noRowCount -column=Freq,double,units=Hz  -column=RealZ,double,units=Ohm -column=ImagZ,double,units=Ohm');
delete('elegant_impedance.txt');

%% Plot wakes

figure(1)
plot(AT_WakeT,AT_WakeZ,'.')
hold on
plot(elegant_WakeT,elegant_WakeZ,'.')
hold off
xlabel('s [m]')
ylabel('Longitudinal wake [V/C]')
legend('AT','Elegant')

% figure(2)
% plot(AT_WakeT,AT_WakeDX,'.')
% hold on
% plot(elegant_WakeT,elegant_WakeDX,'.')
% hold off
% xlabel('s [m]')
% ylabel('Horizontal wake [V/C/m]')
% legend('AT','Elegant')
% 
% figure(3)
% plot(AT_WakeT,AT_WakeDY,'.')
% hold on
% plot(elegant_WakeT,elegant_WakeDY,'.')
% hold off
% xlabel('s [m]')
% ylabel('Vertical wake [V/C/m]')
% legend('AT','Elegant')

%% Plot impedance

figure(4)
subplot(211)
plot(elegant_ImpedanceFreq.*1e-9,elegant_ImpedanceRealZ,'.')
xlabel('Frequency [GHz]')
ylabel('Real lon. impedance [Ohm]')

subplot(212)
plot(elegant_ImpedanceFreq.*1e-9,elegant_ImpedanceImagZ,'.')
xlabel('Frequency [GHz]')
ylabel('Imag lon. impedance [Ohm]')

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



