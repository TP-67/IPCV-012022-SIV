img = imread('lena512.bmp');

f = fspecial('laplacian');
cf = filter2(f, img);

cf_max = max(cf(:));
cf_min = min(cf(:));
disp(cf_min)
disp(cf_max);

cf_gray = mat2gray(cf);
cf_gray_scaled = cf / 60;

disp(min(cf_gray_scaled(:)));
disp(max(cf_gray_scaled(:)));

figure(1)

subplot(1, 2, 1);
imshow(cf_gray);
title('Mat2Gray');

subplot(1, 2, 2);
imshow(cf_gray_scaled);
title('Mat2Gray Scaled');
