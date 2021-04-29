function beta_struct = interpolate_beta(file)
%% Interpolate and fit beta functions

	%% Read in data
    
    % Read file
    data = importdata(file).data;
    
    %% Make data unique
    [~,index,~] = unique(data(:,1));
    data = data(index,:);

    %% Interpolate data for better resolution
    sampling_points = linspace(min(data(:,1)),max(data(:,1)),1e4)';

    betax = interp1(data(:,1),data(:,2),sampling_points,'linear');
    betay = interp1(data(:,1),data(:,3),sampling_points,'linear');

    %% Fit function to interpolated data

    fit_betax = fit(sampling_points,betax,'linearinterp');
    fit_betay = fit(sampling_points,betay,'linearinterp');
    
    %% Create output struct
    beta_struct.betax = fit_betax;
    beta_struct.betay = fit_betay;    
end