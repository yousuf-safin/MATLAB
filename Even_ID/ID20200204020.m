img1 = imread('img 1.jpg');
img2 = imread('img 2.jpg');

[rows1, cols1, ~] = size(img1);
[rows2, cols2, ~] = size(img2);

rows = min(rows1, rows2);
cols = min(cols1, cols2);

img1 = imresize(img1, [rows, cols]);
img2 = imresize(img2, [rows, cols]);

half_row = floor(rows / 2);
half_col = floor(cols / 2);

img1_part1 = img1(1:half_row, 1:half_col, :);
img1_part2 = img1(1:half_row, half_col+1:end, :);
img1_part3 = img1(half_row+1:end, 1:half_col, :);
img1_part4 = img1(half_row+1:end, half_col+1:end, :);

img2_part1 = img2(1:half_row, 1:half_col, :);
img2_part2 = img2(1:half_row, half_col+1:end, :);
img2_part3 = img2(half_row+1:end, 1:half_col, :);
img2_part4 = img2(half_row+1:end, half_col+1:end, :);

img1_part1_red = img1_part1;
img1_part1_red(:, :, 2:3) = 0;

img1_part4_red = img1_part4;
img1_part4_red(:, :, 2:3) = 0;

img2_part6_green = img2_part3;
img2_part6_green(:, :, [1, 3]) = 0;

img2_part7_green = img2_part4;
img2_part7_green(:, :, [1, 3]) = 0;

top_row = [img1_part1_red, img2_part6_green];
bottom_row = [img2_part7_green, img1_part4_red];

output_img = [top_row; bottom_row];

figure;
imshow(output_img);
title('Output Image');

imwrite(output_img, 'output_image.jpg');
