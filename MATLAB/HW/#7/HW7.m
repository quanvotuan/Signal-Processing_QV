clc
close all

%% Prob. 1
% iv.

h = ones(1, 4);
x = ones(1, 9);
y = conv(h, x);
n = 0 : 11;
figure;
stem(n, y);
xlim([-0.2 11.2]);
ylim([-0.2, 4.2]);
xlabel('n');
ylabel('y[n]');



%% Filter has a highpass selectivity and matches (D).
z0 = 1;
p0 = -0.9;
C = 0.5; %% to match (D)
% Plot the magnitude response
w = -pi : (2*pi/10000) : pi;
Hnumer = (1 - z0*exp(-j*w));
Hdenom = (1 - p0*exp(-j*w));
H = C * Hnumer ./ Hdenom;
figure;
plot(w, abs(H));
xlim( [-pi pi] );
xlabel('w [rad/sample]');
ylabel('Magnitude Response');

%% Filter has a lowpass selectivity and matches (B).
z0 = 0;
p0 = 0.5;
C = 0.5; %% to match (B)
% Plot the magnitude response
w = -pi : (2*pi/10000) : pi;
Hnumer = (1 - z0*exp(-j*w));
Hdenom = (1 - p0*exp(-j*w));
H = C * Hnumer ./ Hdenom;
figure;
plot(w, abs(H));
xlim( [-pi pi] );
xlabel('w [rad/sample]');
ylabel('Magnitude Response');

%% Filter has a lowpass selectivity and matches (A)
z0 = -1;
p0 = 0.9;
C = 0.5; %% to match (A)
% Plot the magnitude response
w = -pi : (2*pi/10000) : pi;
Hnumer = (1 - z0*exp(-j*w));
Hdenom = (1 - p0*exp(-j*w));
H = C * Hnumer ./ Hdenom;
figure;
plot(w, abs(H));
xlim( [-pi pi] );
xlabel('w [rad/sample]');
ylabel('Magnitude Response')

%% Filter has a bandpass selectivity and matches (E).
% Zeros and numerator coefficients
z0 = 0;
z1 = 0;
b0 = 1;
b1 = -(z0+z1);
b2 = z0*z1;
numerCoeffs = [b0 b1 b2];
% Poles and denominator coefficients
p0 = 0.9*exp(j*pi/6);
p1 = 0.9*exp(-j*pi/6);
a0 = 1;
a1 = -(p0+p1);
a2 = p0*p1;
denomCoeffs = [a0 a1 a2];
% Gain for the filter
C = 1;
% Plot the magnitude response
w = -pi : (2*pi/10000) : pi;
Hnumer = (b0 + b1*exp(-j*w) + b2*exp(-j*2*w));
Hdenom = (a0 + a1*exp(-j*w) + a2*exp(-j*2*w));
H = C * Hnumer ./ Hdenom;
figure;
plot(w, abs(H));
xlim( [-pi pi] );
xlabel('w [rad/sample]');
ylabel('Magnitude Response')