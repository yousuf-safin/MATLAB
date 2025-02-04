img = imread('cameraman.png');

[row, col] = size(img);

output_img = uint8(zeros(row, col));

% For this program, let's assume we would like to change every contrast level between 101-150
% to 255, and keep the rest identical to input image. 
% you can try experimenting with different range and values.

for i = 1:row
    for j = 1:col
        % condition to check if the intensity level falls within the range
        if img(i, j) >= 101 && img(i, j) <= 150
            output_img(i, j) = 255;
        else
            output_img(i, j) = img(i, j);
        end
    end
end

figure;
subplot(1, 2, 1);
imshow(img);
title('Original Image');

subplot(1, 2, 2);
imshow(output_img);
title('Intensity Level Slicing Output');