function IMPRING = impedance_database_M_H6BA_34_1_1(ID_config,neg_model)
%% Impedance database for lattice M-H6BA-34-1-1

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
        
end

%% Drifts

% --- Downstream half long straight, valve to valve (-taper) ---
name = 'LSD';
class = 'DRIFT';
length = 3.25886;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.036 0.036 ID_ver_aper; -0.036 0.036 ID_ver_aper];
RW_impedance_files = RW_impedance_rectangular;
RW_wake_files = RW_wake_rectangular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);

LSD = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};
              
% --- Upstream half long straight ---
name = 'LSU';
class = 'DRIFT';
length = 3.25886;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.036 0.036 ID_ver_aper; -0.036 0.036 ID_ver_aper];
RW_impedance_files = RW_impedance_rectangular;
RW_wake_files = RW_wake_rectangular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);

LSU = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};
              
% --- Upstream half mid-straight ---
name = 'MSU';
class = 'DRIFT';
length = 1.924868000000004./2;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.036 0.036 ID_ver_aper; -0.036 0.036 ID_ver_aper];
RW_impedance_files = RW_impedance_rectangular;
RW_wake_files = RW_wake_rectangular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);

MSU = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};
               
% --- Downstream half mid-straight ---
name = 'MSD';
class = 'DRIFT';
length = 1.924868000000004./2;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.036 0.036 ID_ver_aper; -0.036 0.036 ID_ver_aper];
RW_impedance_files = RW_impedance_rectangular;
RW_wake_files = RW_wake_rectangular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);

MSD = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};
 
% --- Upstream half short-straight ---
name = 'SSU';
class = 'DRIFT';
length = 4.037593999999999./2;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.036 0.036 ID_ver_aper; -0.036 0.036 ID_ver_aper];
RW_impedance_files = RW_impedance_rectangular;
RW_wake_files = RW_wake_rectangular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);

SSU = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};
        
% --- Downstream half short-straight ---
name = 'SSD';
class = 'DRIFT';
length = 4.037593999999999./2;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.036 0.036 ID_ver_aper; -0.036 0.036 ID_ver_aper];
RW_impedance_files = RW_impedance_rectangular;
RW_wake_files = RW_wake_rectangular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);

SSD = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

% --- Additional drifts ---  
name = 'DRIFT1';
class = 'DRIFT';
length = 0.666699999999999;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_rectangular;
RW_wake_files = RW_wake_rectangular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);

DRIFT1 = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT2';
class = 'DRIFT';
length = 0.892100000000002;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_rectangular;
RW_wake_files = RW_wake_rectangular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);

DRIFT2 = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT3';
class = 'DRIFT';
length = 1.642449999999997;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_rectangular;
RW_wake_files = RW_wake_rectangular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);

DRIFT3 = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT4';
class = 'DRIFT';
length = 1.977949999999998;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_rectangular;
RW_wake_files = RW_wake_rectangular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);

DRIFT4 = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT5';
class = 'DRIFT';
length = 1.977949999999995;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_rectangular;
RW_wake_files = RW_wake_rectangular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);

DRIFT5 = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT6';
class = 'DRIFT';
length = 1.642449999999993;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_rectangular;
RW_wake_files = RW_wake_rectangular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);

DRIFT6 = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT7';
class = 'DRIFT';
length = 1.413799999999981./2;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_rectangular;
RW_wake_files = RW_wake_rectangular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);

DRIFT7 = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

name = 'DRIFT8';
class = 'DRIFT';
length = 1.413799999999981./2;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_rectangular;
RW_wake_files = RW_wake_rectangular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);

DRIFT8 = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

%% Tapers

% --- ID taper 1 ---
name = 'IDTAP1';
class = 'TAPER';
length = 0.15;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.036 0.036 ID_ver_aper; -0.01 0.01 -0.01 0.01];
RW_impedance_files = RW_impedance_rectangular;
RW_wake_files = RW_wake_rectangular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);

IDTAP1 = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

% --- ID taper 2 ---
name = 'IDTAP2';
class = 'TAPER';
length = 0.15;
material = coating_material;
conductivity = coating_conductivity;
thickness = coating_thickness;
apertures = [-0.01 0.01 -0.01 0.01; -0.036 0.036 ID_ver_aper];
RW_impedance_files = RW_impedance_rectangular;
RW_wake_files = RW_wake_rectangular;
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [0 0 0];
geom_fit = struct([]);

IDTAP2 = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

%% Dipole vessel
% Includes BPM3, keyhole flange, pump

name = 'DIPOLE';
class = 'DIPOLE';
length = 2.0;
material = ['Aluminium'];
conductivity = [3.77e7];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {'/dls/physics/Impedance/IW2D/aluminium-circular-10mm-inf-range0.1m-step1um/ZxdipWDiamond-II_1layers10.00mm_round_al_1layer.dat',...
                      '/dls/physics/Impedance/IW2D/aluminium-circular-10mm-inf-range0.1m-step1um/ZydipWDiamond-II_1layers10.00mm_round_al_1layer.dat',...
                     '/dls/physics/Impedance/IW2D/aluminium-circular-10mm-inf-range0.1m-step1um/ZlongWDiamond-II_1layers10.00mm_round_al_1layer.dat'};
RW_wake_files = {'/dls/physics/Impedance/IW2D/aluminium-circular-10mm-inf-range0.1m-step1um/WxdipWDiamond-II_1layers10.00mm_round_al_1layer.dat',...
                 '/dls/physics/Impedance/IW2D/aluminium-circular-10mm-inf-range0.1m-step1um/WydipWDiamond-II_1layers10.00mm_round_al_1layer.dat',...
                 '/dls/physics/Impedance/IW2D/aluminium-circular-10mm-inf-range0.1m-step1um/WlongWDiamond-II_1layers10.00mm_round_al_1layer.dat'};
RW_k_factors = [0 0 0];
geom_impedance_files = {'/dls/physics/Impedance/Impedance/DiamondII/dipolevessel_option3_pec_impx.txt',...
                        '/dls/physics/Impedance/Impedance/DiamondII/dipolevessel_option3_pec_impy.txt',...
                        '/dls/physics/Impedance/Impedance/DiamondII/dipolevessel_option3_pec_impz.txt'};
geom_wake_files = {'/dls/physics/Impedance/Wakes/DiamondII/dipolevessel_option3_pec_wx.txt',...
                   '/dls/physics/Impedance/Wakes/DiamondII/dipolevessel_option3_pec_wy.txt',...
                   '/dls/physics/Impedance/Wakes/DiamondII/dipolevessel_option3_pec_wz.txt'};
geom_k_factors = [-0.195,-0.0301,0.117];
geom_fit = struct([]);

DIPOLE = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

%% BPM assemblies

% --- BPM 1 ---
name = 'BPM1';
class = 'BPM';
length = 0.115;
material = ['Steel316'];
conductivity = [1.3514e6];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {'/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/ZxdipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                      '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/ZydipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                      '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/ZlongWDiamond-II_1layers10.00mm_round_steel_1layer.dat'};
RW_wake_files = {'/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/WxdipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                 '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/WydipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                 '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/WlongWDiamond-II_1layers10.00mm_round_steel_1layer.dat'};
RW_k_factors = [0 0 0];
geom_impedance_files = {'/dls/physics/Impedance/Impedance/DiamondII/bpm1_option3_pec_impx.txt',...
                        '/dls/physics/Impedance/Impedance/DiamondII/bpm1_option3_pec_impy.txt',...
                        '/dls/physics/Impedance/Impedance/DiamondII/bpm1_option3_pec_impz.txt'};
geom_wake_files = {'/dls/physics/Impedance/Wakes/DiamondII/bpm1_option3_pec_wx.txt',...
                   '/dls/physics/Impedance/Wakes/DiamondII/bpm1_option3_pec_wy.txt',...
                   '/dls/physics/Impedance/Wakes/DiamondII/bpm1_option3_pec_wz.txt'};
geom_k_factors = [-0.0298,-0.0127,0.0806];
geom_fit = struct([]);

BPM1 = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

% --- BPM 2 ---
name = 'BPM2';
class = 'BPM';
length = 0.115;
material = ['Steel316'];
conductivity = [1.3514e6];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {'/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/ZxdipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                      '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/ZydipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                      '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/ZlongWDiamond-II_1layers10.00mm_round_steel_1layer.dat'};
RW_wake_files = {'/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/WxdipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                 '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/WydipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                 '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/WlongWDiamond-II_1layers10.00mm_round_steel_1layer.dat'};
RW_k_factors = [0 0 0];
geom_impedance_files = {'/dls/physics/Impedance/Impedance/DiamondII/bpm2_option3_pec_impx.txt',...
                        '/dls/physics/Impedance/Impedance/DiamondII/bpm2_option3_pec_impy.txt',...
                        '/dls/physics/Impedance/Impedance/DiamondII/bpm2_option3_pec_impz.txt'};
geom_wake_files = {'/dls/physics/Impedance/Wakes/DiamondII/bpm2_option3_pec_wx.txt',...
                   '/dls/physics/Impedance/Wakes/DiamondII/bpm2_option3_pec_wy.txt',...
                   '/dls/physics/Impedance/Wakes/DiamondII/bpm2_option3_pec_wz.txt'};
geom_k_factors = [-0.0046,-0.0050,0.0210];
geom_fit = struct([]);

BPM2 = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

% --- BPM 4 ---
name = 'BPM4';
class = 'BPM';
length = 0.077;
material = ['Steel316'];
conductivity = [1.3514e6];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {'/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/ZxdipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                      '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/ZydipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                      '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/ZlongWDiamond-II_1layers10.00mm_round_steel_1layer.dat'};
RW_wake_files = {'/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/WxdipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                 '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/WydipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                 '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/WlongWDiamond-II_1layers10.00mm_round_steel_1layer.dat'};
RW_k_factors = [0 0 0];
geom_impedance_files = {'/dls/physics/Impedance/Impedance/DiamondII/bpm4_option3_pec_impx.txt',...
                        '/dls/physics/Impedance/Impedance/DiamondII/bpm4_option3_pec_impy.txt',...
                        '/dls/physics/Impedance/Impedance/DiamondII/bpm4_option3_pec_impz.txt'};
geom_wake_files = {'/dls/physics/Impedance/Wakes/DiamondII/bpm4_option3_pec_wx.txt',...
                   '/dls/physics/Impedance/Wakes/DiamondII/bpm4_option3_pec_wy.txt',...
                   '/dls/physics/Impedance/Wakes/DiamondII/bpm4_option3_pec_wz.txt'};
geom_k_factors = [-0.0109,-0.0125,0.0383];
geom_fit = struct([]);

BPM4 = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

% --- BPM 5 ---
name = 'BPM5';
class = 'BPM';
length = 0.0765;
material = ['Steel316'];
conductivity = [1.3514e6];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {'/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/ZxdipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                      '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/ZydipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                      '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/ZlongWDiamond-II_1layers10.00mm_round_steel_1layer.dat'};
RW_wake_files = {'/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/WxdipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                 '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/WydipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                 '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/WlongWDiamond-II_1layers10.00mm_round_steel_1layer.dat'};
RW_k_factors = [0 0 0];
geom_impedance_files = {'/dls/physics/Impedance/Impedance/DiamondII/bpm5_option3_pec_impx.txt',...
                        '/dls/physics/Impedance/Impedance/DiamondII/bpm5_option3_pec_impy.txt',...
                        '/dls/physics/Impedance/Impedance/DiamondII/bpm5_option3_pec_impz.txt'};
geom_wake_files = {'/dls/physics/Impedance/Wakes/DiamondII/bpm5_option3_pec_wx.txt',...
                   '/dls/physics/Impedance/Wakes/DiamondII/bpm5_option3_pec_wy.txt',...
                   '/dls/physics/Impedance/Wakes/DiamondII/bpm5_option3_pec_wz.txt'};
geom_k_factors = [-0.00973,-0.0110,0.0467];
geom_fit = struct([]);

BPM5 = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

% --- BPM 6 ---
name = 'BPM6';
class = 'BPM';
length = 0.080;
material = ['Steel316'];
conductivity = [1.3514e6];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {'/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/ZxdipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                      '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/ZydipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                      '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/ZlongWDiamond-II_1layers10.00mm_round_steel_1layer.dat'};
RW_wake_files = {'/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/WxdipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                 '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/WydipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                 '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/WlongWDiamond-II_1layers10.00mm_round_steel_1layer.dat'};
RW_k_factors = [0 0 0];
geom_impedance_files = {'/dls/physics/Impedance/Impedance/DiamondII/bpm6_option3_pec_impx.txt',...
                        '/dls/physics/Impedance/Impedance/DiamondII/bpm6_option3_pec_impy.txt',...
                        '/dls/physics/Impedance/Impedance/DiamondII/bpm6_option3_pec_impz.txt'};
geom_wake_files = {'/dls/physics/Impedance/Wakes/DiamondII/bpm6_option3_pec_wx.txt',...
                   '/dls/physics/Impedance/Wakes/DiamondII/bpm6_option3_pec_wy.txt',...
                   '/dls/physics/Impedance/Wakes/DiamondII/bpm6_option3_pec_wz.txt'};
geom_k_factors = [-0.0118,-0.0119,0.0414];
geom_fit = struct([]);

BPM6 = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};
  
%% Cavities

% --- Main cavity ---

name = 'MAINCAV';
class = 'CAVITY';
length = 0.1;
material = ['Copper'];
conductivity = [5.96e7];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {};
RW_wake_files = {};
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [];
geom_fit = struct([]);

MAINCAV = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};
  
%% Flanges

% --- Round flange ---
name = 'FLANGE1';
class = 'FLANGE';
length = 0.0254;
material = ['Steel316'];
conductivity = [1.3514e6];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {'/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/ZxdipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                      '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/ZydipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                      '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/ZlongWDiamond-II_1layers10.00mm_round_steel_1layer.dat'};
RW_wake_files = {'/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/WxdipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                 '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/WydipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                 '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/WlongWDiamond-II_1layers10.00mm_round_steel_1layer.dat'};
RW_k_factors = [0 0 0];
geom_impedance_files = {'/dls/physics/Impedance/Impedance/DiamondII/flange_round_pec_impx.txt',...
                        '/dls/physics/Impedance/Impedance/DiamondII/flange_round_pec_impy.txt',...
                        '/dls/physics/Impedance/Impedance/DiamondII/flange_round_pec_impz.txt'};
geom_wake_files = {'/dls/physics/Impedance/Wakes/DiamondII/flange_round_pec_wx.txt',...
                   '/dls/physics/Impedance/Wakes/DiamondII/flange_round_pec_wy.txt',...
                   '/dls/physics/Impedance/Wakes/DiamondII/flange_round_pec_wz.txt'};
geom_k_factors = [0.00012,-0.00023,0.00003];
geom_fit = struct([]);

FLANGE1 = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};


%% Valves

name = 'VALVE1';
class = 'VALVE';
length = 0.180;
material = ['Steel316'];
conductivity = [1.3514e6];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {'/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/ZxdipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                      '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/ZydipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                      '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/ZlongWDiamond-II_1layers10.00mm_round_steel_1layer.dat'};
RW_wake_files = {'/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/WxdipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                 '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/WydipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                 '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/WlongWDiamond-II_1layers10.00mm_round_steel_1layer.dat'};
RW_k_factors = [0 0 0];
geom_impedance_files = {};
geom_wake_files = {};
geom_k_factors = [];
geom_fit = struct([]);

VALVE1 = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

%% Diagnostics

name = 'STRIPLINE';
class = 'STRIPLINE';
length = 0.1;
material = ['Steel316'];
conductivity = [1.3514e6];
thickness = [Inf];
apertures = [-0.01 0.01 -0.01 0.01; -0.01 0.01 -0.01 0.01];
RW_impedance_files = {'/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/ZxdipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                      '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/ZydipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                      '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/ZlongWDiamond-II_1layers10.00mm_round_steel_1layer.dat'};
RW_wake_files = {'/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/WxdipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                 '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/WydipWDiamond-II_1layers10.00mm_round_steel_1layer.dat',...
                 '/dls/physics/Impedance/IW2D/steel316-circular-10mm-inf-range0.1m-step1um/WlongWDiamond-II_1layers10.00mm_round_steel_1layer.dat'};
RW_k_factors = [0 0 0];
geom_impedance_files = {'/dls/physics/Impedance/Impedance/stripline_v6_pec_impx.txt',...
                        '/dls/physics/Impedance/Impedance/stripline_v6_pec_impy.txt',...
                        '/dls/physics/Impedance/Impedance/stripline_v6_pec_impz.txt'};
geom_wake_files = {'/dls/physics/Impedance/Wakes/stripline_v6_pec_wx.txt',...
                   '/dls/physics/Impedance/Wakes/stripline_v6_pec_wy.txt',...
                   '/dls/physics/Impedance/Wakes/stripline_v6_pec_wz.txt'};
geom_k_factors = [-0.00564,-0.0126,0.0821];
geom_fit = struct([]);

STRIPLINE = {impedance(name, class, length, material, conductivity, thickness, apertures,....
      'RW_impedance_files',RW_impedance_files,'RW_wake_files',RW_wake_files,'RW_k_factors',RW_k_factors,...
      'Geom_impedance_files',geom_impedance_files,'Geom_wake_files',geom_wake_files,'Geom_k_factors',geom_k_factors,'Geom_fit',geom_fit)};

%% Cells

%CELL_LM = [IDTAP1; FLANGER; VALVE; FLANGER; BPM1; FLANGER; DRIFT1; FLANGER; BPM2; DIPOLE; DRIFT2; FLANGER; BPM4; FLANGER;...
%    DRIFT3; FLANGER; BPM5; FLANGER; DRIFT4; FLANGER; BPM6; FLANGER; VALVE; FLANGER; FLANGER; IDTAP2];

CELL_LM = [IDTAP1; FLANGE1; VALVE1; FLANGE1; BPM1; FLANGE1; DRIFT1; FLANGE1; BPM2; DIPOLE; DRIFT2; FLANGE1; BPM4; FLANGE1;...
    DRIFT3; FLANGE1; BPM5; FLANGE1; DRIFT4; FLANGE1; BPM6; FLANGE1; VALVE1; FLANGE1; IDTAP2];

%CELL_MS = [IDTAP1; FLANGER; VALVE; FLANGER; BPM6; FLANGER; DRIFT5; FLANGER; BPM5; FLANGER; DRIFT6; FLANGER; BPM4; FLANGER;...
%    DRIFT2; DIPOLE; BPM2; FLANGER; DRIFT1; FLANGER; BPM1; FLANGER; VALVE; FLANGER; IDTAP2];
    
% Remove BPM2
CELL_MS = [IDTAP1; FLANGE1; VALVE1; FLANGE1; BPM6; FLANGE1; DRIFT5; FLANGE1; BPM5; FLANGE1; DRIFT6; FLANGE1; BPM4; FLANGE1;...
    DRIFT7; DIPOLE; FLANGE1; DRIFT8; FLANGE1; BPM1; FLANGE1; VALVE1; FLANGE1; IDTAP2];

CELL_SM = [IDTAP1; FLANGE1; VALVE1; FLANGE1; BPM1; FLANGE1; DRIFT8; FLANGE1; DIPOLE; DRIFT7; FLANGE1; BPM4; FLANGE1;...
    DRIFT6; FLANGE1; BPM5; FLANGE1; DRIFT5; FLANGE1; BPM6; FLANGE1; VALVE1; FLANGE1; IDTAP2];


%CELL_ML = fliplr(CELL_LM);
%CELL_ML = flipud(CELL_LM);

CELL_ML = [IDTAP1; FLANGE1; VALVE1; FLANGE1; BPM6; FLANGE1; DRIFT4; FLANGE1; BPM5; FLANGE1; DRIFT3; FLANGE1; BPM4; FLANGE1;...
    DRIFT2; DIPOLE; BPM2; FLANGE1; DRIFT1; FLANGE1; BPM1; FLANGE1; VALVE1; FLANGE1; IDTAP2];


%SPERIOD1 = [LSD; CELL_LM; MSU; MSD; CELL_ML; SSU; SSD; CELL_LM; MSU; MSD; CELL_ML; SSU; SSD; CELL_LM; MSU; MSD; CELL_ML; SSU; SSD; CELL_LM; MSU; MSD; CELL_ML; LSU];
SPERIOD1 = [LSD; CELL_LM; MSU; MSD; CELL_MS; SSU; SSD; CELL_SM; MSU; MSD; CELL_MS; SSU; SSD; CELL_SM; MSU; MSD; CELL_MS; SSU; SSD; CELL_SM; MSU; MSD; CELL_ML; LSU];
SPERIOD2 = [LSD; CELL_LM; MSU; MSD; CELL_MS; SSU; SSD; CELL_SM; MSU; MSD; CELL_MS; SSU; SSD; CELL_SM; MSU; MSD; CELL_MS; SSU; SSD; CELL_SM; MSU; MSD; CELL_ML; LSU];
SPERIOD3 = [LSD; CELL_LM; MSU; MSD; CELL_MS; SSU; SSD; CELL_SM; MSU; MSD; CELL_MS; SSU; SSD; CELL_SM; MSU; MSD; CELL_MS; SSU; SSD; CELL_SM; MSU; MSD; CELL_ML; LSU];
SPERIOD4 = [LSD; CELL_LM; MSU; MSD; CELL_MS; SSU; SSD; CELL_SM; MSU; MSD; CELL_MS; SSU; SSD; CELL_SM; MSU; MSD; CELL_MS; SSU; SSD; CELL_SM; MSU; MSD; CELL_ML; LSU];
SPERIOD5 = [LSD; CELL_LM; MSU; MSD; CELL_MS; SSU; SSD; CELL_SM; MSU; MSD; CELL_MS; SSU; SSD; CELL_SM; MSU; MSD; CELL_MS; SSU; SSD; CELL_SM; MSU; MSD; CELL_ML; LSU];
SPERIOD6 = [LSD; CELL_LM; MSU; MSD; CELL_MS; SSU; SSD; CELL_SM; MSU; MSD; CELL_MS; SSU; SSD; CELL_SM; MSU; MSD; CELL_MS; SSU; SSD; CELL_SM; MSU; MSD; CELL_ML; LSU];


% SPERIOD1 = [CELL_LM, CELL_MS, CELL_SM, CELL_MS, CELL_SM, CELL_MS, CELL_SM, CELL_ML];
%DIAMOND2 = [SPERIOD1; SPERIOD1; SPERIOD1; SPERIOD1; SPERIOD1; SPERIOD1; STRIP; STRIP; CAV; CAV; CAV; CAV; CAV; CAV];
DIAMOND2 = [SPERIOD1; SPERIOD2; SPERIOD3; SPERIOD4; SPERIOD5; SPERIOD6];

IMPRING = DIAMOND2;

