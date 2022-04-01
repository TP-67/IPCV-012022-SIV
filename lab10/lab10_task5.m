% Task 5: Segment an image matrix

% Image matrix A
img_mat = [199 230 240 251 234;
    192 209 160 184 207;
    185 170 120 146 39;
    130 101 63 52 28;
    117 89 44 19 3];

% Matrix to image
img = uint8(255 * mat2gray(img_mat));

% Segment the input image into 3 regions
shape = size(img);
three_region = zeros(shape(1), shape(2));

for i = 1: shape(1)
    for j = 1: shape(2)
        if(img(i, j) < 55)
            three_region(i, j) = 0;
        elseif (img(i,j) > 190)
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
