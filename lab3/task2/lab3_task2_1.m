% Task: Image compression

% Load image
% (384, 512, 3)
img_png = imread('peppers.png');

% Convert the image format from png to jpg.
imwrite(img_png,'peppers.jpg');
img = imread('peppers.jpg');

% Image compression
% 0: lower quality & higher compression
% 100: higher quality & lower compression
imwrite(img, 'pep75.jpg');
imwrite(img, 'pep05.jpg', 'quality', 5);
imwrite(img, 'pep95.jpg', 'quality', 95);

% Create figure for different sets of images.
figure(1);

subplot(221);
imshow(img);
title('Original image')

img_05=imread('pep05.jpg');
subplot(222);
imshow(img_05);
title('Compression rate 5%');

img_95=imread('pep95.jpg');
subplot(223);
imshow(img_95);
title('Compression rate 95%');

% Create figure for different sets of images.
figure(2);

subplot(221);
imhist(img);
title('Original image')
subplot(222);
imhist(img_05);
title('Compression rate 5%');
subplot(223);
imhist(img_95);
title('Compression rate 95%');
