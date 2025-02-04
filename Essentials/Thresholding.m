img = imread('cameraman.png');

[row, col] = size(img);

output_img = uint8(zeros(row, col));

% Thresholding can be used to change the intensity level of image
% Input image has intensity level from 0-255, total 256 levels.
% For this program, let's assume we want to change the intensity level to only 2 values. So we take only 0 and 255.

% What we can do is, assume a threshold. For example, In this program, we will change every value less than 128, to 0 
% And every value equal or higher than 128, to 255.
% Keep in mind, lowering intensity level will cause loss of information in output image.

% You can experiment with different threshold and Intensity level in output image

for i = 1:row
    for j = 1:col
        % condition to check if the intensity level is above or equals to 128
        if img(i, j) >= 128
            output_img(i, j) = 255;
        else
            output_img(i, j) = 0;
        end
    end
end

figure;
subplot(1, 2, 1);
imshow(img);
title('Original Image');

subplot(1, 2, 2);
imshow(output_img);
title('Thresholded Image');