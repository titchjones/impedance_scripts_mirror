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
name = 'DRIFT01';
class = 'DRIFT';
length = 0.345739;
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
 
DRIFT01 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT02';
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
 
DRIFT02 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT03';
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
 
DRIFT03 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT04';
class = 'DRIFT';
length = 0.035;
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
 
DRIFT04 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT05';
class = 'DRIFT';
length = 1.14002;
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
 
DRIFT05 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT06';
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
 
DRIFT06 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT07';
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
 
DRIFT07 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT08';
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
 
DRIFT08 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT09';
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
 
DRIFT09 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT10';
class = 'DRIFT';
length = 0.1175;
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
 
DRIFT10 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT11';
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
 
DRIFT11 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT12';
class = 'DRIFT';
length = 0.125;
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
 
DRIFT12 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT13';
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
 
DRIFT13 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT14';
class = 'DRIFT';
length = 0.0466;
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
 
DRIFT14 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT15';
class = 'DRIFT';
length = 0.0869;
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
 
DRIFT15 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT16';
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
 
DRIFT16 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT17';
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
 
DRIFT17 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT18';
class = 'DRIFT';
length = 0.0381;
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
 
DRIFT18 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT19';
class = 'DRIFT';
length = 0.0131;
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
 
DRIFT19 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT20';
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
 
DRIFT20 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT21';
class = 'DRIFT';
length = 0.075;
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
 
DRIFT21 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT22';
class = 'DRIFT';
length = 0.156;
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
 
DRIFT22 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT23';
class = 'DRIFT';
length = 0.175022;
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
 
DRIFT23 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT24';
class = 'DRIFT';
length = 0.165;
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
 
DRIFT24 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT25';
class = 'DRIFT';
length = 0.12875;
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
 
DRIFT25 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT26';
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
 
DRIFT26 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT26UP';
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
 
DRIFT26UP = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT26DOWN';
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
 
DRIFT26DOWN = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

  
name = 'DRIFT27';
class = 'DRIFT';
length = 0.620227;
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
 
DRIFT27 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT28';
class = 'DRIFT';
length = 0.415;
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
 
DRIFT28 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT29';
class = 'DRIFT';
length = 1.14002;
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
 
DRIFT29 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT30';
class = 'DRIFT';
length = 0.650022;
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
 
DRIFT30 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT31';
class = 'DRIFT';
length = 0.27875;
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
 
DRIFT31 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT32';
class = 'DRIFT';
length = 1.20949;
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
 
DRIFT32 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT33';
class = 'DRIFT';
length = 0.625;
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
 
DRIFT33 = {impedance(name, class, length, material, conductivity, thickness, apertures,...
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
LATTICE = [DRIFT01; BPM1; DRIFT02; QUAD; DRIFT03; QUAD; DRIFT02; VCM; DRIFT02; HCM; 
DRIFT02; QUAD; DRIFT04; VPCHAMBER; DRIFT05; VPCHAMBER; DRIFT06; BB; DRIFT07; BPM1; 
DRIFT02; QUAD; DRIFT06; VPCHAMBER; DRIFT08; VCM; DRIFT09; HCM; DRIFT10; SEXT; DRIFT11; 
SEXT; DRIFT12; QUAD; DRIFT12; SEXT; DRIFT10; HCM; DRIFT09; VCM; DRIFT13; BPM1; DRIFT14; 
VPCHAMBER; DRIFT04; SEXT; DRIFT15; BD; DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; 
DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT18; SEXT; DRIFT15; BD; DRIFT16; VCM; DRIFT17; 
BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT18; SEXT; DRIFT15; BD; 
DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT18; 
SEXT; DRIFT15; BD; DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; 
VPCHAMBER; DRIFT19; VGVALVE; DRIFT20; BD; DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; 
DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT18; SEXT; DRIFT15; BD; DRIFT16; VCM; DRIFT17; 
BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT18; SEXT; DRIFT15; BD; 
DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT18; 
SEXT; DRIFT15; BD; DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; 
VPCHAMBER; DRIFT18; SEXT; DRIFT15; BD; DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; 
DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT21; CBREAK; DRIFT20; BD; DRIFT16; VCM; DRIFT17; 
BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT18; SEXT; DRIFT15; BD; 
DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT18; 
SEXT; DRIFT15; BD; DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; 
VPCHAMBER; DRIFT18; SEXT; DRIFT15; BD; DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; 
DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT18; SEXT; DRIFT15; BD; DRIFT16; VCM; DRIFT17; 
BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT19; VGVALVE; DRIFT20; BD; 
DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT18; 
SEXT; DRIFT15; BD; DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; 
VPCHAMBER; DRIFT18; SEXT; DRIFT15; BD; DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; 
DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT18; SEXT; DRIFT15; BD; DRIFT16; VCM; DRIFT17; 
BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT18; SEXT; DRIFT15; BD; 
DRIFT06; VPCHAMBER; DRIFT22; BPM1; DRIFT08; VCM; DRIFT09; HCM; DRIFT10; SEXT; DRIFT12; 
QUAD; DRIFT12; SEXT; DRIFT11; SEXT; DRIFT10; HCM; DRIFT09; VCM; DRIFT06; VPCHAMBER; 
DRIFT08; QUAD; DRIFT07; BPM1; DRIFT02; BB; DRIFT06; VPCHAMBER; DRIFT23; EXTKICK; 
DRIFT03; EXTKICK; DRIFT24; VPCHAMBER; DRIFT04; QUAD; DRIFT02; HCM; DRIFT02; VCM; 
DRIFT02; QUAD; DRIFT03; QUAD; DRIFT02; BPM1; DRIFT11; EXTKICK; DRIFT25; VGVALVE; 
DRIFT26; TAPERUP; MAINCAV; TAPERDOWN; DRIFT26; VGVALVE; DRIFT27; SCREEN2; DRIFT02; EXTSEPT; DRIFT28; 
BPM1; DRIFT02; QUAD; DRIFT03; QUAD; DRIFT02; VCM; DRIFT02; HCM; DRIFT02; QUAD; DRIFT04; 
VPCHAMBER; DRIFT29; VPCHAMBER; DRIFT06; BB; DRIFT07; BPM1; DRIFT02; QUAD; DRIFT06; 
VPCHAMBER; DRIFT08; VCM; DRIFT09; HCM; DRIFT10; SEXT; DRIFT11; SEXT; DRIFT12; QUAD; 
DRIFT12; SEXT; DRIFT10; HCM; DRIFT09; VCM; DRIFT13; BPM1; DRIFT14; VPCHAMBER; DRIFT04; 
SEXT; DRIFT15; BD; DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; 
VPCHAMBER; DRIFT18; SEXT; DRIFT15; BD; DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; 
DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT18; SEXT; DRIFT15; BD; DRIFT16; VCM; DRIFT17; 
BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT18; SEXT; DRIFT15; BD; 
DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT19; 
VGVALVE; DRIFT20; BD; DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; 
VPCHAMBER; DRIFT18; SEXT; DRIFT15; BD; DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; 
DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT18; SEXT; DRIFT15; BD; DRIFT16; VCM; DRIFT17; 
BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT18; SEXT; DRIFT15; BD; 
DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT18; 
SEXT; DRIFT15; BD; DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; 
VPCHAMBER; DRIFT21; CBREAK; DRIFT20; BD; DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; 
DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT18; SEXT; DRIFT15; BD; DRIFT16; VCM; DRIFT17; 
BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT18; SEXT; DRIFT15; BD; 
DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT18; 
SEXT; DRIFT15; BD; DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; 
VPCHAMBER; DRIFT18; SEXT; DRIFT15; BD; DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; 
DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT19; VGVALVE; DRIFT20; BD; DRIFT16; VCM; DRIFT17; 
BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT18; SEXT; DRIFT15; BD; 
DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT18; 
SEXT; DRIFT15; BD; DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; DRIFT16; BF; DRIFT06; 
VPCHAMBER; DRIFT18; SEXT; DRIFT15; BD; DRIFT16; VCM; DRIFT17; BPM1; DRIFT17; HCM; 
DRIFT16; BF; DRIFT06; VPCHAMBER; DRIFT18; SEXT; DRIFT15; BD; DRIFT06; VPCHAMBER; 
DRIFT22; BPM1; DRIFT08; VCM; DRIFT09; HCM; DRIFT10; SEXT; DRIFT12; QUAD; DRIFT12; 
SEXT; DRIFT11; SEXT; DRIFT10; HCM; DRIFT09; VCM; DRIFT06; VPCHAMBER; DRIFT08; QUAD; 
DRIFT07; BPM1; DRIFT02; BB; DRIFT06; VPCHAMBER; DRIFT30; SCREEN2; DRIFT02; SCREEN2; 
DRIFT13; VPCHAMBER; DRIFT04; QUAD; DRIFT02; HCM; DRIFT02; VCM; DRIFT02; QUAD; DRIFT03; 
QUAD; DRIFT02; BPM1; DRIFT31; VGVALVE; DRIFT26; TAPERUP; MAINCAV; TAPERDOWN; DRIFT26; VGVALVE; DRIFT32; 
INJSEPT; DRIFT02; SCREEN2; DRIFT21; VPCHAMBER; DRIFT33; INJKICK]

IMPRING = LATTICE;

