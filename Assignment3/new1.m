% Read the image and convert to grayscale
img = imread('cat.jpg');
if size(img, 3) == 3
    gray_img = rgb2gray(img);
else
    gray_img = img; % Assume the image is already grayscale if it's not 3-channel
end

% Add salt & pepper noise with density = 0.1
noisy_img = imnoise(gray_img, 'salt & pepper', 0.1);

% Initialize filtered image
filtered_img = noisy_img;

% Get dimensions of the image
[rows, cols] = size(noisy_img);

% Ensure that the row division is handled correctly
half_row = floor(rows/2);

% Apply median filter on the top half of the noisy image
for i = 2:(half_row - 1)
    for j = 2:(cols - 1)
        window = noisy_img(i-1:i+1, j-1:j+1);
        filtered_img(i, j) = median(window(:));
    end
end

% Apply min filter on the bottom half of the noisy image
for i = (half_row + 1):(rows - 1)
    for j = 2:(cols - 1)
        window = noisy_img(i-1:i+1, j-1:j+1);
        filtered_img(i, j) = min(window(:));
    end
end

% Display results
subplot(1, 2, 1);
imshow(noisy_img);
title('Noisy Image');

subplot(1, 2, 2);
imshow(filtered_img);
title('Filtered Image');

% Write filtered image to a file
imwrite(filtered_img, 'filtered_image.png');
