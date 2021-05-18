function elegant_RW = generate_resistive_wall_impedance(type,resistive_wall_file,elegant_freq_sp,beta_functions)

    if type == 1

        RW_impedance = generate_analytic_resistive_wall_impedance(resistive_wall_file,elegant_freq_sp,beta_functions);

        elegant_RW.ImpedanceFreq = elegant_freq_sp;
        elegant_RW.ImpedanceRealZ = RW_impedance.ImpedanceRealZ;
        elegant_RW.ImpedanceImagZ = RW_impedance.ImpedanceImagZ;
        elegant_RW.ImpedanceRealX = RW_impedance.ImpedanceRealX;
        elegant_RW.ImpedanceImagX = RW_impedance.ImpedanceImagX;
        elegant_RW.ImpedanceRealY = RW_impedance.ImpedanceRealY;
        elegant_RW.ImpedanceImagY = RW_impedance.ImpedanceImagY;
        
    elseif type == 2

        RW_impedance = import_IW2D_impedance(resistive_wall_file,elegant_freq_sp,beta_functions);
        
        elegant_RW.ImpedanceFreq = elegant_freq_sp;
        elegant_RW.ImpedanceRealZ = RW_impedance.ImpedanceRealZ;
        elegant_RW.ImpedanceImagZ = RW_impedance.ImpedanceImagZ;
        elegant_RW.ImpedanceRealX = RW_impedance.ImpedanceRealX;
        elegant_RW.ImpedanceImagX = RW_impedance.ImpedanceImagX;
        elegant_RW.ImpedanceRealY = RW_impedance.ImpedanceRealY;
        elegant_RW.ImpedanceImagY = RW_impedance.ImpedanceImagY;
    end

end