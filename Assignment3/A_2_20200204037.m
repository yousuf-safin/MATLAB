img = imread('cat.jpg'); % Replace with your image path


if size(img, 3) == 3
    img = rgb2gray(img);
end


noisy_img = imnoise(img, 'salt & pepper', 0.1);


[rows, cols] = size(noisy_img);


top_half_rows = 1:floor(rows/2);
bottom_half_rows = (floor(rows/2) + 1):rows;


filtered_img = noisy_img;


padded = uint8(zeros(rows + 2, cols + 2));
padded(2:end-1, 2:end-1) = noisy_img;


padded(1, 2:end-1) = noisy_img(1, :);

padded(end, 2:end-1) = noisy_img(end, :);

padded(2:end-1, 1) = noisy_img(:, 1);

padded(2:end-1, end) = noisy_img(:, end);

padded(1, 1) = noisy_img(1, 1);
padded(1, end) = noisy_img(1, end);
padded(end, 1) = noisy_img(end, 1);
padded(end, end) = noisy_img(end, end);


for i = top_half_rows
    for j = 1:cols
        
        window = padded(i:i+2, j:j+2);
       
        sorted_window = sort(window(:));
        filtered_img(i, j) = sorted_window(5);
    end
end


for i = bottom_half_rows
    for j = 1:cols
        
        window = padded(i:i+2, j:j+2);
       
        filtered_img(i, j) = min(window(:));
    end
end


figure;
subplot(1, 2, 1), imshow(noisy_img), title('Noisy Image');
subplot(1, 2, 2), imshow(filtered_img), title('Filtered Image');


imwrite(filtered_img, 'filtered_image.jpg');