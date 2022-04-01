% Task 2: Opening and Closing

% Load image
img = imread('coins.png');
se = strel('square', 20);

% Opening and closing
fo = imopen(img, se);
fc = imclose(img, se);

% Plot
figure(1);
subplot(1, 3, 1);
imshow(img)
title('input image');

subplot(1, 3, 2);
imshow(fo)
title('opening of input image');

subplot(1, 3, 3);
imshow(fc);
title('closing of opened input image');
