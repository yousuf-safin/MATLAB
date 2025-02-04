img = imread('cameraman.png');

[row, col] = size(img);

% Histogram is just frequency count of intensity level displayed in a bar chart
% Our image has intensity ranging from 0-255, meaning we have to count frequency of 256 values.
% Experiment with different gray scale image and see the result.

freq = uint8(zeros(1, 256));

for i = 1:row
    for j = 1:col
        temp = img(i, j) + 1; % +1 because intensity level starts at 0, but we will store it in a 1 indexing based matrix
        freq(1, temp) = freq(1, temp) + 1;
    end
end

figure;
subplot(1, 2, 1);
imshow(img);
title('Original Image');

subplot(1, 2, 2);
bar(freq);
title('Histogram');