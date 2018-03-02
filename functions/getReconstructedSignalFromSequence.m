function sig = getReconstructedSignalFromSequence(seq)
% getReconstructedSignalFromSequence:
%
% Inputs:
%  seq - Array
%
% Output:
%  sig - Array 
%   
    sample_domain = seq(1:end-500); % tails are 500 points
    sample_points = ones(1, length(sample_domain)); 
    extended_domain = [-1 * fliplr(seq(1:500)), seq];
    d_extended_domain = calc_t_prime(extended_domain); 
    new_domain = 1:max(sample_domain);
    
    sig = greconv2(sample_points, sample_domain, extended_domain, d_extended_domain, new_domain);
end
