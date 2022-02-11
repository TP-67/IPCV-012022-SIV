img = imread('peppers.jpg');

img_resize1 = imresize(img, 0.5);
img_resize2 = imresize(img, 0.25);
img_resize3 = imresize(img, 0.1);


figure(1);
imshow(img);
figure(2);
imshow(img_resize1);
figure(3);
imshow(img_resize2);
figure(4);
imshow(img_resize3);
% title('Original image');
