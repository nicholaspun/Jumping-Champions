function arr = calc_alpha_prime(alpha, orig_lat, d_orig_lat, t_alpha_lat)
% calc_alpha_prime: Returns an array "arr" of the derivatives for each 
%   element in t_alpha_lat, for corresponding alpha.
%
% calc_alpha_prime calculates each individual derivative t_n'(alpha) in arr 
% for the nth element in t_alpha_lat using the following equation: 
% t_n'(\alpha) = \frac{\pi^2}{\sin^2(\pi\alpha)}\left(\sum_m \frac{t_m'}{(t_n(\alpha) - t_m)^2}\right)^{-1}
% 
% Inputs:
%   alpha - Real between [0, 1). Specifies the amount of shift 
%   orig_lat - Array. The original lattice. 
%   d_orig_lat - Array. Derivative of "orig_lat" 
%   t_alpha_lat: Array. The shifted lattice 
%
% Output:
%   arr - Array. The derivative of the shifted lattice (t_alpha_lat) 
%
    
    arrlen = length(t_alpha_lat);
    arr = zeros(1, arrlen);
    prod_1 = (pi/sin(pi*alpha))^2; % Constant for all "t_alpha"
    for i = 1:arrlen
        t_alpha = t_alpha_lat(i);
        denom_arr = (t_alpha - orig_lat).^(-2);
        sum_series = d_orig_lat * denom_arr';
        arr(i) = prod_1/sum_series;
    end
end
