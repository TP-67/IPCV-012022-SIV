% Power-law Transformation (Gamma Correction)
% S = CR^\gamma

% Load the image
img = imread('pout.tif');

% Set gamma value
gamma1 = .2;
gamma2 = 5;

constant = 1;

if gamma1 <= 0 || gamma2 <= 0
    error('Gamma value must be greater than 0.');
end

% Convert data to double datatype
if isa(img, 'uint8')
    img_trans = double(img);
else
    img_trans = img;
end

% Normalization (rescale in range 0-1)
img_norm = img_trans - min(min(img_trans));
img_norm = img_norm ./ max(max(img_norm));

% Apply gamma function
% Gamma value must be greater than 0
% 0 < Gamma < 1, it will enhance the contrast in bright regions
% If gamma is less than 1, the mapping is weighted toward higher (brighter) output values
% Gamma > 1, it will enhance the contrast in dark regions
% If gamma is greater than 1, the mapping is weighted toward lower (darker) output values.
img_gamma1 = constant * img_norm .^ gamma1;
img_gamma2 = constant * img_norm .^ gamma2;

% Plot images
figure(1);
subplot(1, 3, 1);
imshow(img);
title('Original');
subplot(1, 3, 2);
imshow(img_gamma1);
title('Gamma < 1');
subplot(1, 3, 3);
imshow(img_gamma2);
title('Gamma > 1');
