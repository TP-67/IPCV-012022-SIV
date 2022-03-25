% Task 1.1: Display the Fourier Spectrum.

% Load image
img = imread('curves_flathouse.jpg');

% Convert image type to double for Fourier Transform
img = im2double(img);

% Fast Fourier Transform
ft_img=fft2(img);
% Shift zero-frequency component to center of spectrum
ft_shifted_img=abs(fftshift(ft_img));
% Inverse fast Fourier Transform
recon_img=ifft2(ft_img);
% Return real part of complex number
recon_img=real(recon_img);

subplot(131);
imshow(img);
title('Original');

subplot(132);
imagesc(0.5 * log10(1 + ft_shifted_img));
title('Fourier Spectrum');

subplot(133);
imshow(recon_img);
title('Reconstructed');
