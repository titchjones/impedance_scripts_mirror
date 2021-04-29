%% Process impedance database

impedance_lattice_openIDs_noNEG = impedance_M_H6BA_34_1_1(0,0);

%% Create statistics

impedance_database_summary(impedance_lattice_openIDs_noNEG,0,0,0);

%% Generate resistive-wall file

generate_resistive_wall_file(impedance_lattice_openIDs_noNEG,'resistive_wall_openIDS_noNEG.txt');

%% Generate geometric impedance file

generate_geometric_impedance_file(impedance_lattice_openIDs_noNEG,'geometric_openIDS_noNEG.txt');



