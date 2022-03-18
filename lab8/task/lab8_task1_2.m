% Load image
img = imread('cameraman.tif');
img = imresize(img, 0.5);

% Define Fourier transformer (convert input image datatype to double for computing sqrt)
ft_img = fft2(double(img));
ft_img = fftshift(ft_img);

% Set the order value and cut-off frequency
n_n5 = 0.5;
n_2 = 2;
n_5 = 5;
d0 = 20;

% Designing low-pass filter
[x, y] = meshgrid(-128: 127, -128: 127);
h_n5 = 1 ./ (1 + (sqrt(x .^ 2 + y .^ 2) / d0) .^ (2 * n_n5));
h_2 = 1 ./ (1 + (sqrt(x .^ 2 + y .^ 2) / d0) .^ (2 * n_2));
h_5 = 1 ./ (1 + (sqrt(x .^ 2 + y .^ 2) / d0) .^ (2 * n_5));

% Convolution between the Fourier transformed image and the mask
h_n5 = h_n5 .* ft_img;
h_2 = h_2 .* ft_img;
h_5 = h_5 .* ft_img;

%Inverse Fourier transform
h_out_n5 = ifftshift(h_n5);
h_out_2 = ifftshift(h_2);
h_out_5 = ifftshift(h_5);

g_n5 = ifft2(h_out_n5);
g_2 = ifft2(h_out_2);
g_5 = ifft2(h_out_5);

g_out_n5 = uint8(real(g_n5));
g_out_2 = uint8(real(g_2));
g_out_5 = uint8(real(g_5));

% Plot
figure(1);
subplot(4, 2, 1);
imshow(img);
title('Original image');

subplot(4, 2, 2);
imshow(log(1 + abs(ft_img)), []);
title('Fourier spectrum');

subplot(4, 2, 3);
imshow(log(1 + abs(h_n5)), []);
title('Fourier Low-pass filter with n=.5');

subplot(4, 2, 4);
imshow(g_out_n5);
title('Fourier Low-pass image with n=.5');

subplot(4, 2, 5);
imshow(log(1 + abs(h_2)), []);
title('Fourier Low-pass filter with n=2');

subplot(4, 2, 6);
imshow(g_out_2);
title('Fourier Low-pass image with n=2');

subplot(4, 2, 7);
imshow(log(1 + abs(h_5)), []);
title('Fourier Low-pass filter with n=5');

subplot(4, 2, 8);
imshow(g_out_5);
title('Fourier Low-pass image with n=5');
