%% Generate_wake
%% Script to generate input wake and impedance to AT and Elegant

%% Define input sources
% Resistive-wall flag: 0 = not include, 1 = analytic, 2 = IW2D
% Geometric flag: 0 = not include, 1 = analytic, 2 = CST

resistive_wall_flag = 1;
resistive_wall_file = 'analytic_resistive_wall.txt';
%resistive_wall_file = 'IW2D_resistive_wall.txt'; 

geometric_flag = 2;
%geometric_file = 'analytic_geometric_impedance.txt';
geometric_file = 'geometric_openIDS_noNEG.txt';

% Beta functions for transverse normalisation
% Beta flag: 0 = no normalisation, 1 = normalisation

beta_flag = 1;
beta_file = 'br14.txt';

%% Factors to multiply wakes/impedance
% Factors for increasing strength of wakes (mostly for testing purposes)

x_factor = 1;
y_factor = 1;
z_factor = 1;

%% Wake properties
% Unit: m

% Flag if wake should be generated or not
wake_flag = 0;

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

% Flag if impedance should be generated or not
impedance_flag = 1;

freq_range = 100e9;

% Frequency step to sample impedance for Elegant
elegant_freq_step = 1e7;

%% Interpolate beta functions for transverse normalisation 

if beta_flag == 1
    beta_functions = interpolate_beta(beta_file);
else
    beta_functions = struct([]);
end

%% Generate sampling points

if wake_flag    
    sp = generate_sampling_points(wake_range,n_points);
    elegant_sp = generate_elegant_wake_sampling_points(wake_range,elegant_bin_length);    
end

if impedance_flag
    elegant_freq_sp = generate_elegant_impedance_sampling_points(freq_range,elegant_freq_step);
end
    
%% Generate resitive-wall wake/impedance

if resistive_wall_flag
    fprintf('Resistive Wall included!\n')
    if wake_flag
        [AT_RW_wake,elegant_RW_wake] = generate_resistive_wall_wake(resistive_wall_flag,resistive_wall_file,sp,elegant_sp,beta_functions,convolution_bunch_length);
    end
    
    if impedance_flag
        elegant_RW_impedance = generate_resistive_wall_impedance(resistive_wall_flag,resistive_wall_file,elegant_freq_sp,beta_functions);    
    end
end
          
%% Generate geometric wake

if geometric_flag
    fprintf('Geometric effects included!\n')
    if wake_flag
        [AT_geom_wake,elegant_geom_wake] = generate_geometric_wake(geometric_flag,geometric_file,sp,elegant_sp,beta_functions,convolution_bunch_length);        
    end
    
    if impedance_flag
        elegant_geom_impedance = generate_geometric_impedance(geometric_flag,geometric_file,elegant_freq_sp,beta_functions);    
    end
    
end
     
%% Combine structs into single wake

if wake_flag   
    AT_wake.WakeT = sp;
    AT_wake.WakeZ = zeros(length(sp),1);
    AT_wake.WakeDX = zeros(length(sp),1);
    AT_wake.WakeDY = zeros(length(sp),1);
    AT_wake.WakeQX = zeros(length(sp),1);
    AT_wake.WakeQY = zeros(length(sp),1);
    
    elegant_wake.WakeT = elegant_sp;
    elegant_wake.WakeZ = zeros(length(elegant_sp),1);
    elegant_wake.WakeDX = zeros(length(elegant_sp),1);
    elegant_wake.WakeDY = zeros(length(elegant_sp),1); 
        
    if resistive_wall_flag
        AT_wake.WakeZ = AT_wake.WakeZ + AT_RW_wake.WakeZ;
        AT_wake.WakeDX = AT_wake.WakeDX + AT_RW_wake.WakeDX;
        AT_wake.WakeDY = AT_wake.WakeDY + AT_RW_wake.WakeDY;
        AT_wake.WakeQX = AT_wake.WakeQX + zeros(length(sp),1);
        AT_wake.WakeQY = AT_wake.WakeQY + zeros(length(sp),1);
        
        elegant_wake.WakeZ = elegant_wake.WakeZ + elegant_RW_wake.WakeZ;
        elegant_wake.WakeDX = elegant_wake.WakeDX + elegant_RW_wake.WakeDX;
        elegant_wake.WakeDY = elegant_wake.WakeDY + elegant_RW_wake.WakeDY;

    end
    
    if geometric_flag
        AT_wake.WakeZ = AT_wake.WakeZ + AT_geom_wake.WakeZ;
        AT_wake.WakeDX = AT_wake.WakeDX + AT_geom_wake.WakeDX;
        AT_wake.WakeDY = AT_wake.WakeDY + AT_geom_wake.WakeDY;
        AT_wake.WakeQX = AT_wake.WakeQX + zeros(length(sp),1);
        AT_wake.WakeQY = AT_wake.WakeQY + zeros(length(sp),1);
        
        elegant_wake.WakeZ = elegant_wake.WakeZ + elegant_geom_wake.WakeZ;
        elegant_wake.WakeDX = elegant_wake.WakeDX + elegant_geom_wake.WakeDX;
        elegant_wake.WakeDY = elegant_wake.WakeDY + elegant_geom_wake.WakeDY;
    end
    
    % Multiply with factors
    AT_wake.WakeZ = AT_wake.WakeZ.*z_factor;
    AT_wake.WakeDX = AT_wake.WakeDX.*x_factor;
    AT_wake.WakeDY = AT_wake.WakeDY.*y_factor;
    
    elegant_wake.WakeZ = elegant_wake.WakeZ.*z_factor;
    elegant_wake.WakeDX = elegant_wake.WakeDX.*x_factor;
    elegant_wake.WakeDY = elegant_wake.WakeDY.*y_factor;  
end

%% Combine structs into single impedance

if impedance_flag   
    elegant_impedance.ImpedanceFreq = elegant_freq_sp;
    elegant_impedance.ImpedanceRealZ = zeros(length(elegant_freq_sp),1);
    elegant_impedance.ImpedanceImagZ = zeros(length(elegant_freq_sp),1);
    elegant_impedance.ImpedanceRealX = zeros(length(elegant_freq_sp),1);
    elegant_impedance.ImpedanceImagX = zeros(length(elegant_freq_sp),1);
    elegant_impedance.ImpedanceRealY = zeros(length(elegant_freq_sp),1);
    elegant_impedance.ImpedanceImagY = zeros(length(elegant_freq_sp),1);
    
    if resistive_wall_flag
        
        elegant_impedance.ImpedanceRealZ = elegant_impedance.ImpedanceRealZ + elegant_RW_impedance.ImpedanceRealZ;
        elegant_impedance.ImpedanceImagZ = elegant_impedance.ImpedanceImagZ + elegant_RW_impedance.ImpedanceImagZ;
        elegant_impedance.ImpedanceRealX = elegant_impedance.ImpedanceRealX + elegant_RW_impedance.ImpedanceRealX;
        elegant_impedance.ImpedanceImagX = elegant_impedance.ImpedanceImagX + elegant_RW_impedance.ImpedanceImagX;
        elegant_impedance.ImpedanceRealY = elegant_impedance.ImpedanceRealY + elegant_RW_impedance.ImpedanceRealY;
        elegant_impedance.ImpedanceImagY = elegant_impedance.ImpedanceImagY + elegant_RW_impedance.ImpedanceImagY;
    end
    
    if geometric_flag
        
        elegant_impedance.ImpedanceRealZ = elegant_impedance.ImpedanceRealZ + elegant_geom_impedance.ImpedanceRealZ;
        elegant_impedance.ImpedanceImagZ = elegant_impedance.ImpedanceImagZ + elegant_geom_impedance.ImpedanceImagZ;
        elegant_impedance.ImpedanceRealX = elegant_impedance.ImpedanceRealX + elegant_geom_impedance.ImpedanceRealX;
        elegant_impedance.ImpedanceImagX = elegant_impedance.ImpedanceImagX + elegant_geom_impedance.ImpedanceImagX;
        elegant_impedance.ImpedanceRealY = elegant_impedance.ImpedanceRealY + elegant_geom_impedance.ImpedanceRealY;
        elegant_impedance.ImpedanceImagY = elegant_impedance.ImpedanceImagY + elegant_geom_impedance.ImpedanceImagY;
    
    end
    
    % Multiply with factors
    elegant_impedance.ImpedanceRealZ = elegant_impedance.ImpedanceRealZ.*z_factor;
    elegant_impedance.ImpedanceImagZ = elegant_impedance.ImpedanceImagZ.*z_factor;
    elegant_impedance.ImpedanceRealX = elegant_impedance.ImpedanceRealX.*x_factor;
    elegant_impedance.ImpedanceImagX = elegant_impedance.ImpedanceImagX.*x_factor;
    elegant_impedance.ImpedanceRealY = elegant_impedance.ImpedanceRealY.*y_factor;
    elegant_impedance.ImpedanceImagY = elegant_impedance.ImpedanceImagY.*y_factor;   
end

%% Save wake files

if wake_flag    
    save_AT_file(AT_wake);   
    save_elegant_wake_file(elegant_wake);  
end
 
%% Save impedance file

if impedance_flag 
    save_elegant_impedance_file(elegant_impedance);    
end

%% Plot wakes

if wake_flag

    figure(1)
    plot(AT_wake.WakeT,AT_wake.WakeZ,'.')
    hold on
    plot(elegant_wake.WakeT,elegant_wake.WakeZ,'.')
    hold off
    xlabel('s [m]')
    ylabel('Longitudinal wake [V/C]')
    legend('AT','Elegant')

    figure(2)
    plot(AT_wake.WakeT,AT_wake.WakeDX,'.')
    hold on
    plot(elegant_wake.WakeT,elegant_wake.WakeDX,'.')
    hold off
    xlabel('s [m]')
    ylabel('Horizontal wake [V/C/m]')
    legend('AT','Elegant')

    figure(3)
    plot(AT_wake.WakeT,AT_wake.WakeDY,'.')
    hold on
    plot(elegant_wake.WakeT,elegant_wake.WakeDY,'.')
    hold off
    xlabel('s [m]')
    ylabel('Vertical wake [V/C/m]')
    legend('AT','Elegant')
end

%% Plot impedance

if impedance_flag

    figure(4)
    subplot(211)
    plot(elegant_impedance.ImpedanceFreq.*1e-9,elegant_impedance.ImpedanceRealZ,'.')
    xlabel('Frequency [GHz]')
    ylabel('Real lon. impedance [Ohm]')

    subplot(212)
    plot(elegant_impedance.ImpedanceFreq.*1e-9,elegant_impedance.ImpedanceImagZ,'.')
    xlabel('Frequency [GHz]')
    ylabel('Imag lon. impedance [Ohm]')

    figure(5)
    subplot(211)
    plot(elegant_impedance.ImpedanceFreq.*1e-9,elegant_impedance.ImpedanceRealX,'.')
    xlabel('Frequency [GHz]')
    ylabel('Real hor. impedance [Ohm]')

    subplot(212)
    plot(elegant_impedance.ImpedanceFreq.*1e-9,elegant_impedance.ImpedanceImagX,'.')
    xlabel('Frequency [GHz]')
    ylabel('Imag hor. impedance [Ohm]')

    figure(6)
    subplot(211)
    plot(elegant_impedance.ImpedanceFreq.*1e-9,elegant_impedance.ImpedanceRealY,'.')
    xlabel('Frequency [GHz]')
    ylabel('Real ver. impedance [Ohm]')

    subplot(212)
    plot(elegant_impedance.ImpedanceFreq.*1e-9,elegant_impedance.ImpedanceImagY,'.')
    xlabel('Frequency [GHz]')
    ylabel('Imag ver. impedance [Ohm]')
    
end

% %% Save mat files
% save('wake.mat','AT_WakeT','AT_WakeZ','AT_WakeDX','AT_WakeDY','AT_WakeQX','AT_WakeQY','elegant_WakeT','elegant_WakeZ','elegant_WakeDX','elegant_WakeDY','elegant_WakeQX','elegant_WakeQY');
% 
% save('impedance.mat','elegant_ImpedanceFreq','elegant_ImpedanceRealZ','elegant_ImpedanceImagZ','elegant_ImpedanceRealX','elegant_ImpedanceImagX','elegant_ImpedanceRealY','elegant_ImpedanceImagY');
