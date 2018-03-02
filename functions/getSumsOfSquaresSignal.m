function sig = getSumsOfSquaresSignal(n)
% getSumsOfSquaresSignal: 
%
% Inputs:
%  n - Int
%
% Output:
%  sig - Array 
%  
    [X, Y] = meshgrid(0:n, 0:n);
    squares_matrix = X.^2 + Y.^2;
    squares_vector = unique(squares_matrix(:));
    sig = squares_vector(squares_vector <= n^2)';    
end

