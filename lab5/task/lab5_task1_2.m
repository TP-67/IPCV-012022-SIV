% Exersise 1(2)
% Reference:
% https://www.imageeprocessing.com/2011/04/matlab-code-histogram-equalization.html

% Load image
img = imread("cameraman.tif");
[H, W] = size(img);

% 1. Frequency: number of occurrence of each pixel value
frequency = zeros(1, 256);
% 2. Probability: probability of each frequency = Frequency_i / number of
% pixels
probability = zeros(1, 256);
for i = 1: H
    for j = 1: W
        frequency(img(i, j) + 1) = frequency(img(i, j) + 1) + 1;
        probability(img(i, j) + 1) = frequency(img(i, j) + 1) / (H * W);
    end
end

% 3. Cumulative histogram of each pixel: sum of previous pixels and itself
cumulative_hist = zeros(1, 256);
% 4. Cumulative distribution probability of each pixel = Cumulative
% histogram_i / number of pixels
cumulative_dist_probability = zeros(1, 256);
% 5. Final output: round(CDP * number of bins(255))
output = zeros(1, 256);
for i = 1: 256
    temp = 0;
    for j = 1: i
        temp = temp + frequency(j);
    end
    cumulative_hist(i) = temp;
    cumulative_dist_probability(i) = cumulative_hist(i) / (H * W);
    output(i) = round(cumulative_dist_probability(i) * 255);
end

% 6. Replace the original pixel values with the corresponding values in the
% output array.
img_histeq = uint8(zeros(H, W));
for i = 1:H
    for j = 1:W
        img_histeq(i, j) = output(img(i, j) + 1);
    end
end

% Matlab build-in function
img_histeq_matlab = histeq(img);

% Plot
figure(1);
subplot(1, 3, 1);
imshow(img);
title('Original image');
subplot(1, 3, 2);
imshow(img_histeq);
title('Hist-enhanced (hand-code)');
subplot(1, 3, 3);
imshow(img_histeq_matlab);
title('Hist-enhanced (build-in)');
