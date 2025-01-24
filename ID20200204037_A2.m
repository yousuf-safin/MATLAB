% inputing images
img1 = imread('img 1.jpg');
img2 = imread('img 2.jpg');
img3 = imread('img 3.jpg');

% Getting the dimensions of each image
[rows1, cols1, ~] = size(img1);
[rows2, cols2, ~] = size(img2);
[rows3, cols3, ~] = size(img3);

rows = min([rows1, rows2, rows3]);
cols = min([cols1, cols2, cols3]);

img1 = imresize(img1, [rows, cols]);
img2 = imresize(img2, [rows, cols]);
img3 = imresize(img3, [rows, cols]);

% using floor
mid_col = floor(cols / 2);

img1_part1 = img1(:, 1:mid_col, :);
img2_part1 = img2(:, 1:mid_col, :);
img3_part1 = img3(:, 1:mid_col, :);

% Dividing into required colors
img1_red = img1_part1;
img1_red(:, :, 2:3) = 0; 

img2_green = img2_part1;
img2_green(:, :, [1, 3]) = 0; 

img3_blue = img3_part1;
img3_blue(:, :, 1:2) = 0; 


output_img = [img1_red, img2_green, img3_blue];

% Display the final output image
figure;
imshow(output_img);

