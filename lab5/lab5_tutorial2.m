% Task: Image Negation

% Load image
img = imread('balloon.png');
img = rgb2gray(img);

% Double function rescale image values to (0, 1)
img_double = im2double(img);
[H, W] = size(img_double);
img_neg = zeros(H, W);

for i = 1:H
    for j = 1:W
        img_neg(i, j) = 1 - img_double(i, j);
    end
end

figure(1);
subplot(1, 2, 1);
imshow(img);
title('Original image');
subplot(1, 2, 2);
imshow(im2int16(img_neg));
title('Negative transformation');
