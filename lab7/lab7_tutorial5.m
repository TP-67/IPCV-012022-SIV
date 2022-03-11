% various edge detection operators
Im = imread('lena512.bmp');

h1 =[0 1 1; -1 0 1;-1 -1 0];
h2 =[-1 -1 0; -1 0 1;0 1 1];
h3=[0 1 2; -1 0 1;-2 -1 0];
h4=[-2 -1 0; -1 0 1;0 1 2];
h5=[0 -1 0; -1 4 -1;0 -1 0];
h6=[-1 -1 -1; -1 8 -1;-1 -1 -1];
h7=[0 0 -1 0 0;0 -1 -2 -1 0;-1 -2 16 -2 -1; 0 -1 -2 -1 0;0 0 -1 0 0];

I1 = imfilter(Im,h1);
I2 = imfilter(Im,h2);
I3 = imfilter(Im,h3);
I4 = imfilter(Im,h4);
I5 = imfilter(Im,h5);
I6 = imfilter(Im,h6);
I7 = imfilter(Im,h7);

subplot(2,4,1);imshow(Im); title('Original image');
subplot(2,4,2);imshow(I1);title('Prewitt Mask - Diagonal');
subplot(2,4,3);imshow(I2);title('Prewitt Mask - Diagonal');
subplot(2,4,4);imshow(I3);title('Sobel Mask - Diagonal');
subplot(2,4,5);imshow(I4);title('Sobel Mask - Diagonal');
subplot(2,4,6);imshow(I5);title('Laplacian Mask');
subplot(2,4,7);imshow(I6);title('Laplacian Mask');
subplot(2,4,8);imshow(I7);title('Laplacian of Gaussian Mask');
