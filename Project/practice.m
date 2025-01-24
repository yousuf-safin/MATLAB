% Read the image
img = imread('back.png');

% Get the size of the image
[row, col, ~] = size(img);

% Loop through each pixel
for i = 1:row
    for j = 1:col
        % Check if the pixel is green (R < 100, G > 150, B < 100)
        if img(i, j, 1) < 100 && img(i, j, 2) > 150 && img(i, j, 3) < 100
            % Change the pixel to blue (R = 0, G = 0, B = 255)
            img(i, j, :) = [0, 0, 255];
        end
    end
end

% Display the modified image
figure;
imshow(img);

% Get and display image information
info = imfinfo('back.png');
disp(info);
