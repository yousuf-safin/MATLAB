% Step 1: Read the image
img = imread('cat.jpg'); % Replace with your image path

% Step 2: Convert to grayscale if necessary
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Step 3: Apply salt & pepper noise with density 0.1
noisy_img = imnoise(img, 'salt & pepper', 0.1);

% Get image dimensions
[rows, cols] = size(noisy_img);

% Determine top and bottom halves
top_half_rows = 1:floor(rows/2);
bottom_half_rows = (floor(rows/2) + 1):rows;

% Initialize filtered image with noisy image
filtered_img = noisy_img;

% Step 4: Manual padding (replicate borders)
padded = uint8(zeros(rows + 2, cols + 2));
padded(2:end-1, 2:end-1) = noisy_img;

% Pad top row
padded(1, 2:end-1) = noisy_img(1, :);
% Pad bottom row
padded(end, 2:end-1) = noisy_img(end, :);
% Pad left column
padded(2:end-1, 1) = noisy_img(:, 1);
% Pad right column
padded(2:end-1, end) = noisy_img(:, end);
% Pad corners
padded(1, 1) = noisy_img(1, 1);
padded(1, end) = noisy_img(1, end);
padded(end, 1) = noisy_img(end, 1);
padded(end, end) = noisy_img(end, end);

% Step 5: Apply median filter to top half
for i = top_half_rows
    for j = 1:cols
        % Extract 3x3 window from padded image
        window = padded(i:i+2, j:j+2);
        % Flatten and sort to find median
        sorted_window = sort(window(:));
        filtered_img(i, j) = sorted_window(5);
    end
end

% Apply min filter to bottom half
for i = bottom_half_rows
    for j = 1:cols
        % Extract 3x3 window from padded image
        window = padded(i:i+2, j:j+2);
        % Find minimum value
        filtered_img(i, j) = min(window(:));
    end
end

% Step 6: Display using subplot
figure;
subplot(1, 2, 1), imshow(noisy_img), title('Noisy Image');
subplot(1, 2, 2), imshow(filtered_img), title('Filtered Image');

% Step 7: Write the filtered image to a file
imwrite(filtered_img, 'filtered_image.jpg');