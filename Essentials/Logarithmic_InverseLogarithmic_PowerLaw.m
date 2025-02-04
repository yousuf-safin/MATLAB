img = imread('cameraman.png');
img = im2double(img); % convert the uint8 image to double

[row, col] = size(img);

logarithmic_img = zeros(row, col);
inv_logarithmic_img = zeros(row, col);
pow_law_img = zeros(row, col);

c = 1; % try to experiment with different values
gamma = 0.05; % try to experiment with different values

for i = 1:row
    for j = 1:col
        % logarithmic transformation
        % S = C * log (1 + R) 
        logarithmic_img(i, j) = c * log (1 + img(i, j));
        
        % inverse logarithmic transformation
        % as the name implies, totally inverse of logarithmic transformation
        inv_logarithmic_img(i, j) = exp(img(i, j) / c) - 1;
        
        % power law transformation
        % S = C * R ^ gamma
        pow_law_img(i, j) = c * (img(i, j) ^ gamma);
    end
end

figure;
subplot(2, 2, 1);
imshow(img);
title('Original Image');

subplot(2, 2, 2);
imshow(logarithmic_img);
title('Logarithmic Transformation');

subplot(2, 2, 3);
imshow(inv_logarithmic_img);
title('Inverse Logarithmic Transformation');

subplot(2, 2, 4);
imshow(pow_law_img);
title('Power Law Transformation');

        
