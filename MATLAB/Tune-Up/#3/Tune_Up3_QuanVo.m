%% Tune-Up #3
% Name: Quan Vo
% EID: qtv73
% Date: 9/12/2023

% Copy this file into a Matlab script window, add your code and answers to the
% questions as Matlab comments, hit "Publish", and upload the resulting PDF file
% to this page for the tune-up assignment.  Please do not submit a link to a file
% but instead upload the file itself.   Late penalty: 2 points per minute late.

% We will solve the questions in Section 2 of the mini-project #1
% https://users.ece.utexas.edu/~bevans/courses/signals/homework/miniproject1.pdfLinks to an external site.

% 1. Download the recording ‘violin-C4.wav’ of a violin playing ‘C’ in the fourth
% octave (‘C4’) on the Western scale from Prof. Dan Ellis' (Columbia University) at
%     https://www.ee.columbia.edu/~dpwe/sounds/instruments/Links to an external site.
% Please place the file in your MATLAB directory or in a directory on your
% MATLAB path.  The principal frequency of ‘C4’ is 261.63 Hz.

close all;

% 2. Please play and plot the audio signal, and describe what you hear.
% I hear a violin sounds that is increasing its pitch sighly for a short amount of time, then decresing its pitch for the remainning time.

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

% 3. Complete these parts of Section 2 of the mini-project #1 report.

% (a) Submit the time-domain plot of the recording.

% (b) What is the average value of the signal? Use the mean command
% to validate your observation.

% Mean = -0.0016 Hz
mean(instrumentSound)

% (c) Estimate the principal frequency of the note being played from
% the time-domain plot. Zoom the time-domain plot to 1.5s to 1.6s.
% You can do this using the MATLAB command,
% or the Zoom tool which is under the Tools menu in the figure window.
% To estimate the principal frequency, count the number of periods,
% estimate the fundamental period by dividing the duration of time
% by the number of periods, and invert the estimate of the fundamental
% period.  Use the Data Tips tool to click on the start of the first period
% and the end of the last period to estimate the duration of time.

%    i. Submit the zoomed plot from 1.5s to 1.6s.
%   ii. How does your estimate of the principal frequency compare with
%       the principal frequency of a ‘C4’ note?

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
% The McGill University Master Samples Links to an external site.collection of audio CD recordings?
% Irnore the link

% What is the sampling rate of recording in the file ‘violin-C4.wav’?
    % Audio CD = 44100 Hz
    % Sampling rates:11025 Hz

% What’s the ratio between these sampling rates?
    % 4-1 ratio compare to 44100 Hz

% Perosnal note:
    % How to get the sampling rate of the file?
    % -> Type fs in the command Window
    % *** Remove semicolon to print out to console
    % *** 26 peak, but 25 period
    % *** Use data tips under tools to determine the right tip & left tip -> computer (the time different / periods #) ***