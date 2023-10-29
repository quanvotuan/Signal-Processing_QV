% Tune-Up #2: Beat Frequencies

% Copy this file into a Matlab script window, add your code and answers to the
% questions as Matlab comments, hit "Publish", and upload the resulting PDF file
% to this page for the tune-up assignment.  Please do not submit a link to a file
% but instead upload the file itself.   Late penalty: 2 points per minute late.

% (a) Copy, paste and run the Matlab code from lecture slide 1-16
% to generate a cosine signal x(t) = cos(2 pi f0 t) with f0 = 440 Hz
% and play it as an audio signal for 3s at a sampling rate of fs = 8000 Hz.
% 440 Hz is an 'A' note on the fourth octave on the Western scale.
% See Piano key frequenciesLinks to an external site..

f0 = 440;               % note ‘A4’
fs = 8000;              % sampling rate
Ts = 1/fs;              % sampling time
t = 0 : Ts : 3;         % 3 seconds
x = cos(2*pi*f0*t);

% (b) Add to the code in (a) to generate a new signal
% y(t) = cos(2 pi f0 t) cos(2 pi f1 t) with f1 = 110 Hz by using the same
% sampling rate of fs = 8000 Hz.  The code on the left side of lecture
% slide 3-3 might be helpful.  Please remember to use the .* operator
% for pointwise multiplication of two vectors.

 
f1 = 110;
y = cos(2*pi*f0*t) .* cos(2*pi*f1*t);
% We merge 440 and 110 together 
% 440 + 110, 440 - 110

% (c) Add to the code in (b) to playing y(t) as an audio signal.
%      Describe what you hear.
%      Express y(t) as a sum of two sinusoids.
sound(0.5*y, fs)

% Sound like a gong but at a higher pitch and more consistent instead of decreasing over time like a gong,

% cos(2*pi*f0*t) = 1/2e^(-j2pi*f0*t) + 1/2e^(j2pi*f0*t)
% cos(2*pi*f1*t) = 1/2e^(-j2pi*f1*t) + 1/2e^(j2pi*f1*t)

% y(t) = cos(2*pi*f0*t) * cos(2*pi*f1*t);
% y(t) = [1/2e^(-j2pi*f0*t) + 1/2e^(j2pi*f0*t)] * [(1/2e^(-j2pi*f1*t) +
% 1/2e^(j2pi*f1*t)]


% (d) Plot one period of y(t).  We'll first need to find the period of y(t).
% The product of two sinusoids with frequencies f0 and f1 produces
% frequencies at f0+f1 and f0-f1.  You could modify the code from the
% bottom right side of lecture slide 3-3.

ffund = gcd(f0+f1, f0-f1); 
Tfund = 1/ffund;
% plot one period
t = 0 : Ts : Tfund;
y = cos(2*pi*f0*t) .* cos(2*pi*f1*t);
plot( t,y);

