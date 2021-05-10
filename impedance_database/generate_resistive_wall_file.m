function generate_resistive_wall_file(IMPRING,output_filename)
%% Generate resistive-wall file from impedance database
% Format: plane length path to wake file path to impedance file

    %% Write file
    
    fileID = fopen(output_filename,'w');

    for i = 1:length(IMPRING)

        if ~isempty(IMPRING{i}.RW_wake_files) && ~isempty(IMPRING{i}.RW_impedance_files)

            fprintf(fileID,'1 %.15f %s %s\n',IMPRING{i}.Length,IMPRING{i}.RW_wake_files{1},IMPRING{i}.RW_impedance_files{1});
            fprintf(fileID,'2 %.15f %s %s\n',IMPRING{i}.Length,IMPRING{i}.RW_wake_files{2},IMPRING{i}.RW_impedance_files{2});
            fprintf(fileID,'0 %.15f %s %s\n',IMPRING{i}.Length,IMPRING{i}.RW_wake_files{3},IMPRING{i}.RW_impedance_files{3});
        else
            fprintf(fileID,'1 %.15f %s %s\n',IMPRING{i}.Length,'','');
            fprintf(fileID,'2 %.15f %s %s\n',IMPRING{i}.Length,'','');
            fprintf(fileID,'0 %.15f %s %s\n',IMPRING{i}.Length,'','');
        end

    end
    fclose(fileID);

end