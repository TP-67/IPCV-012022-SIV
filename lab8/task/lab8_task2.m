% Load image
img = imread('cameraman.tif');

% Define Gaussian filter with different standard deviations
gau_filter_1 = fspecial('gaussian', 256, 1);
gau_filter_5 = fspecial('gaussian', 256, 5);
gau_filter_10 = fspecial('gaussian', 256, 10);

output_blur_1 = imfilter(img, gau_filter_1,'replicate');
output_blur_5 = imfilter(img, gau_filter_5,'replicate');
output_blur_10 = imfilter(img, gau_filter_10,'replicate');

% Plot
figure(1);
subplot(1, 5, 1);
imshow(img);
title('Original image');

subplot(1, 5, 3);
imshow(output_blur_1);
title('Gaussian filter with std=1');

subplot(1, 5, 4);
imshow(output_blur_5);
title('Gaussian filter with std=5');

subplot(1, 5, 5);
imshow(output_blur_10);
title('Gaussian filter with std=10');
