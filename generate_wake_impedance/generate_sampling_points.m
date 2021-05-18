function sp = generate_sampling_points(wake_range,n_points)

    sp = linspace(-wake_range,wake_range,n_points)';
    
    % Check so number of wake sampling points is odd number
    if mod(length(sp),2) ~= 1
        sp = linspace(-wake_range,wake_range,n_points+1)'; 
        fprintf('Number of sampling points is adjusted to %10e\n to have odd number of points\n',length(sp));
    end

end