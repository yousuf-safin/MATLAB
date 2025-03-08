% MATLAB Implementation of Gaussian Filter

clc;
clear;
close all;

% Read and display the input image
image = imread('input_image.jpg'); % Replace with your image
image = rgb2gray(image); % Convert to grayscale if needed
figure, imshow(image), title('Original Image');

% Define kernel size based on roll number 20200204037
kernel_size = 9; % 9x9 kernel as remainder is 1
sigma = input('Enter the value of sigma: ');

% Generate Gaussian Kernel
[X, Y] = meshgrid(-floor(kernel_size/2):floor(kernel_size/2), -floor(kernel_size/2):floor(kernel_size/2));
G = exp(-(X.^2 + Y.^2) / (2*sigma^2));
G = G / sum(G(:)); % Normalize kernel

% Apply Gaussian Filter manually (without imfilter or conv2)
[m, n] = size(image);
pad_size = floor(kernel_size/2);
padded_image = padarray(image, [pad_size pad_size], 'replicate');
filtered_image = zeros(m, n);

for i = 1:m
    for j = 1:n
        region = double(padded_image(i:i+kernel_size-1, j:j+kernel_size-1));
        filtered_image(i, j) = sum(sum(region .* G));
    end
end

% Convert to uint8 and display result
filtered_image = uint8(filtered_image);
figure, imshow(filtered_image), title('Filtered Image with Gaussian Blur');
