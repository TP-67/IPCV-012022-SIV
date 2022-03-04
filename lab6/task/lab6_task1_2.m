% Load image
img = imread('Cameraman.png');

% Create filters
H1 = [[-1, -1, -1], [-1, 9, -1], [-1, -1, -1]];
H2 = [[1, -2, 1], [-2, 5, -2], [1, -2, 1]];
H3 = [[0, -1, 0], [-1, 5, -1], [0, -1, 0]];

% Sharpening
img_sha1 = img + imfilter(img, H1);

img_sha2 = img + imfilter(img, H2);

img_sha3 = img + imfilter(img, H3);

figure(1);
subplot(2, 4, 1);
imshow(img);
title('Original image');

subplot(2, 4, 2);
imshow(img_sha1);
title('Sharpening (a)');

subplot(2, 4, 3);
imshow(img_sha2);
title('Sharpening (b)');

subplot(2, 4, 4);
imshow(img_sha3);
title('Sharpening (c)');

subplot(2, 4, 5);
imhist(img);
title('Original image histogram');

subplot(2, 4, 6);
imhist(img_sha1);
title('Sharpening (a) histogram');

subplot(2, 4, 7);
imhist(img_sha2);
title('Sharpening (b) histogram');

subplot(2, 4, 8);
imhist(img_sha3);
title('Sharpening (c) histogram');
