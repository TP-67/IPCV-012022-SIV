% Load image
img = imread('moon.png');
img = rgb2gray(img);

% Edge detection with different operators
img_edge_sobel = edge(img, 'sobel');
img_edge_canny = edge(img, 'canny');
img_edge_prewitt = edge(img, 'Prewitt');
img_edge_log = edge(img, 'log');

% Plog
figure(1);

subplot(2, 3, 1);
imshow(img);
title('Original Image');

subplot(2, 3, 2);
imshow(img_edge_sobel);
title('Sobel');

subplot(2, 3, 3);
imshow(img_edge_canny);
title('Canny');

subplot(2, 3, 4);
imshow(img_edge_prewitt);
title('Prewitt');

subplot(2, 3, 5);
imshow(img_edge_log);
title('Laplacian of Gauss');
