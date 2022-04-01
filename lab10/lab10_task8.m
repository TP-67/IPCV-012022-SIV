% Task 8: Multiple Thresholding Based Segmentation

% Load image
img = imread('lena.tif');
img = rgb2gray(img);

% Segment the input image into 3 regions
shape = size(img);
three_region = zeros(shape(1), shape(2));

for i = 1: shape(1)
    for j = 1: shape(2)
        if(img(i, j) < 100)
            three_region(i, j) = 0;
        elseif (img(i,j) > 200)
            three_region(i, j) = 255;
        else
            three_region(i, j) = 150;
        end
    end
end

% Plot
figure(1);
subplot(1, 2, 1);
imshow(img, []);
title('Original Image');

subplot(1, 2, 2);
imshow(three_region, []);
title('Thresholded Image');
