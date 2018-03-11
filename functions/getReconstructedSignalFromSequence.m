function sig = getReconstructedSignalFromSequence(seq, varargin)
% getReconstructedSignalFromSequence:
%
% Inputs:
%  seq - Array
%  varargin - Number
%
% Output:
%  sig - Array 
%   
    if (nargin > 2)
      error('At max 2 arguments allowed')
    end   
    
    sample_domain = seq(1:end-500); % tails are 500 points
    sample_points = ones(1, length(sample_domain)); 
    extended_domain = [-1 * fliplr(seq(1:500)), seq];
    d_extended_domain = calc_t_prime(extended_domain); 
    new_domain = [];
    if (nargin == 1) 
        new_domain = 1:max(sample_domain);
    else
        new_domain = varargin{1}:max(sample_domain);
    end
    sig = greconv2(sample_points, sample_domain, extended_domain, d_extended_domain, new_domain);

end
