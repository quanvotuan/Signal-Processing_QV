% Tune-Up #8

% Copy this file into a Matlab script window, add your code and answers to the
% questions as Matlab comments, hit "Publish", and upload the resulting PDF file
% to this page for the tune-up assignment.  Please do not submit a link to a file
% but instead upload the file itself.   Late penalty: 2 points per minute late.

% Homework problem 8.2
% (a)iv.  Convolve x(t) and h(t) where
%    x(t) is a rectangular pulse that lasts from 0 seconds to 9 seconds
%     h(t) is a rectangular pulse that lasts from 0 seconds to 4 seconds

% Perform the convolution in continuous time using cconvdemo from
% Signal Processing First.  Install the code from
% https://dspfirst.gatech.edu/matlab/ZipFiles/cconvdemo-v218.zip .
% Please copy and paste the link into your browser, and unzip the contents in
% your local Matlab directory.  Change directories to cconvdemo and run the
% command cconvdemo.

% Just type in cconvdemo -> to run the program after added it to PATH

% Describe the output y(t).

%% My response:
% The output have a shape of Traperzoid, the duration of the output is the sum of both the input and the impulse
% response. It also plattow in 9 sections due to completely overlap and decline
% as partial overlap occur.

% Duration of the triangle are the sum of both input signal