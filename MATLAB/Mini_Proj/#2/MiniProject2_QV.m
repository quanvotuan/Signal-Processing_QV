close all
clc

% Copy this file into a Matlab script window, add your code and answers to the
% questions as Matlab comments, hit "Publish", and upload the resulting PDF file
% to this page for the tune-up assignment. Please do not submit a link to a file
% but instead upload the file itself. Late penalty: 2 points per minute late.
% This tuneup is to help you get started on the mini project number #2
% (a) Load the image. Download the image from
% https://users.ece.utexas.edu/~bevans/courses/signals/homework/ echar512.matLinks to an external site.
% and place it in the current directory or a directory on the Matlab path. load echar512.mat
% The load command will define a Matlab matrix echart.

load echar512.mat;

% (b) Display the image.
figure;
imshow(echart, [0 255]);

bdiffh = [1, -1];
yy1 = conv2(echart, bdiffh);
figure;
imshow(yy1, []);

% conv2 command only apply to 1 dimension array 

%Compare the two images and give a qualitative description of what you see
%{
The 1st image: Default
2nd image: Filter all rows in horizontal direction

Compare to the 1st image, instead of a union distribution of white pixel on
the edge outlining the shape of the letter and fill in black pixels.

The second image keep some edge as black (-255), some edges white (255)
different for each letter and fill the pixels inside the letter as gray
(0). Also most of the vertical edge on the left side of the letters are fill with
black pixels compare to the vertical edge on the right which is fill with white
pixels.



%}

%-> The background of the image got reverse from white to black
% -> For the letter, there only the edges of letter who got inverted ->
% white; the rest of them stay as black.

yy2 = conv2(echart,bdiffh');
figure;
imshow(yy2 ,[]);

%{ 
My reponse:
    The 1st image: Default
    3nd image: Filter all colums in vertical direction
    
    Compare to the 1st image, instead of a union distribution of white pixel on
    the edge outlining the shape of the letter and fill in black pixels.
    
    The 3rd image show nearly similar output as the 2nd image. However,
    instead of showing white pixels on the vertical edge of the letters,
    the white pixels show up on the horizontal edges. Also, the Black horizontal edges always ontop of the white
    horizontal edge.

    For example: The letter E, there are 3 horizontal white edges of the
    letter. 
 
keep some edge as black (-255), some edges white (255)
    different for each letter and fill the pixels inside the letter as gray
    (0). Also most of the vertical edge on the left side of the letters are fill with
    black pixels compare to the vertical edge on the right which is fill with white
    pixels.

%}


%-> The background of the image got reverse from white to black
% -> For the letter, there only the edges of letter who got inverted ->
% white; the rest of them stay as black.

% Why does the letter only show up in the edges?
% Difference filter => y[n] = x[n] - x[n-1]
% -> Because the difference from white -> black = 255 - 0 = 255 (Stay white)
% compare to the difference from black -> white = 0 - 255 = -255 (Extra black)


% -------------------- Not related, just extra resources ------------------
% %

% (d) Apply a two-point averaging filter along the rows.
% Display the resulting image.
% Describe the result image compared to the original.

%{
FIRcoefficients1 = [1 1];
echartFilteredAlongRows1 = filter(FIRcoefficients1, 1, echart, [], 2);
figure;
imshow(echartFilteredAlongRows1);
%}

% (e) Apply a three-point averaging filter along the rows..
% Display the resulting image.

%{
FIRcoefficients2 = [1 1 1];
echartFilteredAlongRows2 = filter(FIRcoefficients2, 1, echart, [], 2);
figure;
imshow(echartFilteredAlongRows2);
%}

