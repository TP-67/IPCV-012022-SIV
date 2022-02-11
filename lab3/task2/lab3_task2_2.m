% Task: Contrast stretching

% Load image
img = imread('Rachmaninoff.jpg');

% Create figure for different sets of images.
figure(1);
img_adj_sharp = imadjust(img, [0.2, 0.8], []);
subplot(121);
imshow(img);
title('Original image');
subplot(122);
imshow(img_adj_sharp);
title('Sharpen image');

% Create figure for different sets of images.
figure(2);
subplot(121);
imhist(img);
title('Original image');
subplot(122);
imhist(img_adj_sharp);
title('Sharpen image');

% Create figure for different sets of images.
% figure(2);
% img_adj_smooth = imadjust(img, [0.0, 1.0], []);
% subplot(121);
% imshow(img);
% subplot(122);
% imshow(img_adj_smooth);

% Create figure for different sets of images.
% figure(6);
% imhist(img_adj_smooth);
