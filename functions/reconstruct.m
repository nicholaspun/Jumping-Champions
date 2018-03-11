function yy = reconstruct(y, x, xx)
% reconstruct: Provides the new sample points "yy" for all points in the
% new domain "xx"
% Usage: reconstruct(y, x, xx)
%
% reconstruct uses sinc interpolation (Shannon's Reconstruction Theorem) to
% interpolate any point in xx across the real line. 
%
% The reconstruction formula is as follows:
%   Given an equidistantly spaced lattice {t_n} and sample points {f(t_n)},
%   To obtain any point t along a function f(t): 
%
%   f(t) = \sum_{n \in \mathbb{Z}} f(t_n)\sinc(F(t - t_n))
%
%   F is the sampling frequency and is defined as: 1/(t_2 - t_1).
% 
% Inputs:
%   y - Array. y-values for each point along the domain "x". Must be the
%   same length as "x".
%   x - Array. Domain for which y-values were sampled. 
%   xx - Array. Desired new domain for which y-values will be sampled.  
%
% Output:
%   yy - Array. y-values along then new domain "xx" 
%
    
    % simple error check
    if (nargin < 1)
      help reconstruct
      return
    elseif (nargin ~= 3)
      error('Exactly three arguments are required')
    end    

    % main function
    f = 1/(x(2) - x(1)); % sampling frequency
    xxlen = length(xx);
    yy = ones(1, xxlen);
    for a = 1:xxlen
        % for each x-value in the new domain, sinc interpolate
        fprintf("%d/%d\n", a, xxlen)
        yy(a) = y * sinc(f * (xx(a) - x))'; 
    end
end



