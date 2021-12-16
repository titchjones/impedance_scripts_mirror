function IMPRING = impedance_BR_11_Booster(ID_config,neg_model,impedance_database_dir)
%% Impedance database for lattice BR_11

%% ID configurations
% ID_config = 0 - All IDs open
% ID_config = 1 - All IDs closed

switch ID_config
    
    case 0
        ID_ver_aper = [-0.015 0.015];        
    case 1
        ID_ver_aper = [-0.002 0.002];
        
end
       
%% NEG models
% neg_model = 0 - no NEG coating
% neg_model = 1 - conductivity 1e6 S/m, thickness 1.0 um
% neg_model = 2 - conductivity 1e5 S/m, thickness 1.0 um
% neg_model = 3 - conductivity 1e6 S/m, thickness 1.0 um

switch neg_model
    
    case 0
        coating_material = ['Copper'];
        coating_conductivity = [5.96e7];
        coating_thickness = [Inf];
        
        RW_impedance_circular = {'/dls/physics/Impedance/IW2D/copper-circular-10mm-inf-range0.1m-step1um/ZxdipWDiamond-II_1layers10.00mm_round_copper_1layer.dat'...
                           '/dls/physics/Impedance/IW2D/copper-circular-10mm-inf-range0.1m-step1um/ZydipWDiamond-II_1layers10.00mm_round_copper_1layer.dat'...
                           '/dls/physics/Impedance/IW2D/copper-circular-10mm-inf-range0.1m-step1um/ZlongWDiamond-II_1layers10.00mm_round_copper_1layer.dat'};
        
        RW_wake_circular = {'/dls/physics/Impedance/IW2D/copper-circular-10mm-inf-range0.1m-step1um/WxdipWDiamond-II_1layers10.00mm_round_copper_1layer.dat'...
                            '/dls/physics/Impedance/IW2D/copper-circular-10mm-inf-range0.1m-step1um/WydipWDiamond-II_1layers10.00mm_round_copper_1layer.dat'...
                            '/dls/physics/Impedance/IW2D/copper-circular-10mm-inf-range0.1m-step1um/WlongWDiamond-II_1layers10.00mm_round_copper_1layer.dat'};
                        
        RW_impedance_rectangular = {'/dls/physics/Impedance/IW2D/copper-rectangular-36mm-15mm-inf-range0.1m-step1um/ZxdipWDiamond-II_1layers15.00mm_rectangular_copper_1layer.dat'...
                              '/dls/physics/Impedance/IW2D/copper-rectangular-36mm-15mm-inf-range0.1m-step1um/ZydipWDiamond-II_1layers15.00mm_rectangular_copper_1layer.dat'...
                              '/dls/physics/Impedance/IW2D/copper-rectangular-36mm-15mm-inf-range0.1m-step1um/ZlongWDiamond-II_1layers15.00mm_rectangular_copper_1layer.dat'};
        
        RW_wake_rectangular = {'/dls/physics/Impedance/IW2D/copper-rectangular-36mm-15mm-inf-range0.1m-step1um/WxdipWDiamond-II_1layers15.00mm_rectangular_copper_1layer.dat'...
                               '/dls/physics/Impedance/IW2D/copper-rectangular-36mm-15mm-inf-range0.1m-step1um/WyipWDiamond-II_1layers15.00mm_rectangular_copper_1layer.dat'...
                               '/dls/physics/Impedance/IW2D/copper-rectangular-36mm-15mm-inf-range0.1m-step1um/WlongWDiamond-II_1layers15.00mm_rectangular_copper_1layer.dat'};                                
    case 1
        coating_material = ['NEG','Copper'];
        coating_conductivity = [1e6,5.96e7];
        coating_thickness = [1e-6,Inf];
        
        RW_impedance_circular = {'/dls/physics/Impedance/IW2D/copper-circular-10mm-inf-neg-1e6-1.0um-range0.1m-step1um/ZxdipWDiamond-II_2layers10.00mm_round_copper_neg.dat'...
                           '/dls/physics/Impedance/IW2D/copper-circular-10mm-inf-neg-1e6-1.0um-range0.1m-step1um/ZydipWDiamond-II_2layers10.00mm_round_copper_neg.dat'...
                           '/dls/physics/Impedance/IW2D/copper-circular-10mm-inf-neg-1e6-1.0um-range0.1m-step1um/ZlongWDiamond-II_2layers10.00mm_round_copper_neg.dat'};
        
        RW_wake_circular = {'/dls/physics/Impedance/IW2D/copper-circular-10mm-inf-neg-1e6-1.0um-range0.1m-step1um/WxdipWDiamond-II_2layers10.00mm_round_copper_neg.dat'...
                            '/dls/physics/Impedance/IW2D/copper-circular-10mm-inf-neg-1e6-1.0um-range0.1m-step1um/WydipWDiamond-II_2layers10.00mm_round_copper_neg.dat'...
                            '/dls/physics/Impedance/IW2D/copper-circular-10mm-inf-neg-1e6-1.0um-range0.1m-step1um/WlongWDiamond-II_2layers10.00mm_round_copper_neg.dat'};
                        
        RW_impedance_rectangular = {'/dls/physics/Impedance/IW2D/copper-rectangular-36mm-15mm-inf-neg-1e6-1.0um-range0.1m-step1um/ZxdipWDiamond-II_2layers15.00mm_round_copper_neg.dat'...
                              '/dls/physics/Impedance/IW2D/copper-rectangular-36mm-15mm-inf-neg-1e6-1.0um-range0.1m-step1um/ZydipWDiamond-II_2layers15.00mm_round_copper_neg.dat'...
                              '/dls/physics/Impedance/IW2D/copper-rectangular-36mm-15mm-inf-neg-1e6-1.0um-range0.1m-step1um/ZlongWDiamond-II_2layers15.00mm_round_copper_neg.dat'};
        
        RW_wake_rectangular = {'/dls/physics/Impedance/IW2D/copper-rectangular-36mm-15mm-inf-neg-1e6-1.0um-range0.1m-step1um/WxdipWDiamond-II_2layers15.00mm_round_copper_neg.dat'...
                               '/dls/physics/Impedance/IW2D/copper-rectangular-36mm-15mm-inf-neg-1e6-1.0um-range0.1m-step1um/WydipWDiamond-II_2layers15.00mm_round_copper_neg.dat'...
                               '/dls/physics/Impedance/IW2D/copper-rectangular-36mm-15mm-inf-neg-1e6-1.0um-range0.1m-step1um/WlongWDiamond-II_2layers15.00mm_round_copper_neg.dat'};         
    case 2
        coating_material = ['NEG','Copper'];
        coating_conductivity = [1e5,5.96e7];
        coating_thickness = [1e-6,Inf];
        
        RW_impedance_circular = {'/dls/physics/Impedance/IW2D/copper-circular-10mm-inf-neg-1e5-1.0um-range0.1m-step1um/ZxdipWDiamond-II_2layers10.00mm_round_copper_neg.dat'...
                           '/dls/physics/Impedance/IW2D/copper-circular-10mm-inf-neg-1e5-1.0um-range0.1m-step1um/ZydipWDiamond-II_2layers10.00mm_round_copper_neg.dat'...
                           '/dls/physics/Impedance/IW2D/copper-circular-10mm-inf-neg-1e5-1.0um-range0.1m-step1um/ZlongWDiamond-II_2layers10.00mm_round_copper_neg.dat'};
        
        RW_wake_circular = {'/dls/physics/Impedance/IW2D/copper-circular-10mm-inf-neg-1e5-1.0um-range0.1m-step1um/WxdipWDiamond-II_2layers10.00mm_round_copper_neg.dat'...
                            '/dls/physics/Impedance/IW2D/copper-circular-10mm-inf-neg-1e5-1.0um-range0.1m-step1um/WydipWDiamond-II_2layers10.00mm_round_copper_neg.dat'...
                            '/dls/physics/Impedance/IW2D/copper-circular-10mm-inf-neg-1e5-1.0um-range0.1m-step1um/WlongWDiamond-II_2layers10.00mm_round_copper_neg.dat'};
                        
        RW_impedance_rectangular = {'/dls/physics/Impedance/IW2D/copper-rectangular-36mm-15mm-inf-neg-1e5-1.0um-range0.1m-step1um/ZxdipWDiamond-II_2layers15.00mm_round_copper_neg.dat'...
                              '/dls/physics/Impedance/IW2D/copper-rectangular-36mm-15mm-inf-neg-1e5-1.0um-range0.1m-step1um/ZydipWDiamond-II_2layers15.00mm_round_copper_neg.dat'...
                              '/dls/physics/Impedance/IW2D/copper-rectangular-36mm-15mm-inf-neg-1e5-1.0um-range0.1m-step1um/ZlongWDiamond-II_2layers15.00mm_round_copper_neg.dat'};
        
        RW_wake_rectangular = {'/dls/physics/Impedance/IW2D/copper-rectangular-36mm-15mm-inf-neg-1e5-1.0um-range0.1m-step1um/WxdipWDiamond-II_2layers15.00mm_round_copper_neg.dat'...
                               '/dls/physics/Impedance/IW2D/copper-rectangular-36mm-15mm-inf-neg-1e5-1.0um-range0.1m-step1um/WydipWDiamond-II_2layers15.00mm_round_copper_neg.dat'...
                               '/dls/physics/Impedance/IW2D/copper-rectangular-36mm-15mm-inf-neg-1e5-1.0um-range0.1m-step1um/WlongWDiamond-II_2layers15.00mm_round_copper_neg.dat'};                 
        
    case 3
        coating_material = ['Steel316'];
        coating_conductivity = [1.3514e6];
        coating_thickness = [Inf];
        xfile = [impedance_database_dir, '\\Impedance\\Resistive wall\\rw_1m_12.5mm_stainless_impx.txt'];
        yfile = [impedance_database_dir, '\\Impedance\\Resistive wall\\rw_1m_12.5mm_stainless_impx.txt'];
        zfile = [impedance_database_dir, '\\Impedance\\Resistive wall\\rw_1m_12.5mm_stainless_impz.txt'];
        RW_impedance_circular = {join(xfile,'')...
                           join(yfile,'')...
                           join(zfile,'')};
        xfile = [impedance_database_dir, '\\Wakes\\Resistive wall\\rw_1m_12.5mm_stainless_wakex.txt'];
        yfile = [impedance_database_dir, '\\Wakes\\Resistive wall\\rw_1m_12.5mm_stainless_wakex.txt'];
        zfile = [impedance_database_dir, '\\Wakes\\Resistive wall\\rw_1m_12.5mm_stainless_wakez.txt'];       
        RW_wake_circular = {join(xfile,'')...
                           join(yfile,'')...
                           join(zfile,'')};
                       
        RW_impedance_rectangular = {'/dls/physics/Impedance/IW2D/copper-rectangular-36mm-15mm-inf-neg-1e5-1.0um-range0.1m-step1um/ZxdipWDiamond-II_2layers15.00mm_round_copper_neg.dat'...
                              '/dls/physics/Impedance/IW2D/copper-rectangular-36mm-15mm-inf-neg-1e5-1.0um-range0.1m-step1um/ZydipWDiamond-II_2layers15.00mm_round_copper_neg.dat'...
                              '/dls/physics/Impedance/IW2D/copper-rectangular-36mm-15mm-inf-neg-1e5-1.0um-range0.1m-step1um/ZlongWDiamond-II_2layers15.00mm_round_copper_neg.dat'};
        
        RW_wake_rectangular = {'/dls/physics/Impedance/IW2D/copper-rectangular-36mm-15mm-inf-neg-1e5-1.0um-range0.1m-step1um/WxdipWDiamond-II_2layers15.00mm_round_copper_neg.dat'...
                               '/dls/physics/Impedance/IW2D/copper-rectangular-36mm-15mm-inf-neg-1e5-1.0um-range0.1m-step1um/WydipWDiamond-II_2layers15.00mm_round_copper_neg.dat'...
                               '/dls/physics/Impedance/IW2D/copper-rectangular-36mm-15mm-inf-neg-1e5-1.0um-range0.1m-step1um/WlongWDiamond-II_2layers15.00mm_round_copper_neg.dat'};                 
        
end

%% Drifts

% --- Additional drifts ---
name = 'D1';
class = 'DRIFT';
length = 0.3;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D1 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D10';
class = 'DRIFT';
length = 0.04;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D10 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D11';
class = 'DRIFT';
length = 0.025;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D11 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D12';
class = 'DRIFT';
length = 0.0529;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D12 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D13';
class = 'DRIFT';
length = 0.0925;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D13 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D14';
class = 'DRIFT';
length = 0.085;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D14 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D15';
class = 'DRIFT';
length = 0.0031;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D15 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D16';
class = 'DRIFT';
length = 0.0409;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D16 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D17';
class = 'DRIFT';
length = 0.0341;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D17 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D18';
class = 'DRIFT';
length = 0.01;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D18 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D19';
class = 'DRIFT';
length = 0.0619;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D19 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D2';
class = 'DRIFT';
length = 0.2;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D2 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D20';
class = 'DRIFT';
length = 0.03;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D20 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D21';
class = 'DRIFT';
length = 0.0775;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D21 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D22';
class = 'DRIFT';
length = 0.05;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D22 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D24';
class = 'DRIFT';
length = 0.0216;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D24 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D25';
class = 'DRIFT';
length = 0.2914775;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D25 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D26A';
class = 'DRIFT';
length = 0.137101525665929;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D26A = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D26B';
class = 'DRIFT';
length = 0.154375974334071;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D26B = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D3';
class = 'DRIFT';
length = 0.015;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D3 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D4';
class = 'DRIFT';
length = 1.;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D4 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D5';
class = 'DRIFT';
length = 0.15;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D5 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D6';
class = 'DRIFT';
length = 0.1;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D6 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D7';
class = 'DRIFT';
length = 0.65;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D7 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D8';
class = 'DRIFT';
length = 0.07875;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D8 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'D9';
class = 'DRIFT';
length = 0.185;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
D9 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DBR14';
class = 'DRIFT';
length = 0.000021877746295;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_circular;
RW_wake_files = RW_wake_circular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);
 
DBR14 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};


%% Dipole vessel
% Includes BPM3, keyhole flange, pump

name = 'BD';
class = 'DIPOLE';
length = 1.3;
material = ['Aluminium'];
conductivity = [3.77e7];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {};
RW_wake_files = {};
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [-0.195,-0.0301,0.117];
geom_fit = struct([]);

BD = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'BF';
class = 'DIPOLE';
length = 1.3;
material = ['Aluminium'];
conductivity = [3.77e7];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {};
RW_wake_files = {};
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [-0.195,-0.0301,0.117];
geom_fit = struct([]);

BF = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};
  
name = 'BB';
class = 'DIPOLE';
length = 1.25;
material = ['Aluminium'];
conductivity = [3.77e7];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {};
RW_wake_files = {};
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [-0.195,-0.0301,0.117];
geom_fit = struct([]);

BB = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};
  
%% Septum vessel

name = 'INJSEPT';
class = 'SETPUM';
length = 0.3;
material = ['Aluminium'];
conductivity = [3.77e7];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {};
RW_wake_files = {};
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [];
geom_fit = struct([]);

INJSEPT = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};
  
name = 'EXTSEPT';
class = 'SETPUM';
length = 1.67;
material = ['Aluminium'];
conductivity = [3.77e7];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {};
RW_wake_files = {};
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [];
geom_fit = struct([]);

EXTSEPT = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};
  
%% Kicker

name = 'HCM';
class = 'KICKER';
length = 0.075;
material = ['Aluminium'];
conductivity = [3.77e7];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {};
RW_wake_files = {};
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [];
geom_fit = struct([]);

HCM = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};
  
name = 'VCM';
class = 'KICKER';
length = 0.075;
material = ['Aluminium'];
conductivity = [3.77e7];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {};
RW_wake_files = {};
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [];
geom_fit = struct([]);

VCM = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'INJKICK';
class = 'KICKER';
length = 0.3;
material = ['Aluminium'];
conductivity = [3.77e7];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {};
RW_wake_files = {};
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [];
geom_fit = struct([]);

INJKICK = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};
  
name = 'EXTKICK';
class = 'KICKER';
length = 0.3;
material = ['Aluminium'];
conductivity = [3.77e7];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {};
RW_wake_files = {};
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [];
geom_fit = struct([]);

EXTKICK = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};
  
%% Quad

name = 'QUAD';
class = 'QUADRUPOLE';
length = 0.45;
material = ['Aluminium'];
conductivity = [3.77e7];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {};
RW_wake_files = {};
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [];
geom_fit = struct([]);

QUAD = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};
  
%% Sextupole

name = 'SEXT';
class = 'SEXTUPOLE';
length = 0.05;
material = ['Aluminium'];
conductivity = [3.77e7];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {};
RW_wake_files = {};
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [];
geom_fit = struct([]);

SEXT = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

%% BPM assemblies

% --- BPM 1 ---
name = 'BPM1';
class = 'BPM';
length = 0.05;
material = ['Steel316'];
conductivity = [1.3514e6];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {};
RW_wake_files = {};
RW_k_factors = [0 0 0];
xfile = [impedance_database_dir, '\\Impedance\\BPM\\boosterII_bpm_10.9mm_pec_impx.txt'];
yfile = [impedance_database_dir, '\\Impedance\\BPM\\boosterII_bpm_10.9mm_pec_impy.txt'];
zfile = [impedance_database_dir, '\\Impedance\\BPM\\boosterII_bpm_10.9mm_pec_impz.txt'];
geom_impedance_files = {join(xfile,'')...
                           join(yfile,'')...
                           join(zfile,'')};
xfile = [impedance_database_dir, '\\Wakes\\BPM\\boosterII_bpm_10.9mm_pec_wx.txt'];
yfile = [impedance_database_dir, '\\Wakes\\BPM\\boosterII_bpm_10.9mm_pec_wy.txt'];
zfile = [impedance_database_dir, '\\Wakes\\BPM\\boosterII_bpm_10.9mm_pec_wz.txt'];
geom_wake_files = {join(xfile,'')...
                           join(yfile,'')...
                           join(zfile,'')};
geom_k_factors = [-0.0298,-0.0127,0.0806];
geom_fit = struct([]);

BPM1 = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};
  
%% Cavities

% --- Main cavity ---

name = 'MAINCAV';
class = 'CAVITY';
length = 1.3624;
material = ['Copper'];
conductivity = [5.96e7];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {};
RW_wake_files = {};
RW_k_factors = [0 0 0];
xfile = [impedance_database_dir, '\\Impedance\\NCC\\NCC_ImpX_ReIm_Correct.txt'];
yfile = [impedance_database_dir, '\\Impedance\\NCC\\NCC_ImpY_ReIm_Correct.txt'];
zfile = [impedance_database_dir, '\\Impedance\\NCC\\NCC_ImpZ_ReIm_Correct.txt'];
geom_impedance_files = {join(xfile,'')...
                           join(yfile,'')...
                           join(zfile,'')};
% Disable Cavities for now! 2021-12-16
geom_impedance_files = {};
geom_wake_files = {};
xfile = [impedance_database_dir, ''];
yfile = [impedance_database_dir, ''];
zfile = [impedance_database_dir, ''];
geom_wake_files = {join(xfile,'')...
                           join(yfile,'')...
                           join(zfile,'')};
geom_k_factors = [];
geom_fit = struct([]);

MAINCAV = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'TAPERUP';
class = 'TAPER';
length = 0.222;
material = ['Copper'];
conductivity = [5.96e7];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {};
RW_wake_files = {};
RW_k_factors = [0 0 0];
xfile = [impedance_database_dir, '\\Impedance\\NCC\\NCC_taperupstream_impx.txt'];
yfile = [impedance_database_dir, '\\Impedance\\NCC\\NCC_taperupstream_impx.txt'];
zfile = [impedance_database_dir, '\\Impedance\\NCC\\NCC_taperupstream_impz.txt'];
geom_impedance_files = {join(xfile,'')...
                           join(yfile,'')...
                           join(zfile,'')};
geom_wake_files = {};
xfile = [impedance_database_dir, ''];
yfile = [impedance_database_dir, ''];
zfile = [impedance_database_dir, ''];
geom_wake_files = {join(xfile,'')...
                           join(yfile,'')...
                           join(zfile,'')};
geom_k_factors = [];
geom_fit = struct([]);

TAPERUP = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'TAPERDOWN';
class = 'TAPER';
length = 0.2156;
material = ['Copper'];
conductivity = [5.96e7];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {};
RW_wake_files = {};
RW_k_factors = [0 0 0];
xfile = [impedance_database_dir, '\\Impedance\\NCC\\NCC_taperdownstream_impx.txt'];
yfile = [impedance_database_dir, '\\Impedance\\NCC\\NCC_taperdownstream_impx.txt'];
zfile = [impedance_database_dir, '\\Impedance\\NCC\\NCC_taperdownstream_impz.txt'];
geom_impedance_files = {join(xfile,'')...
                           join(yfile,'')...
                           join(zfile,'')};
geom_wake_files = {};
xfile = [impedance_database_dir, ''];
yfile = [impedance_database_dir, ''];
zfile = [impedance_database_dir, ''];
geom_wake_files = {join(xfile,'')...
                           join(yfile,'')...
                           join(zfile,'')};
geom_k_factors = [];
geom_fit = struct([]);

TAPERDOWN = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

%% Valves

name = 'VGVALVE';
class = 'VALVE';
length = 0.1;
material = ['Steel316'];
conductivity = [1.3514e6];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {};
RW_wake_files = {};
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [];
geom_fit = struct([]);

VGVALVE = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

%% Vacuum Pump

name = 'VPCHAMBER';
class = 'PUMP';
length = 0.15;
material = ['Steel316'];
conductivity = [1.3514e6];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {};
RW_wake_files = {};
RW_k_factors = [0 0 0];
xfile = [impedance_database_dir, '\\Impedance\\Pump\\boosterII_pumpsmall_v2_pec_impx.txt'];
yfile = [impedance_database_dir, '\\Impedance\\Pump\\boosterII_pumpsmall_v2_pec_impy.txt'];
zfile = [impedance_database_dir, '\\Impedance\\Pump\\boosterII_pumpsmall_v2_pec_impz.txt'];
geom_impedance_files = {join(xfile,'')...
                           join(yfile,'')...
                           join(zfile,'')};
xfile = [impedance_database_dir, '\\Wakes\\Pump\\boosterII_pumpsmall_v2_pec_wx.txt'];
yfile = [impedance_database_dir, '\\Wakes\\Pump\\boosterII_pumpsmall_v2_pec_wy.txt'];
zfile = [impedance_database_dir, '\\Wakes\\Pump\\boosterII_pumpsmall_v2_pec_wz.txt'];
geom_wake_files = {join(xfile,'')...
                           join(yfile,'')...
                           join(zfile,'')};
geom_k_factors = [];
geom_fit = struct([]);

VPCHAMBER = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};  

%% Diagnostics

name = 'SCREEN2';
class = 'SCREEN';
length = 0.2;
material = ['Steel316'];
conductivity = [1.3514e6];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {};
RW_wake_files = {};
RW_k_factors = [0 0 0];
xfile = [impedance_database_dir, '\\Impedance\\Screen\\boosterII_screen_v2_impx_pec.txt'];
yfile = [impedance_database_dir, '\\Impedance\\Screen\\boosterII_screen_v2_impy_pec.txt'];
zfile = [impedance_database_dir, '\\Impedance\\Screen\\boosterII_screen_v2_impz_pec.txt'];
geom_impedance_files = {join(xfile,'')...
                           join(yfile,'')...
                           join(zfile,'')};
xfile = [impedance_database_dir, '\\Wakes\\Screen\\boosterII_screen_v2_wx.txt'];
yfile = [impedance_database_dir, '\\Wakes\\Screen\\boosterII_screen_v2_wx.txt'];
zfile = [impedance_database_dir, '\\Wakes\\Screen\\boosterII_screen_v2_wz.txt'];
geom_wake_files = {join(xfile,'')...
                           join(yfile,'')...
                           join(zfile,'')};
geom_k_factors = [-0.00564,-0.0126,0.0821];
geom_fit = struct([]);

SCREEN2 = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};
  
%% Ceramic Break

name = 'CBREAK';
class = 'CBREAK';
length = 0.0381;
material = ['Steel316'];
conductivity = [1.3514e6];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {};
RW_wake_files = {};
RW_k_factors = [0 0 0];
xfile = [impedance_database_dir, '\\Impedance\\Ceramic\\boosterII_ceramic_impx.txt'];
yfile = [impedance_database_dir, '\\Impedance\\Ceramic\\boosterII_ceramic_impy.txt'];
zfile = [impedance_database_dir, '\\Impedance\\Ceramic\\boosterII_ceramic_impz.txt'];
geom_impedance_files = {join(xfile,'')...
                           join(yfile,'')...
                           join(zfile,'')};
xfile = [impedance_database_dir, '\\Wakes\\Ceramic\\boosterII_ceramic_wx.txt'];
yfile = [impedance_database_dir, '\\Wakes\\Ceramic\\boosterII_ceramic_wy.txt'];
zfile = [impedance_database_dir, '\\Wakes\\Ceramic\\boosterII_ceramic_wz.txt'];
geom_wake_files = {join(xfile,'')...
                           join(yfile,'')...
                           join(zfile,'')};
geom_k_factors = [-0.00564,-0.0126,0.0821];
geom_fit = struct([]);

CBREAK = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

%% Cells
LATTICE = [D26B; D2; BPM1; D22; QUAD; D2; QUAD; D22; VCM; D22; HCM; D22; QUAD; D18; 
D11; VPCHAMBER; D4; D6; D10; DBR14; VPCHAMBER; D11; BB; D6; BPM1; D22; QUAD; D11; 
VPCHAMBER; D21; VCM; D14; HCM; D13; D11; SEXT; D11; D6; D11; SEXT; D11; D6; QUAD; 
D6; D11; SEXT; D11; D13; HCM; D14; VCM; D10; BPM1; D24; D11; VPCHAMBER; D18; D11; 
SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; D15; 
D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; VGVALVE; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D19; CBREAK; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; VGVALVE; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D11; VPCHAMBER; D15; D6; D12; BPM1; D21; VCM; 
D14; HCM; D13; D11; SEXT; D11; D6; QUAD; D6; D11; SEXT; D11; D6; D11; SEXT; D11; 
D13; HCM; D14; VCM; D11; VPCHAMBER; D21; QUAD; D6; BPM1; D22; BB; D11; VPCHAMBER; 
DBR14; D5; D11; EXTKICK; D2; EXTKICK; D3; D5; VPCHAMBER; D11; D18; QUAD; D22; HCM; 
D22; VCM; D22; QUAD; D2; QUAD; D22; BPM1; D6; D11; D11; EXTKICK; D11; D11; D8; VGVALVE; 
D8; TAPERUP; MAINCAV; TAPERDOWN; D8; VGVALVE; D8; D25; D2; D22; SCREEN2; D22; EXTSEPT; D20; D2; D9; BPM1; 
D22; QUAD; D2; QUAD; D22; VCM; D22; HCM; D22; QUAD; D18; D11; VPCHAMBER; D10; D6; 
D4; DBR14; VPCHAMBER; D11; BB; D6; BPM1; D22; QUAD; D11; VPCHAMBER; D21; VCM; D14; 
HCM; D13; D11; SEXT; D11; D6; D11; SEXT; D11; D6; QUAD; D6; D11; SEXT; D11; D13; 
HCM; D14; VCM; D10; BPM1; D24; D11; VPCHAMBER; D18; D11; SEXT; D11; D19; BD; D16; 
VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; D15; D18; D11; SEXT; D11; D19; 
BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; D15; D18; D11; SEXT; 
D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; D15; D18; D11; 
SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; D15; 
D18; VGVALVE; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; D15; 
D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D19; CBREAK; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; VGVALVE; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D16; VCM; D17; BPM1; D17; HCM; D16; BF; D11; VPCHAMBER; 
D15; D18; D11; SEXT; D11; D19; BD; D11; VPCHAMBER; D15; D6; D12; BPM1; D21; VCM; 
D14; HCM; D13; D11; SEXT; D11; D6; QUAD; D6; D11; SEXT; D11; D6; D11; SEXT; D11; 
D13; HCM; D14; VCM; D11; VPCHAMBER; D21; QUAD; D6; BPM1; D22; BB; D11; VPCHAMBER; 
DBR14; D7; SCREEN2; D22; SCREEN2; D10; VPCHAMBER; D11; D18; QUAD; D22; HCM; D22; 
VCM; D22; QUAD; D2; QUAD; D22; BPM1; D2; D8; VGVALVE; D8; TAPERUP; MAINCAV; TAPERDOWN; D8; VGVALVE; D8; 
D9; D1; D1; D2; D26A; INJSEPT; D22; SCREEN2; D22; D11; VPCHAMBER; D1; D11; D1; INJKICK];

IMPRING = LATTICE;

