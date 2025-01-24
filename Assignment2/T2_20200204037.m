% Read the input image for Task 2
img = imread('input_img.png');
img = rgb2gray(img);
[row, col] = size(img); 

%bit-plane slicing for odd ID
bit_planes = [1, 2, 7, 8];
bit_images = cell(1, length(bit_planes));

for k = 1:length(bit_planes)
    plane = bit_planes(k);
    bit_images{k} = zeros(row, col);
    for i = 1:row
        for j = 1:col
            bit_images{k}(i, j) = bitget(img(i, j), plane) * 255;
        end
    end
end

%Display
figure;
subplot(2, 3, 1);
imshow(img);
title('Original Image');

for k = 1:length(bit_planes)
    subplot(2, 3, k + 1);
    imshow(uint8(bit_images{k}));
    title(['Bit Plane ', num2str(bit_planes(k))]);
end


for k = 1:length(bit_planes)
    imwrite(uint8(bit_images{k}), ['T2_Output_', num2str(bit_planes(k)), '_20200204037.png']);
end