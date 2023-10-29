% Programmer:
%   Prof. Brian L. Evans
%   The University of Texas at Austin
%   bevans@ece.utexas.edu
% Date:
%   October 19, 2017

% Image dimensions
Nrows = 512;
Ncols = 512;
% Gray level intensity
Amin = 0;
Amax = 255;
Arange = [Amin Amax];
DCoffset = 127;
% Mid-Gray image
midgray = DCoffset * ones(Nrows, Ncols);
% Grayscale ramp
rampinc = (Amax - Amin) / Ncols;
ramp1D = Amin : rampinc  : Amax;
ramp2D = repmat(ramp1D, Nrows, 1);
% Generate sinsuoids
n1 = 1 : Nrows;
n2 = 1 : Ncols;
n1map = repmat(n1, Ncols, 1);
% Map [-1, 1] to [Amin, Amax]
a = (Amax - Amin)/2;
b = (Amax + Amin)/2;
% Low frequency: one cycle/image
Period0 = Ncols;
w0 = 2*pi*(1/Period0);
lowFreqIm = a*cos(w0*n1map)+b;
% Mid frequency: four cycles/image
Period1 = Ncols/4;
w1 = 2*pi*(1/(Ncols/4));
midFreqIm = a*cos(w1*n1map)+b;
% High frequency: 16 cycles/image
Period2 = Ncols/16;
w2 = 2*pi*(1/(Ncols/16));
highFreqIm = a*cos(w2*n1map)+b;
% Highest frequency
Period3 = 2;
w3 = 2*pi*(1/Period3);
highestFreqIm = a*cos(w3*n1map)+b;
% Displaying images
display('Hit any key for mid gray image');
pause; figure; imshow(midgray, Arange);
title('Mid Gray'); 
display('Hit any key for one row of image');
pause; figure; plot(midgray(1,:)); ylim(Arange);
title('Mid Gray - First Row');
display('Hit any key for intensity ramp');
pause; figure; imshow(ramp2D, Arange);
title('Intensity Ramp over Gray Levels');
display('Hit any key for one row of image');
pause; figure; plot(ramp2D(1,:)); ylim(Arange);
title('Intensity Ramp - First Row');
display('Hit any key for low-freq cosine');
pause; figure; imshow(lowFreqIm, Arange);
title('Low-Frequency Cosine');
display('Hit any key for one row of image');
pause; figure; stem(lowFreqIm(1,:)); ylim(Arange);
title('Low-Freq Cosine - First Row');
display('Hit any key for mid-freq cosine');
pause; figure; imshow(midFreqIm, Arange);
title('Mid-Frequency Cosine');
display('Hit any key for one row of image');
pause; figure; stem(midFreqIm(1,:)); ylim(Arange);
title('Mid-Freq Cosine - First Row');
display('Hit any key for high-freq cosine');
pause; figure; imshow(highFreqIm, Arange);
title('High-Frequency Cosine');
display('Hit any key for one row of image');
pause; figure; stem(highFreqIm(1,:)); ylim(Arange);
title('High-Freq Cosine - First Row');
display('Hit any key for highest-freq cosine');
pause; figure; imshow(highestFreqIm, Arange);
title('Highest Frequency Cosine');
display('Hit any key for one row of image');
pause; figure; stem(highestFreqIm(1,:)); ylim(Arange);
title('Highest-Freq Cosine - First Row');