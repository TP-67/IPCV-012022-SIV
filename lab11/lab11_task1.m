% Load image
img = imread('cell.jpg');
img = rgb2gray(img);

% Rescale image
img_res = imadjust(img, [], [0, 1]);

% Edge detection
img_edges = edge(img_res, 'sobel', (graythresh(img_res) * .1));

% Fill gaps
se_90 = strel('line', 3, 90);
se_0 = strel('line', 3, 0);

% Dilate operation
img_dil = imdilate(img_edges, [se_90, se_0]);

% Fill inner gap
img_fill = imfill(img_dil, 'holes');

% Remove connected objects on border
img_no_bord = imclearborder(img_fill, 4);

% Smooth object
se_smo = strel('diamond', 1);
img_final = imerode(img_no_bord, se_smo);
img_final = imerode(img_final, se_smo);

% Get outline
img_outline = bwperim(img_final);
img_outline = uint8(255 * img_outline);
img_seg = imadd(img, img_outline);

figure(1);

subplot(3, 3, 1);
imshow(img);
title('Original image');

subplot(3, 3, 2);
imshow(img_res);
title('Rescaled image');

subplot(3, 3, 3);
imshow(img_edges);
title('Edge detection');

subplot(3, 3, 4);
imshow(img_dil);
title('Dilated image');

subplot(3, 3, 5);
imshow(img_fill);
title('Binary image with filled holes');

subplot(3, 3, 6);
imshow(img_no_bord);
title('Clear border image');

subplot(3, 3, 7);
imshow(img_final);
title('Smooth object');

subplot(3, 3, 8);
imshow(img_seg);
title('Outline original image');