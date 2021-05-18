function elegant_geom = generate_geometric_impedance(type,geometric_file,elegant_freq_sp,beta_functions)

    if type == 1
        
        % Generate impedance for Elegant
        geom_impedance = generate_analytic_geometric_impedance(geometric_file,elegant_freq_sp,beta_functions);
        
        elegant_geom.ImpedanceFreq = elegant_freq_sp;
        elegant_geom.ImpedanceRealZ = geom_impedance.ImpedanceRealZ;
        elegant_geom.ImpedanceImagZ = geom_impedance.ImpedanceImagZ;
        elegant_geom.ImpedanceRealX = geom_impedance.ImpedanceRealX;
        elegant_geom.ImpedanceImagX = geom_impedance.ImpedanceImagX;
        elegant_geom.ImpedanceRealY = geom_impedance.ImpedanceRealY;
        elegant_geom.ImpedanceImagY = geom_impedance.ImpedanceImagY; 
        
    elseif type == 2
        
        % Generate impedance for Elegant
        geom_impedance = import_CST_impedance(geometric_file,elegant_freq_sp,beta_functions);
        
        elegant_geom.ImpedanceFreq = elegant_freq_sp;
        elegant_geom.ImpedanceRealZ = geom_impedance.ImpedanceRealZ;
        elegant_geom.ImpedanceImagZ = geom_impedance.ImpedanceImagZ;
        elegant_geom.ImpedanceRealX = geom_impedance.ImpedanceRealX;
        elegant_geom.ImpedanceImagX = geom_impedance.ImpedanceImagX;
        elegant_geom.ImpedanceRealY = geom_impedance.ImpedanceRealY;
        elegant_geom.ImpedanceImagY = geom_impedance.ImpedanceImagY;
    end
end
