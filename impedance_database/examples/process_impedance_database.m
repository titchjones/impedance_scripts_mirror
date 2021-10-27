%% Process impedance database

impedance_database_dir = 'F:\\mad\\diamond2\\Impedance_database';

impedance_lattice_openIDs_noNEG = impedance_BR_14_Booster(0,3, impedance_database_dir);

%% Create statistics

impedance_database_summary(impedance_lattice_openIDs_noNEG,0,0,0);

%% Generate resistive-wall file

generate_resistive_wall_file(impedance_lattice_openIDs_noNEG,'resistive_wall_openIDS_noNEG.txt');

%% Generate geometric impedance file

generate_geometric_impedance_file(impedance_lattice_openIDs_noNEG,'geometric_openIDS_noNEG.txt');



