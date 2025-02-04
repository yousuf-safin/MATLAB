test = uint8([1 2 3]);

% This code will right shift all the elements of test matrix by 1 bit.
% First parameter of this function takes a matrix (test in this example)
% Second parameter of this function takes how many bit do we want to shift right (1 in this example).
a = bitsra(test, 1);

% This code will left shift all the elements of test matrix by 1 bit.
% First parameter of this function takes a matrix (test in this example)
% Second parameter of this function takes how many bit do we want to shift left (1 in this example).
b = bitsll(test, k);

% You can also perform bitwise operation in matlab.
% this will perform bitwise and operation will all the elements of test matrix with 1.
% First parameter of this function takes a matrix (test in this example)
% Second parameter of this function takes with what we want to perfrom bitwise-and with (1 in this example)
c = bitand(test, 1); 

% Similarly we can perform bitwise-or bitwise-xor and so on
d = bitor(test, 4);
e = bitxor(test, 2);

% imtool shows and image like imshow
% But it shows the pixel position and it's value when you hover your mouse in any pixel of the image.
I = imread('cameraman.png');
imtool(I);