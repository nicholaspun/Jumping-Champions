function fft_arr = mfft(sig)
% This is more of an alias than an actual useful function. 
% mfft modifies the fourier transform so that it's easier to analyze
% visually.
%
% Input:
%   sig - Array.  
%
% Output:
%   fft_arr - Array. 
%
    fft_arr = abs(fftshift(fft(detrend(sig))));
end