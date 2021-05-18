function sp = generate_elegant_impedance_sampling_points(freq_range,freq_step)

    sp = (0:freq_step:freq_range)';

    % Convert number of frequency sampling points to 2^(n+1) since required
    % by Elegant
    n_freq = length(sp);
    n_freq = 2^nextpow2(n_freq)+1;
    sp = linspace(0,freq_range,n_freq)';
    freq_step = sp(2) - sp(1);
    fprintf('Elegant frequency step is adjusted to %10e\n to have 2^n+1 number of points\n',freq_step);
    fprintf('\n')

end