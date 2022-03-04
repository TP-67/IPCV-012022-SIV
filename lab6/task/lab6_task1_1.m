% Load image
img = imread('Cameraman.png');

% Create filters
H1 = ones(3, 3);
H1 = H1 / 9;

H2 = [[1, 1, 1], [1, 2, 1], [1, 1, 1]];
H2 = H2 / 10;

H3 = [[1, 2, 1], [2, 4, 2], [1, 2, 1]];
H3 = H3 / 9;

% Smoothing
img_smo1 = imfilter(img, H1);
img_smo2 = imfilter(img, H2);
img_smo3 = imfilter(img, H3);

figure(1);
subplot(2, 4, 1);
imshow(img);
title('Original image');

subplot(2, 4, 2);
imshow(img_smo1);
title('Smoothing (a)');

subplot(2, 4, 3);
imshow(img_smo2);
title('Smoothing (b)');

subplot(2, 4, 4);
imshow(img_smo3);
title('Smoothing (c)');

subplot(2, 4, 5);
imhist(img);
title('Original image histogram');

subplot(2, 4, 6);
imhist(img_smo1);
title('Smoothing (a) histogram');

subplot(2, 4, 7);
imhist(img_smo2);
title('Smoothing (b) histogram');

subplot(2, 4, 8);
imhist(img_smo3);
title('Smoothing (c) histogram');
