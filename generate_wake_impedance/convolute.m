function new_wake = convolute(s,wake,convolution_bunch_length)
%% Convolute wake

    %% Do convolution

    sigma_L = convolution_bunch_length;    
    lambda = 1./(sqrt(2.*pi).*sigma_L).*exp(-s.^2./(2.*sigma_L.^2));    
    delt = s(2)-s(1);
    
    new_wake = delt.*conv(wake,lambda,'same');
    
end