function tp_arr = calc_t_prime(t_arr)
% calc_t_prime returns the derivative array for each element in "t_arr"
%
% The derivatives are calculated to be the average distance between the
% upcoming time value (next element) and the previous time value (previous
% element). That is, t_n' = (t_{n+1} - t_{n-1})/2.
% In order the calculate the derivative of points at the two ends of the
% array, the first and last elements are duplicated.
%
% Input:
%   t_arr - Array. Contains the time values for reconstruction, i.e. the t_n points  
%
% Output:
%   tp_arr - Array. Contains the derivatives at each time value in "t_arr".
%            i.e. The t_n' points
%
    extend_t_arr = zeros(1,length(t_arr)+2);
    extend_t_arr(1) = t_arr(1); % duplicate first element
    extend_t_arr(end) = t_arr(end); % duplicate last element
    extend_t_arr(2:end-1) = t_arr;
        
    tp_arr = (extend_t_arr(3:end)-extend_t_arr(1:end-2))/2;
end