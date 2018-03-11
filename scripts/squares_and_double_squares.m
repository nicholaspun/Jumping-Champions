%% Description: 

%% Useful Constants: 
maxSquare = 750; 

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
figure(1); 
subplot(2,1,1);
plot(sig);
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
