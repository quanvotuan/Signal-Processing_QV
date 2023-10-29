clc
close all

w0 = 100*pi;
f0 = w0/(2*pi); %fundamental period in Hz

fs = 40*f0; %Sampling frequency in Hz
Ts = 1/fs; %Sampling time in seconds
t = -0.05:Ts:0.05;
x = 240*cos(w0*t)+240*cos(w0*t+pi/3);

xlabel('Time(s)');
ylabel('Amplitude');
plot(t,x);
grid on
hold on
figure;
xParta = 416 * cos(w0*t + pi/6);
plot(t, xParta);
grid on



