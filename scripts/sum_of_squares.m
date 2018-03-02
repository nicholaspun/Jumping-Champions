%% Description: 

%% Useful Constants: 
maxSquare = 100; 

%% Implementation:
seq = getSumsOfSquaresSequence(maxSquare);

% Reconstruction:
sig = getReconstructedSignalFromSequence(seq);

% Fourier Transform
fft_arr = mfft(sig);

%% Implementation:
poisson_seq = getPoissonDistributedSequence(seq);

% Reconstruction:
poisson_sig = getReconstructedSignalFromSequence(poisson_seq);

% Fourier Transform
fft_poisson_arr = mfft(poisson_sig);

%% Figures:
figure(1); plot(sig);
figure(2); plot(fft_arr); xlim([0 length(fft_arr)]);
figure(3); plot(poisson_sig);
figure(4); plot(fft_poisson_arr); xlim([0 length(fft_poisson_arr)]);
