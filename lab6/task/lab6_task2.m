% Input image
img = [[150, 170, 190, 190, 10, 11, 12, 10],
       [180, 250, 170, 180, 11, 13, 12, 11],
       [175, 160, 170, 175, 13, 12, 11, 12],
       [175, 185, 185, 170, 13, 11, 10, 12],
       [100, 60, 100, 60, 100, 60, 100, 60],
       [60, 100, 60, 100, 60, 100, 60, 100],
       [100, 60, 100, 60, 100, 60, 100, 60],
       [60, 100, 60, 100, 60, 100, 60, 100]];

% Convert matrix to gray-scale image with pixel values ranging from 0 to 1.
img = mat2gray(img);
% Convert image to uint8
img = im2uint8(img);

%Create filters
H1 = ones(3, 3) / 9;
H2 = [[0, 1, 0], [1, -4, 1], [0, 1, 0]];

% Smoothing
img_smo = imfilter(img, H1);

% Sharpening
img_shar = imfilter(img, H1) + img;

figure(1);
subplot(1, 3, 1);
imshow(img);
title('Original image');

subplot(1, 3, 2);
imshow(img_smo);
title('Smoothing');

subplot(1, 3, 3);
imshow(img_shar);
title('Sharpening');
