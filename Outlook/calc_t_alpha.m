function lat = calc_t_alpha (alpha, orig_lat, d_orig_lat)
% calc_t_alpha: returns a lattice "lat" shifted by alpha from orig_lat.
%   The length of lat is length(orig_lat) - 1. 
% Requires: alpha is between 0 and 1. 
% 
% calc_t_alpha calculates another sampling lattice within the entire family
% given the set {t_n(0)} ("orig_lat") and {t_n'(0)} ("d_orig_lat"). The
% function works by making increasingly accurate guesses of t_n(alpha) for
% some "n" and specified "alpha" until the guess is within a threshold. 
%
% Helper Functions:
%   calc_t_alpha_n: Returns t_n(alpha) ("t_alpha") at the specified n and
%     alpha.
%   calc_LHS: Evaluates the left side of the equation (as seen in the
%     description of calc_t_alpha_n)
%
% Inputs:
%   alpha - Real between [0, 1). Specifies the amount of shift 
%   orig_lat - Array. The original lattice. 
%   d_orig_lat - Array. Derivative of "orig_lat" 
%
% Output:
%  lat - Array. The shifted lattice 
%
    
    latlen = length(orig_lat) - 1; 
    lat = zeros(1, latlen);
    for n = 1:latlen
        % construct the new lattice one point at a time
        lat(n) = calc_t_alpha_n(n, alpha, orig_lat, d_orig_lat);
        fprintf('%d\n', n);
    end
end

function t_alpha = calc_t_alpha_n(n, alpha, orig_lat, d_orig_lat)
% calc_t_alpha_n: Returns t_n(alpha) ("t_alpha") at the specified n and
% alpha.
%
% calc_t_alpha_n effectively solves for t in the following equation:
% \frac{t_n'}{t - t_n} - \sum_{m \neq n}\frac{(t - t_n)t_m'}{(t - t_m)(t_n - t_m)} = \pi \cot(\pi\alpha)
%
% The algorithm uses the fact that t_n(alpha) ("t_alpha") is bounded
% between t_n and t_{n+1} (i.e. The previous and next point on the original
% lattice). This interval is refined after each guess, either decreasing
% the maximum possible value and increasing the minimum possible value. In
% this way, guess for t_n(alpha) become increasingly accurate.
%
% Inputs:
%   n - Integer. The position of the desired time value (t_n) to be shifted.
%   alpha - Real between [0, 1). Specifies the amount of shift 
%   orig_lat - Array. The original lattice. 
%   d_orig_lat - Array. Derivative of "orig_lat"
%
% Output:
%  t_alpha - Real number. The shifted value of t_n 
%
    % Define Constants
    t_at_n = orig_lat(n);
    d_t_at_n = d_orig_lat(n);
    thrshld = 1e-6;
    RHS = pi * cot(pi * alpha);
    
    % Initial bounds (t_n < t_n(alpha) < t_{n+1}) 
    low = t_at_n;
    high = orig_lat(n+1);
    
    while 1
        % Pick a random value for t_alpha between the bounds
        guess = low + (high-low)*rand(1,1);
        LHS = calc_LHS(guess, t_at_n, d_t_at_n, orig_lat, d_orig_lat); 
        if (abs(LHS - RHS) <= thrshld)
            t_alpha = guess;
            break;
        elseif (LHS < RHS)
            % Cap the maximum possible value. 
            high = guess;
        else
            % Raise the minimum possible value.
            low = guess;
        end        
    end
end

function g = calc_LHS(guess, t_at_n, d_t_at_n, orig_lat, d_orig_lat)
% calc_LHS: Evaluates the left side of the equation (as seen in the
% description of calc_t_alpha_n)
%
% Input:
%   guess - A double. The guess of what t_n(alpha) could be.
%   t_n - A double. The time value in the original lattice (without shift)
%   t_n_p - A double. The derivative of at t_n. 
%   orig_lat - Array. The original lattice.
%   d_orig_lat - Array. Derivative of "orig_lat" 
%
% Output:
%   g: Real Number. 
%
    
    % evaluates \frac{t_n'}{t - t_n}
    expr1 = d_t_at_n/(guess - t_at_n);
    
    % calcuations involving the sum
    % \sum_{m \neq n}\frac{(t - t_n)t_m'}{(t - t_m)(t_n - t_m)}
    numer = (guess - t_at_n).*d_orig_lat;
    denom = (guess - orig_lat).*(t_at_n - orig_lat);
    expr2 = numer./denom;
    expr2(isnan(expr2)|isinf(expr2)) = 0;
    expr2 = sum(expr2);
    
    % subtract the two parts
    g = expr1 - expr2;
end 
        
    