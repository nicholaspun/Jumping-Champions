%% Description: 

%% Useful Constants: 
maxSquare = 100; 

% DO NOT CHANGE! 
tails = 500;
num_primes = maxSquare + tails;
% DO NOT CHANGE! 

%% Implementation:
seq = getSumsOfSquaresSignal(maxSquare);
sample_domain = seq(1:end-500);
extended_domain = [-1 * fliplr(seq(1:500)), seq];

samps = ones(1, length(sample_domain)); % set the amplitudes 
new_domain = 1:max(sample_domain); % Define the new domain (Every integer value from 1 to the highest prime)
d_extended_domain = calc_t_prime(extended_domain); % Derivative Lattice 

% Reconstruction:
p_signal = greconv2(samps, sample_domain, extended_domain, d_extended_domain, new_domain);

% Fourier Transform
fft_arr = mfft(p_signal);

%% Figures:
figure(1); plot(p_signal);
figure(2); plot(fft_arr); xlim([0 length(fft_arr)]);
