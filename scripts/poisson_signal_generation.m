%% Description: 
% This is the script used to produce the poisson-distrbuted "prime signals" using
% generalized sampling theory.

%% Useful Constants: 
dom_primes = 1000; % Change this number to change the amount of primes in the signal 

% DO NOT CHANGE! 
tails = 500;
num_primes = dom_primes + tails;
lp_length = num_primes + tails;
% DO NOT CHANGE! 

%% Implementation:
extended_domain = getPoissonDistributedSignal(nthprime(1:num_primes));
disp(length(extended_domain));
sample_domain = extended_domain(501:end-500);

samps = ones(1, dom_primes); % set the amplitudes 
new_domain = 1:max(sample_domain); % Define the new domain (Every integer value from 1 to the highest prime)
d_extended_domain = calc_t_prime(extended_domain); % Derivative Lattice 

% Reconstruction:
p_signal = greconv2(samps, sample_domain, extended_domain, d_extended_domain, new_domain);

% Fourier Transform
fft_arr = mfft(p_signal);

%% Figures:
figure(1); plot(p_signal);
figure(2); plot(fft_arr); xlim([0 length(fft_arr)]);
