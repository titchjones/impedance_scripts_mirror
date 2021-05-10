%% Generate_wake
%% Script to generate input wake and impedance to AT and Elegant

%% Define input sources
% Resistive-wall flag: 0 = not include, 1 = analytic, 2 = IW2D
% Geometric flag: 0 = not include, 1 = analytic, 2 = CST

resistive_wall_flag = 1;
resistive_wall_file = 'analytic_resistive_wall.txt';
%resistive_wall_file = 'IW2D_resistive_wall.txt'; 

geometric_flag = 0;
%geometric_file = 'analytic_geometric_impedance.txt';
%geometric_file = 'CST_geometric_impedance.txt';

% Beta functions for transverse normalisation
% Beta flag: 0 = no normalisation, 1 = normalisation

beta_flag = 1;
beta_file = 'beta.txt';

%% Factors to multiply wakes/impedance
% Factors for increasing strength of wakes (mostly for testing purposes)

x_factor = 1;
y_factor = 1;
z_factor = 1;

%% Wake properties
% Unit: m

wake_range = 0.1;

% Number or points to sample wake
n_points = 1e6;

% Bin length to sample wake for Elegant
elegant_bin_length = 10e-6; % Bin length

convolution_bunch_length = 3e-3; % Bunch length to convolute wake function: necessary for longitudinal resistive-wall 
                                   % wake to reduce number of bins in simulation and for analytic longitudinal
                                   % geometric wake to include resistive and inductive offset

%% Impedance properties
% Unit: Hz

freq_range = 500e9;

% Frequency step to sample impedance for Elegant
elegant_freq_step = 1e6;

%% Interpolate beta functions for transverse normalisation 

if beta_flag == 1
    beta_functions = interpolate_beta(beta_file);
else
    beta_functions = struct([]);
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
fprintf('Elegant frequency step is adjusted to %10e\n to have 2^n+1 number of points\n',elegant_freq_step);

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
            elegant_RW.WakeDX = -interp1(RW_wake.WakeT,RW_wake.WakeDX,elegant_sp); % Change sign to match Elegant conventions
            elegant_RW.WakeDY = -interp1(RW_wake.WakeT,RW_wake.WakeDY,elegant_sp); % Change sign to match Elegant conventions
            elegant_RW.WakeQX = zeros(length(elegant_sp),1);       
            elegant_RW.WakeQY = zeros(length(elegant_sp),1);      
                    
        else
            AT_RW = generate_analytic_resistive_wall_wake(resistive_wall_file,sp,beta_functions,0);
             
            % Calculate wake directly using Elegant bin length
            elegant_RW = generate_analytic_resistive_wall_wake(resistive_wall_file,elegant_sp,beta_functions,0);
            elegant_RW.WakeDX = -elegant_RW.WakeDX; % Change sign to match Elegant conventions
            elegant_RW.WakeDY = -elegant_RW.WakeDY; % Change sign to match Elegant conventions
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
        
    case 2 % From IW2D
                
        % Generate wake using n_points sampled wake
        RW_wake = import_IW2D_wake(resistive_wall_file,sp,beta_functions,convolution_bunch_length);            
        AT_RW = RW_wake;
                        
        % Resample convoluted wake for Elegant
        elegant_RW.WakeT = elegant_sp;           
        elegant_RW.WakeZ = interp1(RW_wake.WakeT,RW_wake.WakeZ,elegant_sp);
        elegant_RW.WakeDX = -interp1(RW_wake.WakeT,RW_wake.WakeDX,elegant_sp); % Change sign to match Elegant conventions
        elegant_RW.WakeDY = -interp1(RW_wake.WakeT,RW_wake.WakeDY,elegant_sp); % Change sign to match Elegant conventions
        elegant_RW.WakeQX = zeros(length(elegant_sp),1);       
        elegant_RW.WakeQY = zeros(length(elegant_sp),1);
        
        % Generate impedance for Elegant
        RW_impedance = import_IW2D_impedance(resistive_wall_file,elegant_freq_sp,beta_functions);
        
        elegant_RW.ImpedanceFreq = elegant_freq_sp;
        elegant_RW.ImpedanceRealZ = RW_impedance.ImpedanceRealZ;
        elegant_RW.ImpedanceImagZ = RW_impedance.ImpedanceImagZ;
        elegant_RW.ImpedanceRealX = RW_impedance.ImpedanceRealX;
        elegant_RW.ImpedanceImagX = RW_impedance.ImpedanceImagX;
        elegant_RW.ImpedanceRealY = RW_impedance.ImpedanceRealY;
        elegant_RW.ImpedanceImagY = RW_impedance.ImpedanceImagY;
                                             
    otherwise           
        AT_RW.WakeZ = zeros(length(sp),1);
        AT_RW.WakeDX = zeros(length(sp),1);
        AT_RW.WakeDY = zeros(length(sp),1);        
        AT_RW.WakeQX = zeros(length(sp),1);       
        AT_RW.WakeQY = zeros(length(sp),1);
    
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
    
    case 1 % Analytic
        
        % Generate wakes for AT and Elegant
        if convolution_bunch_length ~= 0
            
            % Generate wake using n_points sampled wake
            geom_wake = generate_analytic_geometric_wake(geometric_file,sp,beta_functions,convolution_bunch_length);            
            AT_geom = geom_wake;
                        
            % Resample convoluted wake for Elegant
            elegant_geom.WakeT = elegant_sp;           
            elegant_geom.WakeZ = interp1(geom_wake.WakeT,geom_wake.WakeZ,elegant_sp);
            elegant_geom.WakeDX = interp1(geom_wake.WakeT,geom_wake.WakeDX,elegant_sp);
            elegant_geom.WakeDY = interp1(geom_wake.WakeT,geom_wake.WakeDY,elegant_sp);
            elegant_geom.WakeQX = zeros(length(elegant_sp),1);       
            elegant_geom.WakeQY = zeros(length(elegant_sp),1);  
                    
        else
            AT_geom = generate_analytic_geometric_wake(geometric_file,sp,beta_functions,0);
             
            % Calculate wake directly using Elegant bin length
            elegant_geom = generate_analytic_geometric_wake(geometric_file,elegant_sp,beta_functions,0);
        end
        
        % Generate impedance for Elegant        
        geom_impedance = generate_analytic_geometric_impedance(geometric_file,elegant_freq_sp,beta_functions);
        
        elegant_geom.ImpedanceFreq = elegant_freq_sp;
        elegant_geom.ImpedanceRealZ = geom_impedance.ImpedanceRealZ;
        elegant_geom.ImpedanceImagZ = geom_impedance.ImpedanceImagZ;
        elegant_geom.ImpedanceRealX = geom_impedance.ImpedanceRealX;
        elegant_geom.ImpedanceImagX = geom_impedance.ImpedanceImagX;
        elegant_geom.ImpedanceRealY = geom_impedance.ImpedanceRealY;
        elegant_geom.ImpedanceImagY = geom_impedance.ImpedanceImagY;    
        
    case 2 % Wake from CST
               
        % Generate wake using n_points sampled wake
        geom_wake = import_CST_wake(geometric_file,sp,beta_functions);            
        AT_geom = geom_wake;
                        
        % Resample convoluted wake for Elegant
        elegant_geom.WakeT = elegant_sp;           
        elegant_geom.WakeZ = interp1(geom_wake.WakeT,geom_wake.WakeZ,elegant_sp);
        elegant_geom.WakeDX = interp1(geom_wake.WakeT,geom_wake.WakeDX,elegant_sp);
        elegant_geom.WakeDY = interp1(geom_wake.WakeT,geom_wake.WakeDY,elegant_sp);
        elegant_geom.WakeQX = zeros(length(elegant_sp),1);       
        elegant_geom.WakeQY = zeros(length(elegant_sp),1);
        
        % Generate impedance for Elegant
        geom_impedance = import_CST_impedance(geometric_file,elegant_freq_sp,beta_functions);
        
        elegant_geom.ImpedanceFreq = elegant_freq_sp;
        elegant_geom.ImpedanceRealZ = geom_impedance.ImpedanceRealZ;
        elegant_geom.ImpedanceImagZ = geom_impedance.ImpedanceImagZ;
        elegant_geom.ImpedanceRealX = geom_impedance.ImpedanceRealX;
        elegant_geom.ImpedanceImagX = geom_impedance.ImpedanceImagX;
        elegant_geom.ImpedanceRealY = geom_impedance.ImpedanceRealY;
        elegant_geom.ImpedanceImagY = geom_impedance.ImpedanceImagY;
                                             
                            
    otherwise      
        AT_geom.WakeZ = zeros(length(sp),1);
        AT_geom.WakeDX = zeros(length(sp),1);
        AT_geom.WakeDY = zeros(length(sp),1);        
        AT_geom.WakeQX = zeros(length(sp),1);       
        AT_geom.WakeQY = zeros(length(sp),1);
  
        elegant_geom.WakeZ = zeros(length(elegant_sp),1);
        elegant_geom.WakeDX = zeros(length(elegant_sp),1);
        elegant_geom.WakeDY = zeros(length(elegant_sp),1);        
        elegant_geom.WakeQX = zeros(length(elegant_sp),1);       
        elegant_geom.WakeQY = zeros(length(elegant_sp),1);
        
        elegant_geom.ImpedanceFreq = zeros(length(elegant_freq_sp),1);
        elegant_geom.ImpedanceRealZ = zeros(length(elegant_freq_sp),1);
        elegant_geom.ImpedanceImagZ = zeros(length(elegant_freq_sp),1);
        elegant_geom.ImpedanceRealX = zeros(length(elegant_freq_sp),1);
        elegant_geom.ImpedanceImagX = zeros(length(elegant_freq_sp),1);
        elegant_geom.ImpedanceRealY = zeros(length(elegant_freq_sp),1);
        elegant_geom.ImpedanceImagY = zeros(length(elegant_freq_sp),1);        
end
    
%% Combine structs into single wake

AT_WakeT = sp;
AT_WakeZ = (AT_RW.WakeZ + AT_geom.WakeZ).*z_factor;
AT_WakeDX = (AT_RW.WakeDX + AT_geom.WakeDX).*x_factor;
AT_WakeDY = (AT_RW.WakeDY + AT_geom.WakeDY).*y_factor;
AT_WakeQX = AT_RW.WakeQX + AT_geom.WakeQX;
AT_WakeQY = AT_RW.WakeQY + AT_geom.WakeQY;

elegant_WakeT = elegant_sp;
elegant_WakeZ = (elegant_RW.WakeZ + elegant_geom.WakeZ).*z_factor;
elegant_WakeDX = (elegant_RW.WakeDX + elegant_geom.WakeDX).*x_factor;
elegant_WakeDY = (elegant_RW.WakeDY + elegant_geom.WakeDY).*y_factor;
elegant_WakeQX = elegant_RW.WakeQX + elegant_geom.WakeQX;
elegant_WakeQY = elegant_RW.WakeQY + elegant_geom.WakeQY;

%% Combine structs into single impedance

elegant_ImpedanceFreq = elegant_freq_sp;
elegant_ImpedanceRealZ = (elegant_RW.ImpedanceRealZ + elegant_geom.ImpedanceRealZ).*z_factor;
elegant_ImpedanceImagZ = (elegant_RW.ImpedanceImagZ + elegant_geom.ImpedanceImagZ).*z_factor;
elegant_ImpedanceRealX = (elegant_RW.ImpedanceRealX + elegant_geom.ImpedanceRealX).*x_factor;
elegant_ImpedanceImagX = (elegant_RW.ImpedanceImagX + elegant_geom.ImpedanceImagX).*x_factor;
elegant_ImpedanceRealY = (elegant_RW.ImpedanceRealY + elegant_geom.ImpedanceRealY).*y_factor;
elegant_ImpedanceImagY = (elegant_RW.ImpedanceImagY + elegant_geom.ImpedanceImagY).*y_factor;

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
% hor_wake = -elegant_WakeDX; % Sign to match Elegant conventions
% ver_wake = -elegant_WakeDY; % Sign to match Elegant conventions
hor_wake = elegant_WakeDX;
ver_wake = elegant_WakeDY;

fileID = fopen('elegant_wake.txt','w');
for i = 1:length(time)
    fprintf(fileID,'%10e %10e %10e %10e\n',time(i),lon_wake(i),hor_wake(i),ver_wake(i));
end
fclose(fileID);
system('plaindata2sdds elegant_wake.txt wake_elegant.sdds -inputMode=ascii -outputMode=ascii -separator=" " -noRowCount -column=Time,double,units=s  -column=WakeZ,double,units=V/C -column=WakeDX,double,units=V/C/m -column=WakeDY,double,units=V/C/m');
delete('elegant_wake.txt')

% Impedance file
% fileID = fopen('elegant_impedance.txt','w');
% for i = 1:length(elegant_ImpedanceFreq)
%     fprintf(fileID,'%10e %10e %10e\n',elegant_ImpedanceFreq(i),elegant_ImpedanceRealZ(i),elegant_ImpedanceImagZ(i));
% end
% fclose(fileID);
% system('plaindata2sdds elegant_impedance.txt impedance_elegant.sdds -inputMode=ascii -outputMode=ascii -separator=" " -noRowCount -column=Freq,double,units=Hz  -column=RealZ,double,units=Ohm -column=ImagZ,double,units=Ohm');
% delete('elegant_impedance.txt');

fileID = fopen('elegant_real_impedance.txt','w');
for i = 1:length(elegant_ImpedanceFreq)
    fprintf(fileID,'%10e %10e\n',elegant_ImpedanceFreq(i),elegant_ImpedanceRealZ(i));
end
fclose(fileID);
system('plaindata2sdds elegant_real_impedance.txt impedance_real_elegant.sdds -inputMode=ascii -outputMode=ascii -separator=" " -noRowCount -column=Freq,double,units=Hz  -column=RealZ,double,units=Ohm');
delete('elegant_real_impedance.txt');

fileID = fopen('elegant_imag_impedance.txt','w');
for i = 1:length(elegant_ImpedanceFreq)
    fprintf(fileID,'%10e %10e\n',elegant_ImpedanceFreq(i),elegant_ImpedanceImagZ(i));
end
fclose(fileID);
system('plaindata2sdds elegant_imag_impedance.txt impedance_imag_elegant.sdds -inputMode=ascii -outputMode=ascii -separator=" " -noRowCount -column=Freq,double,units=Hz  -column=ImagZ,double,units=Ohm');
delete('elegant_imag_impedance.txt');

fileID = fopen('elegant_transverse_impedance.txt','w');
for i = 1:length(elegant_ImpedanceFreq)
    fprintf(fileID,'%10e %10e %10e %10e %10e\n',elegant_ImpedanceFreq(i),elegant_ImpedanceRealX(i),elegant_ImpedanceImagX(i),elegant_ImpedanceRealY(i),elegant_ImpedanceImagY(i));
end
fclose(fileID);
system('plaindata2sdds elegant_transverse_impedance.txt impedance_transverse_elegant.sdds -inputMode=ascii -outputMode=ascii -separator=" " -noRowCount -column=Freq,double,units=Hz  -column=RealX,double,units=Ohm/m -column=ImagX,double,units=Ohm/m -column=RealY,double,units=Ohm/m -column=ImagY,double,units=Ohm/m');
delete('elegant_transverse_impedance.txt');

%% Plot wakes

figure(1)
plot(AT_WakeT,AT_WakeZ,'.')
hold on
plot(elegant_WakeT,elegant_WakeZ,'.')
hold off
xlabel('s [m]')
ylabel('Longitudinal wake [V/C]')
legend('AT','Elegant')

figure(2)
plot(AT_WakeT,AT_WakeDX,'.')
hold on
plot(elegant_WakeT,elegant_WakeDX,'.')
hold off
xlabel('s [m]')
ylabel('Horizontal wake [V/C/m]')
legend('AT','Elegant')

figure(3)
plot(AT_WakeT,AT_WakeDY,'.')
hold on
plot(elegant_WakeT,elegant_WakeDY,'.')
hold off
xlabel('s [m]')
ylabel('Vertical wake [V/C/m]')
legend('AT','Elegant')

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

figure(5)
subplot(211)
plot(elegant_ImpedanceFreq.*1e-9,elegant_ImpedanceRealX,'.')
xlabel('Frequency [GHz]')
ylabel('Real hor. impedance [Ohm]')

subplot(212)
plot(elegant_ImpedanceFreq.*1e-9,elegant_ImpedanceImagX,'.')
xlabel('Frequency [GHz]')
ylabel('Imag hor. impedance [Ohm]')

figure(6)
subplot(211)
plot(elegant_ImpedanceFreq.*1e-9,elegant_ImpedanceRealY,'.')
xlabel('Frequency [GHz]')
ylabel('Real ver. impedance [Ohm]')

subplot(212)
plot(elegant_ImpedanceFreq.*1e-9,elegant_ImpedanceImagY,'.')
xlabel('Frequency [GHz]')
ylabel('Imag ver. impedance [Ohm]')

%% Save mat files
save('wake.mat','AT_WakeT','AT_WakeZ','AT_WakeDX','AT_WakeDY','AT_WakeQX','AT_WakeQY','elegant_WakeT','elegant_WakeZ','elegant_WakeDX','elegant_WakeDY','elegant_WakeQX','elegant_WakeQY');

save('impedance.mat','elegant_ImpedanceFreq','elegant_ImpedanceRealZ','elegant_ImpedanceImagZ','elegant_ImpedanceRealX','elegant_ImpedanceImagX','elegant_ImpedanceRealY','elegant_ImpedanceImagY');
