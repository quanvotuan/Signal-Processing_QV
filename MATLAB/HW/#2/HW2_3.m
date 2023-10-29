
%% a)
% Generate a chirp signal with frequency increasing from f0 to (f0 + fstep time) over time seconds
time = 10;
f0 = 220; % starting principle frequency
fstep = 400; % frequency slope
fs = 44100;
Ts = 1 / fs;
t = 0 : Ts : time;
theta = 2*pi*(f0 + 1/2*fstep*t) .*t;
% Why is there a .*t in the theta?

%% b)
y = cos(theta);
sound(y,fs); %Play back chirp signal

% The sound start out low, but then the amplitude and the pitch of the
% sound start to incresing over time until a uncomfortable level to hear.

%% c)
figure;
spectrogram(y, hamming(1024), 512, 1024, fs, 'yaxis');
ylim([0,5]);
title('Spectrogram of the signal P3');
ylabel('Frequency(kHz)');
xlabel('Time(s)');

% The spectrogram for the chirp signal shows the principal frequency changing over time with a linear slope.
% The principal frequency is initially at 220 Hz and increases linearly to 4280 Hz. The principal frequency has the highest
% magnitude at every instant of time throughout the entire duration of the chirp signal, which is shown in yellow.