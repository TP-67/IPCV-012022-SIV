% Load image
img = imread('cameraman.tif');
img = imresize(img, 0.5);

% Define Fourier transformer (convert input image datatype to double for computing sqrt)
ft_img = fft2(double(img));
ft_img = fftshift(ft_img);

% Set the order value and cut-off frequency
n = 2;
d0_10 = 10;
d0_20 = 20;
d0_30 = 30;

% Designing low-pass filter
[x, y] = meshgrid(-128: 127, -128: 127);
h_10 = 1 ./ (1 + (sqrt(x .^ 2 + y .^ 2) / d0_10) .^ (2 * n));
h_20 = 1 ./ (1 + (sqrt(x .^ 2 + y .^ 2) / d0_20) .^ (2 * n));
h_30 = 1 ./ (1 + (sqrt(x .^ 2 + y .^ 2) / d0_30) .^ (2 * n));

% Convolution between the Fourier transformed image and the mask
h_10 = h_10 .* ft_img;
h_20 = h_20 .* ft_img;
h_30 = h_30 .* ft_img;

%Inverse Fourier transform
h_out_10 = ifftshift(h_10);
h_out_20 = ifftshift(h_20);
h_out_30 = ifftshift(h_30);

g_10 = ifft2(h_out_10);
g_20 = ifft2(h_out_20);
g_30 = ifft2(h_out_30);

g_out_10 = uint8(real(g_10));
g_out_20 = uint8(real(g_20));
g_out_30 = uint8(real(g_30));

% Plot
figure(1);
subplot(4, 2, 1);
imshow(img);
title('Original image');

subplot(4, 2, 2);
imshow(log(1 + abs(ft_img)), []);
title('Fourier spectrum');

subplot(4, 2, 3);
imshow(log(1 + abs(h_10)), []);
title('Fourier Low-pass filter with D0=10');

subplot(4, 2, 4);
imshow(g_out_10);
title('Fourier Low-pass image with D0=10');

subplot(4, 2, 5);
imshow(log(1 + abs(h_20)), []);
title('Fourier Low-pass filter with D0=20');

subplot(4, 2, 6);
imshow(g_out_20);
title('Fourier Low-pass image with D0=20');

subplot(4, 2, 7);
imshow(log(1 + abs(h_30)), []);
title('Fourier Low-pass filter with D0=30');

subplot(4, 2, 8);
imshow(g_out_30);
title('Fourier Low-pass image with D0=30');
