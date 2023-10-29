clc
close all

f0 = 440;
fs = 8000;
Ts = 1/fs;
t = 0:Ts:5;
x = cos(2*pi*f0*t);
y_a = x.^2;
y_b = exp(x);

%% x(t)
figure(1)
spectrogram(x, hamming(256), 128, 256, fs, 'yaxis')
sound(x,fs)
pause(5);

%% a)
figure(2)
spectrogram(y_a, hamming(256), 128, 256, fs, 'yaxis')
soundsc(y_a,fs)
pause(5);

%% b)
figure(3)
spectrogram(y_b, hamming(256), 128, 256, fs, 'yaxis')
soundsc(y_b,fs)
pause(5);