% Task 6: Finding Threshold Value by Observing Histograms

% Load image
img = imread('rice.jpg');

% Computes a global threshold from grayscale image using Otsu's method.
% Otsu's method chooses a threshold that minimizes the intraclass variance of the thresholded black and white pixels.
level = graythresh(img);

% Converts the grayscale image to binary image by replacing all pixels in the input image with luminance greater than level with the value 1 (white) and replacing all other pixels with the value 0 (black).
% A level value of 0.5 corresponds to an intensity value halfway between the minimum and maximum value of the class.
% Global threshold, returned as a nonnegative number in the range [0, 1].
BW = im2bw(img, level);

% Plot
figure(1);
subplot(1, 3, 1);
imshow(img);
title('Original image');

subplot(1, 3, 2);
imhist(img);
title('Histogram of original image');

subplot(1, 3, 3);
imshow(BW);
title('Binary image')
