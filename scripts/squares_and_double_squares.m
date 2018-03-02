%% Description: 

%% Useful Constants: 
maxSquare = 400; 

%% Squares and Double Squares:
seq = getSquaresAndDoubledSquaresSequence(maxSquare);

% Reconstruction:
sig = getReconstructedSignalFromSequence(seq);

% Fourier Transform
fft_arr = mfft(sig);

%% Poisson:
poisson_based_seq = getPoissonDistributedSequence(seq); 

% Reconstruction:
poisson_signal = getReconstructedSignalFromSequence(poisson_based_seq);

% Fourier Transform
fft_poisson_arr = mfft(poisson_signal);


%% Figures:
figure(1); plot(sig);
figure(2); plot(fft_arr); xlim([0 length(fft_arr)]);
figure(3); plot(poisson_signal);
figure(4); plot(fft_poisson_arr); xlim([0 length(fft_poisson_arr)]);
