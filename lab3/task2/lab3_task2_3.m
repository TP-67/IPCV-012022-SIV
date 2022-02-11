% Task: Image resizing

% Load image
img = imread('peppers.jpg');

% Image resize
img_resize1 = imresize(img, 0.5);
img_resize2 = imresize(img, 0.25);
img_resize3 = imresize(img, 0.1);

% Create figure for different sets of images.
figure(1);
imshow(img);
title('Original image');

% Create figure for different sets of images.
figure(2);
imshow(img_resize1);
title('Resizing rate 0.5');

% Create figure for different sets of images.
figure(3);
imshow(img_resize2);
title('Resizing rate 0.25');

% Create figure for different sets of images.
figure(4);
imshow(img_resize3);
title('Resizing rate 0.1');
