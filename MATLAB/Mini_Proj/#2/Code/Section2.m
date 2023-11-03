close all
clc

load echar512.mat;

% (b) Display the image.
figure;
imshow(echart, []);

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
the edge outlining the shape of the letter and fill the inside with black pixels.

The second image keep some edge as black (-255), some edges white (255)
different for each letter and fill the pixels inside the letters as grey (0). 
Also most of the vertical edge on the left side of the letters are fill with
black pixels compare to the vertical edge on the right which is fill with white
pixels.


%}

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


%%

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

Hints:
    FIR Filtering an Image
    Apply a 1-D finite impulse response (FIR) filter with filter coefficients b across each row of an image x to produce a new image y2:
    y2 = filter(b, 1, x, [], 2);
    Alternately, if b is a row vector, then you could use
    y2 = conv2(x, b);
    Apply a 1-D finite impulse response (FIR) filter with filter coefficients b down each column of an image x to produce a new image y1:
    
    y1 = filter(b, 1, x, [], 1);
    Alternately, if b is a column vector, then you could use
    y1 = conv2(x, b);
    You can convert a row vector into a column vector using the transpose operator that is a single quote:
    bcolvec= browvec';

%}