%% Description: 
% This is the script used to produce the "prime signals" using
% generalized sampling theory.

%% Useful Constants: 
dom_primes = 1000; % Change this number to change the amount of primes in the signal 

% DO NOT CHANGE! 
tails = 500;
num_primes = dom_primes + tails;
lp_length = num_primes + tails;
% DO NOT CHANGE! 

%% Implementation:
% Construction of prime lattices and other arrays:
temp_arr = nthprime(1:num_primes); 
neg_primes = fliplr(-1*temp_arr(1:500));

long_x = zeros(1, lp_length);
long_x(1:500) = neg_primes;
long_x(501:end) = temp_arr;

x = temp_arr(1:dom_primes); % Define the actual domain that the primes run through (without the tails)
y = ones(1, dom_primes); % set the amplitudes 
xx = 1:max(x); % Define the new domain (Every integer value from 1 to the highest prime)
d_long_x = calc_t_prime(long_x); % Derivative Lattice 

% Reconstruction:
p_signal = greconv2(y, x, long_x, d_long_x, xx);

% Fourier Transform
fft_arr = mfft(p_signal);

%% Figures:
figure(1); plot(p_signal);
figure(2); plot(fft_arr); xlim([0 length(fft_arr)]);
