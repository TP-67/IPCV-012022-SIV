% Task 3: Edge detection with Prewitt and Sobel operators.

img = imread('Penguins_grey.jpg');
img = rgb2gray(img);

% Prewitt edge detection
prewitt_edge_detection = edge(img, 'Prewitt');

% Add Gaussian noise
img_noise = imnoise(img,'gaussian');

% Prewitt edge detection on noisy image
prewitt_edge_detection_noise = edge(img_noise, 'Prewitt');

% Plot
figure(1);
subplot(1, 3, 1);
imshow(prewitt_edge_detection);
title('Prewitt edge detection')

subplot(1, 3, 2);
imshow(img_noise);
title('Noisy image')

subplot(1, 3, 3);
imshow(Prewitt_B_noise);
title('Prewitt edge detection on noisy image')
