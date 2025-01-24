input_image = imread('input_img.png');
input_image = rgb2gray(input_image); 


A = min(input_image(:));
B = max(input_image(:));


D = B - A;
bits = 8; 
M = 2^bits - 1; 

% contrast stretching
[m, n] = size(input_image);
output_image = zeros(m, n);
for i = 1:m
    for j = 1:n
        output_image(i, j) = ((input_image(i, j) - A) / D) * M + A;
    end
end
output_image = uint8(output_image);

% Display images
figure;
subplot(1, 2, 1);
imshow(input_image);
title('Input Image');
subplot(1, 2, 2);
imshow(output_image);
title('Output -> Contrast Stretched Image');

imwrite(output_image, 'T1_Output_1_20200204037.png');
% Histogram 
input_hist = zeros(1, 256);
output_hist = zeros(1, 256);

for i = 1:m
    for j = 1:n
        input_hist(input_image(i, j) + 1) = input_hist(input_image(i, j) + 1) + 1;
        output_hist(output_image(i, j) + 1) = output_hist(output_image(i, j) + 1) + 1;  
    end
end
% Display Histogram
figure;
subplot(1, 2, 1);
bar(0:255, input_hist);
title('Histogram of Input Image');
subplot(1, 2, 2);
bar(0:255, output_hist);
title('Histogram of Output Image');
