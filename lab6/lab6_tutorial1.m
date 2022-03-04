% Load image
img = imread('balloon.png');

% Add salt-pepper noisy
img_sape = imnoise(img, 'salt & pepper', 0.05);

% Add gaussian noisy
img_gau = imnoise(img, 'gaussian', 0.01);

% Add speckle noisy
img_spe = imnoise(img, 'speckle', 0.04);

figure(1);
subplot(2, 2, 1);
imshow(img);
title('Original image');

subplot(2, 2, 2);
imshow(img_sape);
title('Add salt-pepper noisy');

subplot(2, 2, 3);
imshow(img_gau);
title('Add gaussian noisy');

subplot(2, 2, 4);
imshow(img_spe);
title('Add speckle noisy');
