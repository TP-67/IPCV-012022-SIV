% Task 1.3: High-pass Laplacian filter.

% Load image
img = imread('curves_flathouse.jpg');

% Convert image type to double for Fourier Transform
img = im2double(img);

% Fast Fourier Transform
ft_img=fft2(img);
% Define Laplacian filter
high_pass_lap_filter = fspecial('laplacian');
% Convert Laplacian filter to temporal frequency
ft_high_pass_lap_filter=fft2(high_pass_lap_filter, size(img, 1),size(img, 2));
% Shift zero-frequency component to center of spectrum
ft_shifted_high_pass_lap_filter = abs(fftshift(ft_high_pass_lap_filter));
% Apply Laplacian high-pass filter
high_pass_output = ft_high_pass_lap_filter .* ft_img;
% Inverse fast Fourier Transform
high_pass_output_img = abs(ifft2(high_pass_output));

subplot(221);
imshow(img);
title('Original');

subplot(222);
imagesc(0.5 * log10(1 + ft_shifted_high_pass_lap_filter));
colormap(gray);
title('High-pass Filter');

subplot(223);
imagesc(0.5 * log10(1 + abs(fftshift(high_pass_output))));
colormap(gray);
title('High-pass Spectrum');

subplot(224);
imshow(high_pass_output_img);
title('High-pass Output');
