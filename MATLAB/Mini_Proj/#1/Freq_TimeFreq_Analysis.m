close all
clear all
clc

%% Section 2.2 Time-Domain Analysis
% Read the contents of the audio file
waveFilename = 'violin-C4.wav';
[instrumentSound, fs] = audioread(waveFilename);

% Play back the recording with automatic scaling
% soundsc(instrumentSound, fs);

%a) Plot the waveform in the time domain
N = length(instrumentSound);
Ts = 1/fs;
Tmax = (N-1)*Ts;
t = 0 : Ts : Tmax;
figure;
plot(t, instrumentSound);
xlabel('Time [s]');
ylabel('Signal amplitude');

%b) Mean = -0.0016 Hz
mean(instrumentSound)

%c)
% i. Plot
figure;
plot(t, instrumentSound);
xlabel('Time [s]');
ylabel('Signal amplitude');
xlim( [1.5 1.6] );

% ii. Compute Fund period
    % Right tip: 1.50295
    % Left tip: 1.599
    % 25 period
fundPeriod = (1.599 - 1.50295)/25; % 1 fund period
fundFrequency = 1/ fundPeriod;
C4funcFrequency = 261.63; % fund Frequency of C4: 261.63 Hz

Diff_C4toEstimate = C4funcFrequency - fundFrequency;

% -------------- Done with 2.2 ---------------- %

%% Section 2.3 Frequency and Time-Frequency Analysis

% Read the contents of the audio file
waveFilename = 'violin-C4.wav';
[instrumentSound, fs] = audioread(waveFilename);

% Play back the recording with automatic scaling
soundsc(instrumentSound, fs);
pause(4);

%a) Plot the magnitude of the frequency content using a discrete-time version of the Fourier series
fourierSeriesCoeffs = fft(instrumentSound);
N = length(instrumentSound);
freqResolution = fs / N;
ff = (-fs/2) : freqResolution : (fs/2)-freqResolution;
figure;
plot(ff, abs(fftshift(fourierSeriesCoeffs)));
xlabel('frequency (1/s)');
ylabel('magnitude')
xlim( [-1000 1000] );

%b) Gain, frequency, and phase values
positive_freq = ff(ff>=0);
% Find the maximum magnitude and its index
[max_magnitude, max_index] = max(abs(fourierSeriesCoeffs));
% Determine the frequency corresponding to the peak
peak_frequency = positive_freq(max_index);
% Calculate the phase of the peak
peak_phase = angle(fourierSeriesCoeffs(max_index));

% Display the computed values
fprintf('Gain (Magnitude): %f\n', max_magnitude);
fprintf('Frequency: %f Hz\n', peak_frequency);
fprintf('Phase: %f radians\n\n', peak_phase);

%c) Plot the spectrogram
figure;
blockSize = round(N/4);
overlap = round(0.875 * blockSize);
spectrogram(instrumentSound, blockSize, overlap, blockSize, fs, 'yaxis');

% ---------------- Done with 2.3 ---------------- %

%% Section 3.0 Synthesizing the Sound 
fprintf('--------Section 3a)--------\n\n');
% a) Manually synthezing
indices_two_largest = [914, 37588]; % Adjust these indices
indices_four_largest = [914, 37588, 1827, 36675]; % Add two more indices as needed

% Extract the corresponding coefficients
coefficients_two_largest = fourierSeriesCoeffs(indices_two_largest);
coefficients_four_largest = fourierSeriesCoeffs(indices_four_largest);

% Create a new vector with all zeros w/ size w/ FourierSeriesCoeffs
synthesized_signal_two_largest = zeros(size(fourierSeriesCoeffs));
synthesized_signal_four_largest = zeros(size(fourierSeriesCoeffs));

% Set the values at the identified indices to the coefficients
synthesized_signal_two_largest(indices_two_largest) = coefficients_two_largest;
synthesized_signal_four_largest(indices_four_largest) = coefficients_four_largest;

% Inverse Fourier Transform to synthesize the audio signals
audio_signal_two_largest = ifft(synthesized_signal_two_largest);
audio_signal_four_largest = ifft(synthesized_signal_four_largest);

% Play the synthesized audio signals
soundsc(real(audio_signal_two_largest), fs);
pause(4);
soundsc(real(audio_signal_four_largest), fs);

%% b)
fprintf('--------Section 3b)--------\n');
% Needs fourierSeriesCoeffs vector computed in Section 2.3 above
Nseries = length(fourierSeriesCoeffs);
fourierSeriesCoeffsAbs = abs(fourierSeriesCoeffs);

% Nkeep must be even to have an equal number of negative and positive freq.
Nkeep = 8;
synthSoundCoeffs = zeros(Nseries, 1);

fprintf('Keep %d highest peaks\n',Nkeep);
% Find the Nkeep strongest positive and negative frequency components
for n = 1:Nkeep
[ak, k] = max(fourierSeriesCoeffsAbs);
synthSoundCoeffs(k) = fourierSeriesCoeffsAbs(k);

% Logic to print out the correct Frequency
if(k <= (N/2 - 1))
    peak_freq = (k-1)*fs/N;
else
    peak_freq = (k-1-N)*fs/N;
end

fprintf('Frequencies: %s Hz\n', num2str(peak_freq'));
fourierSeriesCoeffsAbs(k) = 0;
end

% Convert Fourier series coefficients to time domain using inverse FFT
synthSound = ifft(synthSoundCoeffs);
soundsc(real(synthSound), fs);
pause(4)

%% c)
fprintf('--------Section 3c)--------\n');
freq_resolution = fs / N; % Frequency resolution for FFT
masking_range = 7.5;

Nkeep_values = [2, 4, 6, 8];

for i = 1:length(Nkeep_values)
    Nkeep = Nkeep_values(i);

    % Reset coefficients, absolute values, and peak frequencies
    fourierSeriesCoeffsAbs = abs(fourierSeriesCoeffs);
    peak_frequencies = zeros(Nkeep, 1);
    synthSoundCoeffs = zeros(Nseries, 1);

    % Find and keep the Nkeep strongest positive and negative frequency components
    for n = 1:Nkeep
        [ak, k] = max(fourierSeriesCoeffsAbs);
        % peak_frequencies(n) = ff(k); % Store peak frequency
        
        if(k <= (N/2 - 1))
            peak_frequencies(n) = (k-1)*fs/N;
        else
            peak_frequencies(n) = (k-1-N)*fs/N;
        end

        % Compute kmin and kmax for frequency masking
        kmin = k - round(masking_range / freq_resolution);
        kmax = k + round(masking_range / freq_resolution);
        
        % Zero out frequencies within the masking range
        fourierSeriesCoeffsAbs(max(1, kmin) : min(Nseries, kmax)) = 0;

        % Keep the current peak by setting its coefficient
        synthSoundCoeffs(k) = fourierSeriesCoeffs(k);
    end

    % Convert Fourier series coefficients to the time domain using inverse FFT
    synthSound = ifft(synthSoundCoeffs);
    
    % Print peak frequencies for this case
    fprintf('Keeping %d largest peaks:\n', Nkeep);
    fprintf('Peak Frequencies: %s Hz\n', num2str(peak_frequencies'));
    fprintf('\n');

    % Play the synthesized audio and describe what you hear
    soundsc(real(synthSound), fs);
    pause((length(synthSound) / fs) + 2); % Pause for the duration of the audio
end
