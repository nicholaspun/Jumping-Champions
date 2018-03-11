%% Description: 
% This is the script used to produce the "prime signals" using
% generalized sampling theory.

%% Useful Constants: 
num_primes = 50000; % Change this number to change the amount of primes in the signal 

% %% Primes:
primes_arr = nthprime(1:num_primes); 
% 
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
figure(1); 
subplot(2,1,1);
plot(p_signal);
set(gca,'FontSize',24);
subplot(2,1,2);
plot(poisson_signal);
set(gca,'FontSize',24);

figure(2); 
subplot(2,1,1);
plot(fft_arr);
set(gca,'FontSize',24);
xlim([length(fft_arr)/2 length(fft_arr)]);
subplot(2,1,2);
plot(fft_poisson_arr);
set(gca,'FontSize',24);
xlabel("Frequency");
ylabel("Amplitude");
xlim([length(fft_poisson_arr)/2 length(fft_poisson_arr)]);

