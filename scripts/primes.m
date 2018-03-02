%% Description: 
% This is the script used to produce the "prime signals" using
% generalized sampling theory.

%% Useful Constants: 
num_primes = 1000; % Change this number to change the amount of primes in the signal 

%% Primes:
primes_arr = nthprime(1:num_primes); 

% Reconstruction:
prime_signal = getReconstructedSignalFromSequence(primes_arr);

% Fourier Transform
fft_arr = mfft(prime_signal);

%% Poisson:
poisson_based_on_primes = getPoissonDistributedSequence(primes_arr); 

% Reconstruction:
poisson_signal = getReconstructedSignalFromSequence(poisson_based_on_primes);

% Fourier Transform
fft_poisson_arr = mfft(poisson_signal);

%% Figures:
figure(1); plot(prime_signal);
figure(2); plot(fft_arr); xlim([0 length(fft_arr)]);
figure(3); plot(poisson_signal);
figure(4); plot(fft_poisson_arr); xlim([0 length(fft_poisson_arr)]);
