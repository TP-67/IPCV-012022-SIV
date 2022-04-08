% Load image
img = imread('moon.png');
img = rgb2gray(img);

% Boundary extraction
s = strel('disk', 2, 0);
img_boundary = imerode(img, s);

figure(1);

subplot(1, 3, 1);
imshow(img);
title('Original Image');

subplot(1, 3, 2);
imshow(img_boundary);
title('Erodision image');

subplot(1, 3, 3);
imshow(img - img_boundary);
title('Boundary extracted image');
