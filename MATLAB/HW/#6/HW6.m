clc
close all
%% 1a.

% For the first-order unnormalized averaging filter (lowpass filter)
%      y[n] = x[n] + x[n-1]
% and the initial condition x[-1] = 0 as a necessary condition for LTI
% system properties to hold.
% Determine the formulas for, and plot in MATLAB, the following:

% i. impulse response
% How to find the impulse response?
%   h[n] = d[n] + d[n-1] where d[n] is the discrete-time delta signal
h = [1 1 0 0 0];
n = [0 1 2 3 4];
stem(n, h);
ylim([-0.5, 1.5]);
xlim([-0.5, 4.5]);

% ii. step response
%   ystep[n] = u[n] + u[n-1];
stepsignal = [1 1 1 1 1 1 1 1];
ystep = filter([1,1], 1, stepsignal);
n = [0 1 2 3 4 5 6 7];
figure;
stem(n ,ystep);
ylim([-0.5, 2.5]);
xlim([-0.5, 6]);
 
% iii. Plot the magnitude and phase of the frequency response using freqz.

% Hfreq(exp(j w) = 1+exp(-j) w)
figure;
freqz([1,1]);

figure;
zplane([1,1]);

%% 1b.
%{
 i. impulse response 
When x[n] = d[n], the output is:
    h[n] = d[n] - d[n-1] where d[n] is the discrete-time delta signal
%}

n = -2 : 5;
h = [ 0 0 1 -1 0 0 0 0 ];
figure;
stem(n, h)
ylim([-0.5, 1.5]);
xlim([-0.5, 4.5]);

%{
% ii. step response
%   ystep[n] = u[n] - u[n-1];
%}

n = -2 : 5;
unitstep = ( n >= 0 );
unitstepdelayed = ( (n-1) >= 0 );
ystep = unitstep - unitstepdelayed;
figure;
stem(n, ystep);
ylim([-0.5, 2.5]);
xlim([-0.5, 6]);

%{
% iii.Plot the magnitude and phase of the frequency response using freqz.
%}
figure;
freqz([1,-1]);

figure;
zplane([1,-1]);

%% 1c.
%{
Given: y[n] = x[n] − 2x[n-1] + x[n-2] for n ≥ 0 
and the initial conditions x[-1] = 0 and x[−2] = 0
%}

%{
 i. impulse response 
When x[n] = d[n], the output is:
    h[n] = d[n] - 2d[n-1] + d[n-2] where d[n] is the discrete-time delta signal
%}

n = -2 : 5;
h = [ 0 0 1 -2 1 0 0 0 ];
figure;
stem(n, h)
ylim([-0.5, 1.5]);
xlim([-0.5, 4.5]);

%{
% ii. step response
%   ystep[n] = u[n] - 2u[n-1] + u[n-2];
%}

n = -2 : 5;
unitstep = ( n >= 0 );
unitstepdelayed1 = ( (n-1) >= 0 );
unitstepdelayed2 = ( (n-2) >= 0 );
ystep = unitstep - 2*unitstepdelayed1 + unitstepdelayed2;
figure;
stem(n, ystep);
ylim([-0.5, 2.5]);
xlim([-0.5, 6]);

%{
% iii.Plot the magnitude and phase of the frequency response using freqz.
%}
figure;
freqz( [1 -2 1] );

figure;
zplane([1,1]);
