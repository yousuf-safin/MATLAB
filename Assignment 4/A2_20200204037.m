clc;
clear;
close all;

sigma = input('Enter the value of sigma: ');
image = imread('input.jpg');
image = rgb2gray(image);
imshow(image); title('Original Image');
[m, n] = size(image);

kernel_size = 9;

range = -floor(kernel_size / 2) : floor(kernel_size / 2);
X = zeros(kernel_size, kernel_size);
Y = zeros(kernel_size, kernel_size);
for i = 1:kernel_size
    for j = 1:kernel_size
        X(i, j) = range(j);
        Y(i, j) = range(i);
    end
end

G = zeros(kernel_size, kernel_size);
sumG = 0;
for i = 1:kernel_size
    for j = 1:kernel_size
        G(i, j) = (1 / (2 * pi * sigma^2)) * exp(-(X(i, j)^2 + Y(i, j)^2) / (2 * sigma^2));
        sumG = sumG + G(i, j);
    end
end

G = G / sumG;

pad_size = floor(kernel_size / 2);
padded_image = zeros(m + 2 * pad_size, n + 2 * pad_size);
filtered_image = zeros(m, n);

for i = 1:m
    for j = 1:n
        padded_image(i + pad_size, j + pad_size) = image(i, j);
    end
end

for i = 1:m
    for j = 1:n
        sumValue = 0;
        for k = 1:kernel_size
            for l = 1:kernel_size
                sumValue = sumValue + padded_image(i + k - 1, j + l - 1) * G(k, l);
            end
        end
        filtered_image(i, j) = sumValue;
    end
end

figure;
imshow(uint8(filtered_image)); title('Filtered Image');

imwrite(uint8(filtered_image), 'filtered_image.jpg');