%% 3.2.1
close all
clc
% Parameter
N = 5;
M = 33; % Length of the filter impulse response 'rl'
n = -1:1:N;  % Time indices for the input signal
l = 0:1:M;  % Time indices for the filter impulse response
q = 0.9;   % Filter parameter 'q'
r = 0.9;   % Filter parameter 'r'

%Generate an Impulse func 'delta(n)'
delta_n = (n == 0);

% Define the FIR coefficients
FIR1coeff = [1, -0.9]; % FIR filter coefficients

% Apply the filter to the delta function 'delta(n)' to get 'wn'
wn = filter(FIR1coeff, 1, delta_n);

% Initialize an array to store the filter impulse response 'rl'
rl = zeros(size(l));

% Calculate the values of 'rl' 
rl = r .^ l; 

% Apply the filter with impulse response 'rl' to 'wn' to get 'yn'
yn = filter(rl, 1, wn);
yn;

% Plot the Impulse Function
figure;
subplot(3,1,1);
stem(n, delta_n);
title('Impulse Function: \delta(n)');
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

%% 3.2.2
load echar512.mat;

% (b) Display the image.
hAxes = axes(figure); 
hImage = imshow(echart, [], 'Parent', hAxes);
title(hAxes, 'Original echart image');
%imshow(echart, []);

% Apply the 1st FIR filter
bdiffh = [1, -q];
% Apply FILTER-1 along the horizontal direction
filtered_horizontal = conv2(echart, bdiffh);
% Apply FILTER-1 along the vertical direction to the result from the horizontal filtering
ech90 = conv2(filtered_horizontal, bdiffh');


% Display the resulting image
eAxes = axes(figure); 
ech90Image = imshow(ech90, [], 'Parent', eAxes);
title(eAxes, 'ech90 Image');


% --- 

% Deconvolve 'ech90' using 'rl' to recover the original signal
% 1. Calculate the values of 'rl'
    % This code is equivalent with a for loop to calculate the sum of r
rl = r .^ l; 

% 2. recover the image
re_v = conv2(ech90, rl');
ech90rec = conv2(re_v, rl);

% 3. Display the resulting image
e2Axes = axes(figure); 
ech90rec_Image = imshow(ech90rec, [], 'Parent', e2Axes);
title(e2Axes, 'Recover ech90 Image');

%% Visual quality
% Cropping
ech90_cropped = ech90(1:512, 1:512);
ech90rec_cropped = ech90rec(1:512, 1:512);

% 2 image * 3 measure * 3 setting of M
% 18 images;

%Compare orgintial with ech90, orginial with the reconstruct

% IMMSE: compute the mean squared error (MSE) 
% where a lower score is better, but the scores might not align well with human perception of quality.
immse(ech90_cropped, echart)
immse(ech90rec_cropped, echart)

% PSNR: to compute the peak signal-to-noise ratio (PSNR) 
% in dB where a higher score is better, but the scores might not align well with human perception of quality.
psnr (ech90_cropped, echart)
psnr (ech90rec_cropped, echart)

% SSIM: compute the structural similarity (SSIM) 
% index on a scale of 0 to 1 where a higher score is better, and the scores align well with human perception of quality.
ssim (ech90_cropped, echart)
ssim (ech90rec_cropped, echart)