f = zeros(30, 30);
f(5: 24, 13: 17) = 1;

figure(1)
subplot(1, 4, 1)
imshow(f, 'InitialMagnification', 'fit');

F = fft2(f);
F2 = abs(F);
subplot(1, 4, 2)
imshow(F2, [], 'InitialMagnification', 'fit');

F2 = fftshift(F);
F2 = abs(F2);
subplot(1, 4, 3)
imshow(F2, [])

F2 = log(1 + F2);
subplot(1, 4, 4)
imshow(F2, [])
