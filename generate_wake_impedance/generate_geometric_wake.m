function [AT_geom,elegant_geom] = generate_geometric_wake(type,geometric_file,sp,elegant_sp,beta_functions,convolution_bunch_length)

    if type == 1
        
        % Generate wakes for AT and Elegant
        if convolution_bunch_length ~= 0
            
            % Generate wake using n_points sampled wake
            geom_wake = generate_analytic_geometric_wake(geometric_file,sp,beta_functions,convolution_bunch_length);            
            AT_geom = geom_wake;
                        
            % Resample convoluted wake for Elegant
            elegant_geom.WakeT = elegant_sp;           
            elegant_geom.WakeZ = interp1(geom_wake.WakeT,geom_wake.WakeZ,elegant_sp);
            elegant_geom.WakeDX = -interp1(geom_wake.WakeT,geom_wake.WakeDX,elegant_sp); % Change sign to match Elegant conventions
            elegant_geom.WakeDY = -interp1(geom_wake.WakeT,geom_wake.WakeDY,elegant_sp); % Change sign to match Elegant conventions
            elegant_geom.WakeQX = zeros(length(elegant_sp),1);       
            elegant_geom.WakeQY = zeros(length(elegant_sp),1);  
                    
        else
            AT_geom = generate_analytic_geometric_wake(geometric_file,sp,beta_functions,0);
             
            % Calculate wake directly using Elegant bin length
            elegant_geom = generate_analytic_geometric_wake(geometric_file,elegant_sp,beta_functions,0);
            elegant_geom.WakeDX = -elegant_RW.WakeDX; % Change sign to match Elegant conventions
            elegant_geom.WakeDY = -elegant_RW.WakeDY; % Change sign to match Elegant conventions            
        end
        
    elseif type == 2
        
        % Generate wake using n_points sampled wake
        geom_wake = import_CST_wake(geometric_file,sp,beta_functions);            
        AT_geom = geom_wake;
                        
        % Resample convoluted wake for Elegant
        elegant_geom.WakeT = elegant_sp;           
        elegant_geom.WakeZ = interp1(geom_wake.WakeT,geom_wake.WakeZ,elegant_sp);
        elegant_geom.WakeDX = -interp1(geom_wake.WakeT,geom_wake.WakeDX,elegant_sp); % Change sign to match Elegant conventions
        elegant_geom.WakeDY = -interp1(geom_wake.WakeT,geom_wake.WakeDY,elegant_sp); % Change sign to match Elegant conventions
        elegant_geom.WakeQX = zeros(length(elegant_sp),1);       
        elegant_geom.WakeQY = zeros(length(elegant_sp),1);
    end
end