% Load image
img = imread('balloon.png');

% Add 10% salt-pepper noisy
img_sape = imnoise(img, 'salt & pepper', 0.1);

% Removing noise with median filter
% Apply medfilt2 on each color
img_filtered = img_sape;
for c = 1 : 3
    img_filtered(:, :, c) = medfilt2(img_sape(:, :, c), [3, 3]);
end

figure(1);
subplot(2, 3, 1);
imshow(img);
title('Original image');

subplot(2, 3, 2);
imshow(img_sape);
title('Add 10% salt-pepper noise');

subplot(2, 3, 3);
imshow(img_filtered);
title('Median filter');

subplot(2, 3, 4);
imhist(img);
title('Original image histogram');

subplot(2, 3, 5);
imhist(img_sape);
title('Noisy image histogram');

subplot(2, 3, 6);
imhist(img_filtered);
title('Histogram with median filter');
