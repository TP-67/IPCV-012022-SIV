% Task: Histogram Enhanced

% Load image
img = imread('lena.tif');
img_gray = rgb2gray(img);
% img_hist = imhist(img_gray);
img_histeq = histeq(img_gray);

figure(1);
subplot(3, 2, 1);
imshow(img);
title('Original Image');

subplot(3, 2, 2);
imhist(img);
title('Original Histogram');

subplot(3, 2, 3);
imshow(img_gray);
title('Gray scale Image');

subplot(3, 2, 4);
imhist(img_gray);
title('Gray scale Histogram');

subplot(3, 2, 5);
imshow(img_histeq);
title('Histogram enhanced Image');

subplot(3, 2, 6);
imhist(img_histeq);
title('Histogram enhanced Histogram');
