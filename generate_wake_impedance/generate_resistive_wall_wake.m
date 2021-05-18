function [AT_RW,elegant_RW] = generate_resistive_wall_wake(type,resistive_wall_file,sp,elegant_sp,beta_functions,convolution_bunch_length)

    if type == 1

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

    elseif type == 2

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
    end
           
end