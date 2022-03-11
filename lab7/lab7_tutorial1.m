% Load image
img = imread('cat.png');

% Motion blur
h = fspecial('motion', 20, 45);
img_motion = imfilter(img, h);

% Sharpening
h = fspecial('unsharp');
img_sharp = imfilter(img, h);

% Horizontal edge-detection
h = fspecial('sobel');
img_sobel = imfilter(img, h);

figure(1);

subplot(2, 2, 1);
imshow(img)
title('Original image');

subplot(2, 2, 2);
imshow(img_motion);
title('Motion blur');

subplot(2, 2, 3);
imshow(img_sharp);
title('Sharpening');

subplot(2, 2, 4);
imshow(img_sobel);
title('Edge detector');
