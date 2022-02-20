img = imread('Penguins_grey.jpg');

% Image Resize: Imresize function can be used to change the image resolution

% Half the image size
img_resize1 = imresize(img, 1/2);
% Repeat all the pixels to produce the image of the same size as original, but with
% half the resolution
img_resize2 = imresize(img_resize1, 2);

img_resize3 = imresize(img, 1/8);

img_resize4 = imresize(img_resize3, 8);

figure(1);
subplot(1, 3, 1);
imshow(img);
title('Original');
subplot(1, 3, 2);
imshow(img_resize2);
title('Same size & half resolution');
subplot(1, 3, 3);
imshow(img_resize4);
title('Same size & eighth resolution');

% Gray-scalt 2 Index image: Grayslice function is a mapping process which groups the data pixels within a range of gray values
img2 = grayslice(img, 64);
img3 = grayslice(img, 32);
figure(2);
subplot(1,3,1);
imshow(img);
title('Original');
subplot(1,3,2);
imshow(img2);
title('Scale-64');
subplot(1,3,3);
imshow(img3);
title('Scale-32');

% Brightness enhancement
img4 = imadd(img, 50);

% Brightness supression
img5 = imsubtract(img, 70);

figure(3);
subplot(1,3,1);
imshow(img);
title('Original');
subplot(1,3,2);
% Remember to convert the output image values to unint8 before ploting
imshow(uint8(img4));
title('Brightness enhancement');
subplot(1,3,3);
imshow(uint8(img5));
title('Brightness supression');

% Load image
img = imread('balloon.png');
img = rgb2gray(img);
img1 = immultiply(img, 0.5);
img2 = immultiply(img, 2);

figure(4);
subplot(1, 3, 1);
imshow(img);
title('Original');
subplot(1, 3, 2);
imshow(img1);
title('Image contrast rate 0.5');
subplot(1, 3, 3);
imshow(img2);
title('Image contrast rate 2');

% Check the effects in the histogram of those contrast manipulated images
figure(5);
subplot(1, 3, 1);
imhist(img);
title('Original');
subplot(1, 3, 2);
imhist(img1);
title('Image contrast rate 0.5');
subplot(1, 3, 3);
imhist(img2);
title('Image contrast rate 2');

% Reading the image and converting it to gray levels.
% A 256 gray-level image
[img_256, map_256] = gray2ind(img, 256);
figure(6);
subplot(3, 2, 1);
imshow(img);
title('Original');
subplot(3, 2, 2);
imshow(img_256);
title('Gray level-256');

% A 128 gray-level image
[img_128, map_128] = gray2ind(img, 128);
subplot(3, 2, 3);
imshow(img_128);
title('Gray level-128');

% A 64 gray-level image
[img_64, map_64] = gray2ind(img, 64);
subplot(3, 2, 4);
imshow(img_64);
title('Gray level-64');

% A 32 gray-level image
[img_32, map_32] = gray2ind(img, 32);
subplot(3, 2, 5);
imshow(img_32);
title('Gray level-32');
