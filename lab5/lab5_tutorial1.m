% Task: Gamma Correction
% \hat{x} = C \times x ^{\gamma}

% Task: Log Transformation
% \hat{x} = C \times log10(1 + x)

% Load image
img = imread('lena.tif');

% Convert RGB image to gray scale image
img_gray = rgb2gray(img);

% Compute constant c manually
% c=255/(log10(1+double(max(max(img_gray)))))
% Normal c would be 0.5. But we need to convert image scale back to (0, 255)
c = 106;
[H, W] = size(img_gray);

img_log = zeros(H, W);

for x = 1: H
    for y = 1: W
        % Double function rescale image values to (0, 1)
        t = double(img_gray(x, y));
        img_log(x, y) = c * log10(1 + t);
    end
end

% Plot
figure(1);
subplot(1, 2, 1);
imshow(img_gray);
title('Original image');
subplot(1, 2, 2);
imshow(uint8(img_log));
title('Log transformation');
