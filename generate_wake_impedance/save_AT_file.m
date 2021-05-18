function save_AT_file(AT_wake)

    fileID = fopen('wake_AT.txt','w');
    fprintf(fileID,'WakeT [m] WakeZ [V/C] WakeDX WakeDY WakeQX WakeQY\n');

    for i = 1:length(AT_wake.WakeT)
        fprintf(fileID,'%10.7f %10.7f %10.7f %10.7f %10.7f %10.7f\n',AT_wake.WakeT(i),AT_wake.WakeZ(i),AT_wake.WakeDX(i),AT_wake.WakeDY(i),AT_wake.WakeQX(i),AT_wake.WakeQY(i));
    end
    fclose(fileID);
end