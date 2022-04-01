% Task 3: Calculating Dilation & Erosion (Matrix)
% Calculate the erosion and the dilation using structuring element (i) and (ii).

% Image matrix A
img_mat = [0 0 0 0 0 0 0 0;
    0 0 0 1 1 1 1 0;
    0 0 0 1 1 1 1 0;
    0 1 1 1 1 1 1 0;
    0 1 1 1 1 1 1 0;
    0 1 1 1 1 0 0 0;
    0 1 1 1 1 0 0 0;
    0 0 0 0 0 0 0 0];

% structuring element B1 and B2
B1 = [1 1 1;
    1 1 1;
    1 1 1];

B2 = [0 1 0;
    1 1 1;
    0 1 0];

% Matrix to image
img = mat2gray(img_mat);

% Dilation
img_dilation1 = imdilate(img, B1);
img_dilation2 = imdilate(img, B2);

% Erosions
img_erosion1 = imerode(img, B1);
img_erosion2 = imerode(img, B2);

% Plot
figure(1);
subplot(2, 3, 1);
imshow(img);
title('input image');

subplot(2, 3, 2);
imshow(img_dilation1);
title('dilated image with structuring element B1');

subplot(2, 3, 3);
imshow(img_erosion1);
title('eroded image with structuring element B1');

subplot(2, 3, 5);
imshow(img_dilation2);
title('dilated image with structuring element B2');

subplot(2, 3, 6);
imshow(img_erosion2);
title('eroded image with structuring element B2');
