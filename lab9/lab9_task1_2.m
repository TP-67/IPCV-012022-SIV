% Task 1.2: Low-pass Gaussian filter.

% Load image
img = imread('curves_flathouse.jpg');

% Convert image type to double for Fourier Transform
img = im2double(img);

% Fast Fourier Transform
ft_img=fft2(img);
% Define Gaussian filter
low_pass_gau_filter = fspecial('gaussian', [11 11], 1.3);
% Convert Gaussian filter to temporal frequency
ft_low_pass_gau_filter = fft2(low_pass_gau_filter, size(img, 1), size(img, 2));
% Shift zero-frequency component to center of spectrum
ft_shifted_low_pass_gau_filter = abs(fftshift(ft_low_pass_gau_filter));
% Apply Guassian low-pass filter
low_pass_output = ft_low_pass_gau_filter .* ft_img;
% Inverse fast Fourier Transform
low_pass_output_img = abs(ifft2(low_pass_output));

subplot(221);
imshow(img);
title('Original')

subplot(222);
imagesc(0.5 * log10(1 + ft_shifted_low_pass_gau_filter));
colormap(gray);
title('Low-pass Filter');

subplot(223);
imagesc(0.5 * log10(1 + abs(fftshift(low_pass_output))));
colormap(gray);
title('Low-pass Spectrum');

subplot(224);
imshow(low_pass_output_img);
title('Low-pass Output')
