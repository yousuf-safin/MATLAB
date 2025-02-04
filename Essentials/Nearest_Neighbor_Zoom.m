img = imread('cameraman.png');

[row, col, dim] = size(img);

% We will 2x zoom the image. So the rows and columns will increase by 2x.
zoomed_row = round(row * 2);
zoomed_col = round(col * 2);

% My input image is uint8 based (ie. intensity levels are 0-255), so type-casting output from zeros into uint8
zoomed_img = uint8(zeros(row, col, dim));

for i = 1:zoomed_row
    for j = 1:zoomed_col

        % i and j are used to iterate the output image. For each pixel (combination of i, j) we need to find the nearest neighbor in the input image.
        % For that we simply divide position of the pixel (i, j) by 2 (here, 2 is our zoom factor) and round it to nearest full number.
        nn_i = round(i / 2); 
        nn_j = round(j / 2);
        
        % We have to make sure that the index starts from 1 and not 0.
        nn_i = max(nn_i, 1);
        nn_j = max(nn_j, 1);

        % We have to make sure that the index doesn't go out of bound in input image
        nn_i = min(nn_i, row);
        nn_j = min(nn_j, col);
        
        % Copy the desired pixel from input image to output image
        zoomed_img(i, j, :) = img(nn_i, nn_j, :);
    end
end

figure;
imshow(img);
title('Original Image');

figure;
imshow(zoomed_img);
title('2x Zoomed Image');
