img = imread('cameraman.png');

[row, col] = size(img);

neg_img = uint8(zeros(row, col)); % zeros returns double matrix, we are working with uint8 image
idt_img = uint8(zeros(row, col));

L = 256; % The image has intensity ranging from 0-255, so intensity level is 256

for i = 1:row
    for j = 1:col
        % Negative transformation
        % S = L - 1 - R
        neg_img(i, j) = L - 1 - img(i, j);
        
        % Identity transformation
        % S = R, makes an exact copy of input image
        idt_img(i, j) = img(i, j);
    end
end

figure;
subplot(1, 3, 1);
imshow(img);
title('Original Image');

subplot(1, 3, 2);
imshow(neg_img);
title('Negative');

subplot(1, 3, 3);
imshow(idt_img);
title('Identity');

        
