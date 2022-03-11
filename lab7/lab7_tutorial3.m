img = imread('moon.png');
img = rgb2gray(img);

img_double = im2double(img);

% Kernel
h = [1 1 1; 1 -8 1; 1 1 1];
img_filt = conv2(img_double, h, 'same');

% Median filter
img_sub = img_double - img_filt;

figure(1);

subplot(1, 3, 1);
imshow(img)
title('Original image');

subplot(1, 3, 2);
imshow(img_filt);
title('Smoothing filter');

subplot(1, 3, 3);
imshow(img_sub);
title('Subtraction');
