function save_elegant_wake_file(elegant_wake)

    % Wake file
    clight = 299792458;
    time = elegant_wake.WakeT./clight; % Change to time to match Elegant conventions

    fileID = fopen('elegant_wake.txt','w');
    for i = 1:length(time)
        fprintf(fileID,'%10e %10e %10e %10e\n',time(i),elegant_wake.WakeZ(i),elegant_wake.WakeDX(i),elegant_wake.WakeDY(i));
    end
    fclose(fileID);
    system('plaindata2sdds elegant_wake.txt wake_elegant.sdds -inputMode=ascii -outputMode=ascii -separator=" " -noRowCount -column=Time,double,units=s  -column=WakeZ,double,units=V/C -column=WakeDX,double,units=V/C/m -column=WakeDY,double,units=V/C/m');
    delete('elegant_wake.txt')

end