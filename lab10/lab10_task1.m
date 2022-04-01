% Task 1: morphological operations: Erosions& Dilation

% Load image
img = imread('rice.jpg');

% Dilation
B = [0 1 1; 1 1 1; 0 1 0];
img_dilation = imdilate(img, B);

% Erosions
se = strel('disk', 10);
img_erosion = imerode(img, se);

% Plot
figure(1);
subplot(1, 3, 1);
imshow(img);
title('input image');

subplot(1, 3, 2);
imshow(img_dilation);
title('dilated image');

subplot(1, 3, 3);
imshow(img_erosion);
title('eroded image');
