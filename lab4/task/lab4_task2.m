% Load the image
img = imread('pout.tif');
% Initialize flip image
conv_img = img;

for i = (1: size(img, 1))
    for j = (1: size(img, 2))
        if img(i, j) > 120
            conv_img(i, j) = 255;
        else
            conv_img(i, j) = 0;
        end
    end
end

figure(1);
subplot(1, 2, 1);
imshow(img);
title('Original');
subplot(1, 2, 2);
imshow(conv_img);
title('Converted image');
