% Load the image
img = imread('pout.tif');
% Initialize flip image
flip_img = img;

for i = (1: size(img, 1))
    for j = (1: size(img, 2))
    flip_img(i, j) = img((size(img, 1) - i + 1), j);
    end
end

figure(1);
subplot(1, 2, 1);
imshow(img);
title('Original');
subplot(1, 2, 2);
imshow(flip_img);
title('Flipped image');
