function sp = generate_elegant_wake_sampling_points(wake_range,bin_length)

    sp = (-wake_range:bin_length:wake_range)';

    if mod(length(sp),2) ~= 1
        sp = linspace(-wake_range,wake_range,length(sp)+1)';
        bin_length = sp(2) - sp(1);
        fprintf('Elegant bin length is adjusted to %10e\n to have odd number of points\n\n',bin_length);
    end

end