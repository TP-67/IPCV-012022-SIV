% Load image
img = imread('balloon.png');

% Add 10% salt-pepper noisy
img_sape = imnoise(img, 'salt & pepper', 0.1);

% Removing noise with min-max filter
% Apply ordfilt2 on each color
img_filtered_min = img_sape;
img_filtered_med = img_sape;
img_filtered_max = img_sape;

for c = 1 : 3
    img_filtered_min(:, :, c) = ordfilt2(img_sape(:, :, c), 1, ones(3,3));
    img_filtered_med(:, :, c) = ordfilt2(img_sape(:, :, c), 5, ones(3,3));
    img_filtered_max(:, :, c) = ordfilt2(img_sape(:, :, c), 9, ones(3,3));
end

figure(1);
subplot(2, 3, 1);
imshow(img);
title('Original image');

subplot(2, 3, 2);
imshow(img_sape);
title('Add 10% salt-pepper noise');

subplot(2, 3, 3);
imshow(img_filtered_min);
title('Minimum filter');

subplot(2, 3, 4);
imshow(img_filtered_med);
title('Mediam filter');

subplot(2, 3, 5);
imshow(img_filtered_max);
title('Maximum filter');
