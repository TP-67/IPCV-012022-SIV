% Load image
img = im2double(imread('bonescan.png'));
img = rgb2gray(img);

% Define kernels
lap = [-1 -1 -1; -1 8 -1; -1 -1 -1];
soba = [-1 -2 -1; 0 0 0; 1 2 1];
sobb = [-1 0 1; -2 0 2; -1 0 1];

h = ones(5, 5) / 25;

% Kernel
img_kernel_1 = conv2(img, lap, 'same');

% Median filter
img_add_1 = img + img_kernel_1;

img_kernel_2 = abs(conv2(img, soba, 'same')) + abs(conv2(img, sobb, 'same'));

img_kernel_4 = conv2(img_kernel_2, h, 'same');

img_prod = img_add_1 .* img_kernel_4;

img_add_2 = img + img_prod;

img_pow = img_add_2 .^ .5;

img_kernel_1 = [img_kernel_1 - min(img_kernel_1(:))] ./ max(img_kernel_1(:) - min(img_kernel_1(:)));

figure(1);

subplot(2, 4, 1);
imshow(img)
title('Original image');

subplot(2, 4, 2);
imshow(img_kernel_1);
title('Smoothing filter');

subplot(2, 4, 3);
imshow(img_add_1);
title('Median filter');

subplot(2, 4, 4);
imshow(img_kernel_2);
title('Abs');

subplot(2, 4, 5);
imshow(img_kernel_4);
title('Smoothing filter');

subplot(2, 4, 6);
imshow(img_prod);
title('Prod');

subplot(2, 4, 7);
imshow(img_add_2);
title('Add');

subplot(2, 4, 8);
imshow(img_pow);
title('Pow');
