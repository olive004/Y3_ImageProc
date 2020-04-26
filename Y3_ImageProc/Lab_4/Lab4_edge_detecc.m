% Image processing anil bharath
%% 1D Edge detecc
% implement a simple difference operator for one dimensional vectors
clear all;
close all;

input = [0 0 0 10 200 201 203 198 202 130 90 12];
e_strength = zeros(size(input));
input = [0 input];      % pad
for current = 1:length(e_strength)
    e_strength(current) = input(current+1) - input(current);
end
input = input(2:end);   % unpad
e_strength = abs(e_strength);

T = max(e_strength) / 2;
edge_map = e_strength > T;
disp(edge_map);

% convolution mask
% I(n +1, +0, -1) * h
h = [-1, 1, 0];
d = zeros(size(input));
input = [0 input 0];    % pad
for n = 1:length(d)
    d(n) = sum(h .* input(n:n+2));
end
input = input(2:end-1);   % unpad

d = abs(d);
disp(d)

% second derivative: 
% just do the same edge operator detection as above but with the d(n) 
% vector as the input

%% 2D Edge detecc
close all;

load phantom2.mat;
imshow(phantom);

mx_h = (1/6).* repmat([1 0 -1], 3,1);
phantom_conv_h = conv2(phantom, mx_h, 'same');
phantom_conv_h = abs(phantom_conv_h);
imagesc(phantom_conv_h);

figure;
stem(phantom_conv_h(length(phantom_conv_h)/2, :));

mx_v = (1/6).* repmat([1; 0; -1], 1,3);
phantom_conv_v = conv2(phantom, mx_v, 'same');
phantom_conv_v = abs(phantom_conv_v);

figure;
phantom_mag = sqrt(phantom_conv_h.^2 + phantom_conv_v.^2);
imagesc(phantom_mag);

%% 2D Edge orientation on phantom2
close all;

load phantom2.mat;
imshow(phantom);

mx_h = (1/6).* repmat([1 0 -1], 3,1);
phantom_conv_h = conv2(phantom, mx_h, 'same'); phantom_conv_h = abs(phantom_conv_h);
mx_v = (1/6).* repmat([1; 0; -1], 1,3);
phantom_conv_v = conv2(phantom, mx_v, 'same'); phantom_conv_v = abs(phantom_conv_v);

figure;
phantom_mag = sqrt(phantom_conv_h.^2 + phantom_conv_v.^2);
imagesc(phantom_mag);
