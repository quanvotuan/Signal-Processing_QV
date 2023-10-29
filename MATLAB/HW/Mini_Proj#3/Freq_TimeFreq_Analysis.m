close all

% Read the contents of the audio file
waveFilename = 'violin-C4.wav';
[instrumentSound, fs] = audioread(waveFilename);

% Play back the recording with automatic scaling
% soundsc(instrumentSound, fs);

% Plot the magnitude of the frequency content
% using a discrete-time version of the Fourier series
fourierSeriesCoeffs = fft(instrumentSound);
N = length(instrumentSound);
freqResolution = fs / N;
ff = (-fs/2) : freqResolution : (fs/2)-freqResolution;
figure;
plot(ff, abs(fftshift(fourierSeriesCoeffs)));
xlabel('f');
xlim( [-1000 1000] );
% ylabel('Signal amplitude');
    % What are the lable suppose to be?
    % Explain how you determined the gain, frequency, and phase values, 
    % including any MATLAB code you ve written.

positive_frequencies = ff(ff >= 0);
% Find the maximum magnitude and its index
    % This form of max returns both the maximum value (max_val) and its 
    % index (max_idx) in the array. If there are multiple occurrences 
    % of the maximum value, it returns the index of the first occurrence.
[max_magnitude, max_index] = max(abs(fftshift(fourierSeriesCoeffs)));
    
% Determine the gain, frequency, and phase
peak_gain = max_magnitude;
peak_frequency = positive_frequencies(max_index);
peak_phase = angle(fftshift(fourierSeriesCoeffs(max_index)));

% Display the results
fprintf('Gain: %.2f\n', peak_gain);
fprintf('Frequency: %.2f Hz\n', peak_frequency);
fprintf('Phase: %.2f radians\n', peak_phase);

%{

% Plot the magnitude spectrum
figure;
plot(ff, abs(fftshift(fourierSeriesCoeffs)));
xlabel('f');
hold on;
plot(peak_frequency, peak_gain, 'ro', 'MarkerSize', 10);
title('Magnitude Spectrum with Peak');
legend('Magnitude', 'Peak');

%}

% ------------------------------------------------- %

%c)
% Plot the spectrogram
figure;
blockSize = round(N/4);
overlap = round(0.875 * blockSize);
spectrogram(instrumentSound, blockSize, overlap, blockSize, fs, 'yaxis');

% d) From the spectrogram, for what range of time is the principal frequency present?
    % Based on the plot, we concluded that it last the entire time frame

% ------------------------------------------------- %

%3a.

% Identify the indices of the largest peaks (adjust as needed)
indices_two_largest = [914, 37587]; % Adjust these indices
% fk = -522.9 Hz -> 36674
% fk = 522.9 Hz -> 1827
% Re-compute the fk
indices_four_largest = [914, 37587, 1827, 36674]; % Add two more indices as needed

% Extract the corresponding complex coefficients
coefficients_two_largest = fourierSeriesCoeffs(indices_two_largest);
coefficients_four_largest = fourierSeriesCoeffs(indices_four_largest);



% Create a new vector with all zeros
synthesized_signal_two_largest = zeros(size(fourierSeriesCoeffs));
synthesized_signal_four_largest = zeros(size(fourierSeriesCoeffs));

% Set the values at the identified indices to the complex coefficients
synthesized_signal_two_largest(indices_two_largest) = coefficients_two_largest;
synthesized_signal_four_largest(indices_four_largest) = coefficients_four_largest;

% Inverse Fourier Transform to synthesize the audio signals
audio_signal_two_largest = ifft(synthesized_signal_two_largest);
audio_signal_four_largest = ifft(synthesized_signal_four_largest);

% Play the synthesized audio signals
soundsc(real(audio_signal_two_largest), fs);
pause(length(audio_signal_two_largest) / fs); % Pause for the duration of the audio
soundsc(real(audio_signal_four_largest), fs);

%Describe each synthesized audio sound like:


%3b.
% Needs fourierSeriesCoeffs vector computed in Section 2.3 above
Nseries = length(fourierSeriesCoeffs);
fourierSeriesCoeffsAbs = abs(fourierSeriesCoeffs);

% Nkeep must be even to have an equal number of negative and positive freq.
Nkeep = 10;
synthSoundCoeffs = zeros(Nseries, 1);

% Find the Nkeep strongest positive and negative frequency components
for n = 1:Nkeep
[ak, k] = max(fourierSeriesCoeffsAbs);
synthSoundCoeffs(k) = fourierSeriesCoeffs(k);
fourierSeriesCoeffsAbs(k) = 0;
end

% Convert Fourier series coefficients to time domain using inverse FFT
synthSound = ifft(synthSoundCoeffs);
soundsc(synthSound, fs);

% i. Keep 2, 4, 6, and 8 of the largest peaks and describe what you hear.
% ii. Give the peak frequencies of the peaks for each case of keeping 2, 4, and 6 largest peaks.

