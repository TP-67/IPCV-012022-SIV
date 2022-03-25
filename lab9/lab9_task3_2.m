% Task 3:
% 1. Load the image data ?two_cats.jpg?.
% 2. Use a spatial filter to get the horizontal edge of the image.
% 3. Use a spatial filter to get the vertical edge of the image.
% 4. Add the horizontal edge matrix to the vertical edge matrix to yield the result.

% Load image
img = imread('two_cats.jpg');
img = rgb2gray(img);

% Define filter (emphasize horizontal)
h_prewitt = fspecial('prewitt');
h_sobel = fspecial('sobel');

% Define transposed fileter (emphasize vertical)
h_prewitt_trans = h_prewitt.';
h_sobel_trans = h_sobel.';

% Create filtered image
prewitt_filter_img_horizontal = imfilter(double(img), h_prewitt, 'replicate', 'conv');
prewitt_filter_img_vertical = imfilter(double(img), h_prewitt_trans, 'replicate', 'conv');
sobel_filter_img_horizontal = imfilter(double(img), h_sobel, 'replicate', 'conv');
sobel_filter_img_vertical = imfilter(double(img), h_sobel_trans, 'replicate', 'conv');

% Plot
figure(1);
% Show negative values
subplot(4, 2, 1);
imshow(prewitt_filter_img_horizontal, []);
title('Horizontal edge detection with Prewitt operator');

% Use absolute function to get rid of negatives
subplot(4, 2, 2);
imshow(abs(prewitt_filter_img_horizontal), []);
title('Positive horizontal edge detection with Prewitt operator');

% Show negative values
subplot(4, 2, 3);
imshow(prewitt_filter_img_vertical, []);
title('Vertical edge detection with Prewitt operator');

% Use absolute function to get rid of negatives
subplot(4, 2, 4);
imshow(abs(prewitt_filter_img_vertical), []);
title('Positive vertical edge detection with Prewitt operator');

% Show negative values
subplot(4, 2, 5);
imshow(sobel_filter_img_horizontal, []);
title('Horizontal edge detection with Sobel operator');

% Use absolute function to get rid of negatives
subplot(4, 2, 6);
imshow(abs(sobel_filter_img_horizontal), []);
title('Positive horizontal edge detection with Sobel operator');

% Show negative values
subplot(4, 2, 7);
imshow(sobel_filter_img_vertical, []);
title('Vertical edge detection with Sobel operator');

% Use absolute function to get rid of negatives
subplot(4, 2, 8);
imshow(abs(sobel_filter_img_vertical), []);
title('Positive vertical edge detection with Sobel operator');
