%% Description: 
% This is the script used to produce the "prime signals" using
% generalized sampling theory.

%% Useful Constants: 
num_primes = 10000; % Change this number to change the amount of primes in the signal 

primes_arr_1 = nthprime(1:num_primes + 500); 
prime_signal_1 = getReconstructedSignalFromSequence(primes_arr_1);
fft_arr_1 = mfft(prime_signal_1);

primes_arr_2 = nthprime(num_primes + 1:num_primes*2 + 500); 
prime_signal_2 = getReconstructedSignalFromSequence(primes_arr_2, nthprime(num_primes + 1));
fft_arr_2 = mfft(prime_signal_2);

primes_arr_3 = nthprime(num_primes*2 + 1:num_primes*3 + 500); 
prime_signal_3 = getReconstructedSignalFromSequence(primes_arr_3, nthprime(num_primes*2 + 1));
fft_arr_3 = mfft(prime_signal_3);


%% Figures:
figure(1); 
subplot(3,1,1);
plot(fft_arr_1);
set(gca,'FontSize',24);
xlim([length(fft_arr_1)/2, length(fft_arr_1)]);
subplot(3,1,2);
plot(fft_arr_2);
set(gca,'FontSize',24);
ylabel("Amplitude");
xlim([length(fft_arr_2)/2, length(fft_arr_2)]);
subplot(3,1,3);
plot(fft_arr_3);
set(gca,'FontSize',24);
xlabel("Frequency");
xlim([length(fft_arr_3)/2, length(fft_arr_3)]);
