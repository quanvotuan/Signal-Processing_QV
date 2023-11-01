close all
clc

load echar512.mat;

% Parameter
N = 30;
M = 33; % Length of the filter impulse response 'rl'
n = 0:1:N;  % Time indices for the input signal
l = 0:1:M;  % Time indices for the filter impulse response
q = 0.9;   % Filter parameter 'q'
r = 0.9;   % Filter parameter 'r'

%figure;
%hAxes = axes(figure); 
%hImage = imshow(echart, [], 'Parent', hAxes);
%title(hAxes, 'Original echart image');

bdiffh = [1, -0.9];

% Apply FILTER-1 along the horizontal direction
filtered_horizontal = conv2(echart, bdiffh);

% Apply FILTER-1 along the vertical direction to the result from the horizontal filtering
ech90 = conv2(filtered_horizontal, bdiffh');


% Display the resulting image
figure;
imshow(ech90, []);
title('ech90');


% --- 

% Calculate the values of 'rl'
rl = r .^ l;

% Deconvolve 'ech90' using 'rl' to recover the original signal
%recover_ech90 = deconv(filtered_horizontal, rl);
re_v = conv2(ech90, rl');
rec = conv2(re_v, rl);

% Display the resulting image
figure;
imshow(rec, []);
title('Recover ech90');
% -------- %

%{
Why did we keep 512 rows and 512 colums

because the length h1 + length h2 -1
|h1| = 512; |h2| = 2 -> 513
%}

%% Visual quality
ech90cropped = ech90(1:512, 1:512);

ech90_rec_cropped = rec(1:512, 1:512);

% 2 image * 3 measure * 3 setting of M
% 18 images;

%Compare orgintial with ech90, orginial with the reconstruct
immse(ech90cropped, echart) 
psnr (ech90cropped, echart)
ssim (ech90cropped, echart)

immse(ech90_rec_cropped, echart)
psnr (ech90_rec_cropped, echart)
ssim (ech90_rec_cropped, echart)



