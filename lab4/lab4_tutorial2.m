img = imread('mandril_color.tif');

% Create figure for different sets of images
figure(1);

subplot(221);
imshow(img);
title('Original image');

subplot(222);
img1 = imresize(img, [256, 256]);
imshow(img1);
title('Resize');

subplot(223);
img2 = rgb2gray(img);
imshow(img2);
title('Gray-scale image');

subplot(224);
img3 = im2bw(img);
imshow(img3);
title('Binary image');