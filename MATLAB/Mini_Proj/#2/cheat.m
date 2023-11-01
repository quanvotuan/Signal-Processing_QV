clc;
close all;
clear all;

% Define parameters for the sequence
N = 30;     % Length of the input signal 'delta(n)'
M = 15;     % Length of the filter impulse response 'rk'
n = 0:1:N;  % Time indices for the input signal
k = 0:1:M;  % Time indices for the filter impulse response
q = 0.85;   % Filter parameter 'q'
r = 0.85;   % Filter parameter 'r'

% Generate the delta (Dirac) function 'delta(n)'
delta_n = (n == 0);

% Define the numerator and denominator coefficients of the filter
B = [1 -0.85];  % Numerator coefficients
A = [1];        % Denominator coefficients (simple FIR filter)

% Apply the filter to the delta function 'delta(n)' to get 'wn'
wn = filter(B, A, delta_n);

% Initialize an array to store the filter impulse response 'rk'
rk = zeros(size(k));

% Calculate the values of 'rk' using the geometric sequence formula
for k = 0:1:M
    rk(k+1) = r.^k;
end

% Apply the filter with impulse response 'rk' to 'wn' to get 'yn'
yn = filter(rk, A, wn);
yn;

% Create a figure for plotting
figure

% Plot the delta (Dirac) function 'delta(n)'
subplot(3,1,1);
stem(n, delta_n);
title('Delta (Dirac) Function: \delta(n)');
xlabel('Time Index (n)');
ylabel('Amplitude');

% Plot the filtered signal 'wn'
subplot(3,1,2);
stem(n, wn);
title('Filtered Signal: wn[n]');
xlabel('Time Index (n)');
ylabel('Amplitude');

% Plot the output signal 'yn'
subplot(3,1,3);
stem(n, yn);
title('Output Signal: yn[n]');
xlabel('Time Index (n)');
ylabel('Amplitude');