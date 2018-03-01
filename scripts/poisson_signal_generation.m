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
primes = nthprime(1:dom_primes); 
sig_len = 0;
seq_min = min(primes);
seq_max = max(primes);
poisson_seq = [];
while (sig_len ~= dom_primes)
    try_new_number = seq_min + (seq_max - seq_min) * rand;
    nums_in_interval = length(primes((primes >= try_new_number - 100) & (primes <= try_new_number + 100)));
    if (rand > (nums_in_interval / 200)) 
        continue;
    end
    poisson_seq = unique([poisson_seq try_new_number]);
    sig_len = length(poisson_seq);
end

prime_tails = nthprime(dom_primes + 1:num_primes);
sig_len = 0;
seq_min = min(prime_tails);
seq_max = max(prime_tails);
poisson_seq_tails = []; 
while (sig_len ~= 500)
    try_new_number = seq_min + (seq_max - seq_min) * rand;
    nums_in_interval = length(prime_tails((prime_tails >= try_new_number - 100) & (prime_tails <= try_new_number + 100)));
    if (rand > (nums_in_interval / 200)) 
        continue;
    end
    poisson_seq_tails = unique([poisson_seq_tails try_new_number]);
    sig_len = length(poisson_seq_tails);
end

extended_domain = [-1 * fliplr(poisson_seq(1:500)), poisson_seq, poisson_seq_tails];

% Construction of prime lattices and other arrays:

sample_domain = poisson_seq; % Define the actual domain that the primes run through (without the tails)
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
