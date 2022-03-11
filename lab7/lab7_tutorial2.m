% Load image
img = imread('circuit_board.png');
img = rgb2gray(img);

img_double = im2double(img);

% Kernel
h = ones(3, 3) / (3 ^ 2);
img_double = conv2(img_double, h, 'same');

% Median filter
img_med = medfilt2(img_double, [3 3]);

figure(1);

subplot(1, 3, 1);
imshow(img)
title('Original image');

subplot(1, 3, 2);
imshow(img_double);
title('Smoothing filter');

subplot(1, 3, 3);
imshow(img_med);
title('Median filter');
