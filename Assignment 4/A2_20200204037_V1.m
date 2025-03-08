% MATLAB Implementation of Gaussian Filter (Without Built-in Functions Except imread, imshow, rgb2gray)

clc;
clear;
close all;

% Read and display the input image
image = imread('input.jpg'); % Read input image
image = rgb2gray(image); % Convert to grayscale
imshow(image); title('Original Image');
[m, n] = size(image);

% Define kernel size based on roll number 20200204037
kernel_size = 9; % 9x9 kernel as remainder is 1
sigma = input('Enter the value of sigma: ');

% Manually generate X and Y matrices
range = -floor(kernel_size / 2) : floor(kernel_size / 2);
X = zeros(kernel_size, kernel_size);
Y = zeros(kernel_size, kernel_size);
for i = 1:kernel_size
    for j = 1:kernel_size
        X(i, j) = range(j);
        Y(i, j) = range(i);
    end
end

% Manually compute Gaussian Kernel
G = zeros(kernel_size, kernel_size);
sumG = 0;
for i = 1:kernel_size
    for j = 1:kernel_size
        G(i, j) = (1 / (2 * 3.1416 * sigma^2)) * exp(- (X(i, j)^2 + Y(i, j)^2) / (2 * sigma^2));
        sumG = sumG + G(i, j);
    end
end

% Normalize Kernel
for i = 1:kernel_size
    for j = 1:kernel_size
        G(i, j) = G(i, j) / sumG;
    end
end

% Manually Apply Gaussian Filter
pad_size = floor(kernel_size / 2);
padded_image = zeros(m + 2 * pad_size, n + 2 * pad_size);
filtered_image = zeros(m, n);

% Copy image into padded region
for i = 1:m
    for j = 1:n
        padded_image(i + pad_size, j + pad_size) = image(i, j);
    end
end

% Perform manual convolution
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

% Display result
figure;
imshow(uint8(filtered_image)); title('Filtered Image');
