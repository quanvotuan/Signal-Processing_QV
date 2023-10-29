%% Mini-Project #1
% Name: Quan Vo
% EID: qtv73
% Date: 9/15/2023

close all;

% Read the contents of the audio file
waveFilename = 'violin-C4.wav';
[instrumentSound, fs] = audioread(waveFilename);

% Play back the recording with automatic scaling
soundsc(instrumentSound, fs);

% Plot the waveform in the time domain
N = length(instrumentSound);
Ts = 1/fs;
Tmax = (N-1)*Ts;
t = 0 : Ts : Tmax;
figure;
plot(t, instrumentSound);
xlabel('Time [s]');
ylabel('Signal amplitude');

% Mean = -0.0016 Hz
mean(instrumentSound)

%c)
% i.
figure;
plot(t, instrumentSound);
xlabel('Time [s]');
ylabel('Signal amplitude');
xlim( [1.5 1.6] );

% ii.
% Compute Fund period
    % Right tip: 1.50295
    % Left tip: 1.599
    % 25 period
fundPeriod = (1.599 - 1.50295)/25 % 1 fund period
fundFrequency = 1/ fundPeriod
C4funcFrequency = 261.63; % fund Frequency of C4: 261.63 Hz

Diff_C4toEstimate = C4funcFrequency - fundFrequency
% The different between 'C4' note with the estimate is 1.3489 Hz, which is
% close enough.

% (d) What is the sampling rate of the original recording the

% What is the sampling rate of recording in the file ‘violin-C4.wav’?
    % Audio CD = 44100 Hz
    % Sampling rates = 11025 Hz

% What’s the ratio between these sampling rates?
    % 4-1 ratio compare to 44100 Hz

% Perosnal note:
    % How to get the sampling rate of the file?
    % -> Type fs in the command Window
    % *** Remove semicolon to print out to console
    % *** 26 peak, but 25 period
    % *** Use data tips under tools to determine the right tip & left tip -> computer (the time different / periods #) ***

% Done with 2.2

