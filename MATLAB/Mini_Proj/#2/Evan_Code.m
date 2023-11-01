% The load command will define a Matlab matrix echart.
load echar512.mat

% Display the image. 
hAxes = axes(figure); 
hImage = imshow(echart, [], 'Parent', hAxes);
title(hAxes, 'Original echart image');

% Apply a first-order difference filter along the rows.
% Display the resulting image.
bdiffh = [1, -1];
yy1 = conv2(echart, bdiffh);
hAxes1 = axes(figure); 
hImage1 = imshow(yy1, [], 'Parent', hAxes1);
title(hAxes1, 'echart image filtered with [1 -1] along the rows');

% Apply a first-order difference filter along the columns.
% Display the resulting image.
bdiffh = [1, -1];
yy2 = conv2(echart, bdiffh');
hAxes2 = axes(figure); 
hImage2 = imshow(yy2, [], 'Parent', hAxes2);
title(hAxes2, 'echart image filtered with [1 -1] along the columns');

%% Section 3.2: Image Restoration

% h1[n] has non-zero coefficients of 1 and -q:
q = 0.9;
h1 = [ 1 -q ];

% h2[n] = r^n for 0 <= n <= M and zero elsewhere:
r = 0.9;
M = 22;
n = 0 : M;
h2 = r .^ n;

ech90cropped = ech90(1:512, 1:512);