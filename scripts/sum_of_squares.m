%% Description: 

%% Useful Constants: 
maxSquare = 150; 

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
figure(1); 
subplot(2,1,1);
plot(sig);
set(gca,'FontSize',24);
subplot(2,1,2);
plot(poisson_sig);
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
