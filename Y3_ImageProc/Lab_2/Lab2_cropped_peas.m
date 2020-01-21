
clear all;
close all;

[X,map]=imread('croppedpeasondesk.jpg');

figure; image(X);

G = rgb2gray(X);

figure; imagesc(G); colormap(gray(256)); % imagesc is like
%image , but scales the values in X to
%the range of the colourmap; 


G = double(G);   % hist needs a double type to work
g = G(:); % G(:) converts the 2D matrix into a 1D array; also could use reshape command

figure;
% histogram(g); % Note the number of bins, which is 10;
histogram(g,100); % Note the histogram now; what is the difference

T = 150;
gbin = (G > T); % For whatever threshold T you decide on
figure;
imagesc(gbin);

for T = 100:5:200
    gbin = (G > T); % For whatever threshold T you decide on
    imshow(gbin); % colormap(gray(2))
end









