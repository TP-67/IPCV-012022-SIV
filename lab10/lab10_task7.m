% Task 7: Single Thresholding based Segmentation

% Load image
img = imread('cameraman.tif');

% Segment the input image into 2 regions
shape = size(img);
two_region = zeros(shape(1), shape(2));

for i = 1: shape(1)
    for j = 1: shape(2)
        if(img(i, j) > 100)
            two_region(i, j) = 0;
        else
            two_region(i, j) = 255;
        end
    end
end

% Plot
figure(1);
subplot(1, 2, 1);
imshow(img, []);
title('Original Image');

subplot(1, 2, 2);
imshow(two_region, []);
title('Thresholded Image');
