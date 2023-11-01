close all
clc

load echar512.mat;

% Parameter
N = 30;
M = 22; % Length of the filter impulse response 'rl'
n = 0:1:N;  % Time indices for the input signal
l = 0:1:M;  % Time indices for the filter impulse response
q = 0.9;   % Filter parameter 'q'
r = 0.9;   % Filter parameter 'r'

figure;
imshow(echart, [0 255]);

bdiffh = [1, -0.9];

% Apply FILTER-1 along the horizontal direction
filtered_horizontal = conv2(echart, bdiffh);

% Apply FILTER-1 along the vertical direction to the result from the horizontal filtering
ech90 = conv2(filtered_horizontal, bdiffh');

% Display the resulting image
figure;
imshow(ech90, [0 255]);
title('ech90');

% Initialize an array to store the filter impulse response 'rl'
rl = zeros(1, M + 1);

% Calculate the values of 'rl'
for ll = 0:1:M
    rl(ll+1) = r^ll;
end

% Deconvolve 'ech90' using 'rl' to recover the original signal
ech90_vector = ech90(:);  % Convert the image to a 1D vector
recover_ech90_vector = deconv(ech90_vector, rl);

% Reshape the recovered vector back to the image shape
recover_ech90 = reshape(recover_ech90_vector, size(ech90));

% Display the resulting image
figure;
imshow(recover_ech90, [0 255]);
title('Recover ech90');
