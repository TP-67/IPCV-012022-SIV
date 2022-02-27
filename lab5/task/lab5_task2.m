% Exersise 2

% Load image
img = imread("cameraman.tif");
[H, W] = size(img);

img_binary = zeros(H, W);

for i = 1:H
    for j = 1:W
        if img(i, j) > 150
            img_binary(i, j) = 255;
        else
            img_binary(i, j) = 0;
        end
    end
end

figure(1);
subplot(1, 2, 1);
imshow(img);
title('Original image');
subplot(1, 2, 2);
imshow(img_binary);
title('Binary image');
