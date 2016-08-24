function pfact = primorial(n)
% primorial: returns the primorial of the nth prime.
%
% A primorial is the product of the first n primes.
% e.g. The 4th primorial is: 7 * 5 * 3 * 2 = 210
% 
% Inputs:
%   n - Array of Naturals. The desired nth primorial to be computed.
%
% Output: 
%   pfact - Array of Naturals. The primorials corresponding to each element
%   in n.
%

    % simple error check
    if (nargin < 1)
        help primorial
        return
    elseif (isinteger(n))
        error('Input must only have Natural Number values');
    elseif (nargin > 1)
        error('Exactly one argument is required')   
    end  
    
    % Main Function
    pfact = zeros(1, length(n));
    index = 1;
    for i = n
        pfact(index) = prod(nthprime(1:i));
        index = index + 1;
    end
end