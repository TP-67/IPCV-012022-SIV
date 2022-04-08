% Load image
img = imread('beach.tif');

% RGB channels
img_red = img(:, :, 1);
img_green = img(:, :, 2);
img_blue = img(:, :, 3);

% RGB 2 HSV
[img_h, img_s, img_i] = rgb2hsv(img_red, img_green, img_blue);
img_sh = ((img_h > 0.49) + (img_h < 0.08)) > 0;
img_sh = double(bwmorph(img_sh, 'dilate', 3));
img_sh = double(bwmorph(img_sh, 'erode', 3));

figure(1);

subplot(1, 2, 1);
imshow(img);
title('Original image');

subplot(1, 2, 2);
imshow(img_sh);
title('Color image segmentation');
