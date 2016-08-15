function sig = greconv2(y, x, long_x, d_x, xx)
% greconv2: Reconstructs a signal (sig) of time-varying bandwidth
%
% greconv2 uses generalized sampling theory to interpolate (reconstruct)
% signal data across any point t on the real line. This is similar to sinc
% interpolation, but uses a generalized reconstruction kernel. 
%
% Inputs:
%  y - Array. The amplitudes of sampling points. (y-values)
%  x - Array. The sampling domain. Must be the same length 
%    as "y". (x-values)
%  long_x - Array. The sampling domain with tails of 500 
%    extra domain points on each end of the array.
%  d_x - Array. The derivative of long_x. Must be the same length
%    as "long_x".
%  xx - Array. The desired points in which the signal (sig) will
%    be reconstructed on. (new x-values)
%
% Output:
%  sig - Array. The y-values along the new domain (xx). 
%   

    % deals with minor computational inaccuracies
    xx = round(xx, 10);                   
    x = round(x, 10);
    
    xxlen = length(xx);
    sig = zeros(1, xxlen); % preallocation 
    for a = 1:xxlen
        t = xx(a); % for each x-value in the new domain
        k = G(t, x, long_x, d_x); 
        sig(a) = y * k';
        fprintf('%d/%d\n', a, xxlen);
    end
end

function a = G(t, x, long_x, d_x)
% G: The Reconstruction Kernel
%
% G is an implementation of the following equation:
% (-1)^{z(t, t_n)} \frac{\sqrt{t'_n}}{t - t_n}\left(\sum_m \frac{t'_m}{(t-t_m)^2}\right)^2
%
% Inputs: 
%   t - Real Number. The desired x-value to be reconstruction
%   x - Array. The sampling domain. Must be the same length 
%     as "y". (x-values)
%   long_x - Array. The sampling domain with tails of 500 
%     extra domain points on each end of the array.
%   d_x - Array. The derivative of long_x. Must be the same length
%     as "long_x".
%
% Output:
%   a - Array. Amplitudes (y-values) for the generalized sinc function 
%     centered at "t".
%

    sq = sum_square(t, long_x, d_x); 
    a = (sqrt(d_x(501:end-500))./abs(t-x)) * sq;   
    a(isnan(a)|isinf(a)) = 1;
    % fixes the sign: (-1)^{z(t, t_n)}
    sign = zeros(1, length(x));
    len = length(x(x<t)) - 1;
    sign(1:len+1) = len:-1:0;
    sign(len+2:end) = 0:(length(x) - 2 - len);
    sign_1 = (-1).^(sign);
    a = a.*sign_1;
end
 
function sq = sum_square(t, long_x, d_x) 
% sum_square: Computes the series in the generalized reconstruction kernel.
% 
% Input: 
%   t - Real Number. The desired x-value to be reconstruction
%   long_x - Array. The sampling domain with tails of 500 
%     extra domain points on each end of the array. 
%   x - Array. The sampling domain. Must be the same length 
%     as "y". (x-values)
%
% Output:
%   sq - Real. Value obtained from the summation 
%
    
    center = length(long_x(long_x<t));   
    tm = long_x(center-498:center+500);
    tm_p = d_x(center-498:center+500);
    s = 1./(t-tm);
    s_1 = s.*tm_p;
    sq = sqrt(1./(s*s_1'));                       
end
