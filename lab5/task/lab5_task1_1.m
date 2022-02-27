% Exersise 1(1)

% Load image
img = imread("cameraman.tif");
[H, W] = size(img);

% Initialize two arrays
x = [0: 255];
y = zeros(1, 256);

% Calculate the value distribution
for i = 1: H
    for j = 1: W
        y(img(i, j) + 1) = y(img(i, j) + 1) + 1;
    end
end

% Plot
figure(1)
subplot(1, 3, 1)
plot(x, y)
title("Histogram with Plot Func")

subplot(1, 3, 2)
bar(x, y)
title("Histogram with Bar Func")

subplot(1, 3, 3)
imhist(img)
title("Histogram with Build-in Func")
