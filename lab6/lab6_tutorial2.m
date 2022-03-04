% Load image
img = imread('balloon.png');

% Add 5% salt-pepper noisy
img_sape_5 = imnoise(img, 'salt & pepper', 0.05);

% Add 10% salt-pepper noisy
img_sape_10 = imnoise(img, 'salt & pepper', 0.1);

% Add 30% salt-pepper noisy
img_sape_30 = imnoise(img, 'salt & pepper', 0.3);

figure(1);
subplot(2, 2, 1);
imshow(img);
title('Original image');

subplot(2, 2, 2);
imshow(img_sape_5);
title('Add 5% salt-pepper noise');

subplot(2, 2, 3);
imshow(img_sape_10);
title('Add 10% salt-pepper noise');

subplot(2, 2, 4);
imshow(img_sape_30);
title('Add 30% salt-pepper noise');
