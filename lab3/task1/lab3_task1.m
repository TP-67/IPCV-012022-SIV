% Task: Perform algebraic operations such as addition, subtraction,
% multiplication, and division.

% Load image
img = imread('Cameraman.png');

% Operations
img_add = imadd(img, 50);
img_sub = imsubtract(img, 50);
img_mul = immultiply(img, 0.5);
img_div = imdivide(img, 2);

% Create figure for different sets of images.
figure(1);

subplot(121);
imshow(img);
title('Original image');
subplot(122);
imshow(img_add);
title('Addition');

% Create figure for different sets of images.
figure(2);

subplot(121);
imshow(img);
title('Original image');
subplot(122);
imshow(img_sub);
title('Subtraction');

% Create figure for different sets of images.
figure(3);

subplot(121);
imshow(img);
title('Original image');
subplot(122);
imshow(img_mul);
title('Multiplication');

% Create figure for different sets of images.
figure(4);

subplot(121);
imshow(img);
title('Original image');
subplot(122);
imshow(img_div);
title('Division');

% We can add one image with another.
img1 = imread('Cameraman.png');
img2 = imread('rice.jpg');

% Transform the RGB image into gray-scale image.
t = rgb2gray(img2);
% Resize the second image for addition.
s = imresize(t, [399, 421]);

% Create figure for different sets of images.
figure(5);

img_add = imadd(img1, s);
subplot(1,2,1);
imshow(img1);
subplot(1,2,2);
imshow(img_add);
