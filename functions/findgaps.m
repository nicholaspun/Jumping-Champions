function gaps = findgaps(fft, Hz)
% findgaps: Returns the size of the gap corresponding to a certain
% frequency "Hz" in the Fourier Transform of a function.
%
% For any discrete signal, the maximum frequency that can occur is exactly
% half the length of the signal. This comes from the fact that the fastest
% oscillation is exactly two points. 
% The effective frequency of "Hz" is:
%  - (maximum frequency - Hz) if  maximum frequency > Hz
%  - (Hz - (maximum frequency + 1)) if maximum frequency < Hz, the (+1)
%  used for proper indexing in the array. 
%
% Dividing the total length of the array "fft" by the frequency gives the
% amount of points needed for one oscillation of a sine wave of said
% frequency.
% 
% Inputs:
%   fft - Array. Fourier Transform.
%   Hz - Array or single Real. Selected frequencies in the Fourier Transform
%
% Output:
%   gaps - Array or single Real. The gaps corresponding to the frequencies
%   in "Hz".
%
    
    gaps = zeros(1, length(Hz)); % preallocation
    fftlen = length(fft);
    max_f = fftlen/2;
    
    index = 1;
    for f = Hz
        if (max_f < f)
            gaps(index) = fftlen/(f - (max_f + 1));
        else
            gaps(index) = fftlen/(max_f - f);
        end
        index = index + 1;
    end
        
end
