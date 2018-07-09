%% Description: 

%% Useful Constants: 
num_primes = 50000; % Change this number to change the amount of primes in the signal 

%% Primes:
primes_arr = nthprime(1:num_primes); 
domain = 1:max(primes_arr);
domain(isprime(domain)) = 1;
domain(~isprime(domain) & domain ~=1) = 0;

% Reconstructionr
prime_signal = reconstruct(domain, 1:max(primes_arr), 1:0.5:max(primes_arr));

% Fourier Transform
fft_arr = mfft(prime_signal);

%% Figures:
figure(1); plot(prime_signal);
figure(2); plot(fft_arr); xlim([0 length(fft_arr)]);