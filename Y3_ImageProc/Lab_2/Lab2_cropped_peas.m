
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

% for T = 100:5:200
%     gbin = (G > T); % For whatever threshold T you decide on
%     imshow(gbin); % colormap(gray(2))
% end


% Threshold won't work; try color separation
%%%%%%%%%%%%%%%%%% CODE RECYCLED FROM LAB 1
% Color coordinates
R=double(X(:,:,1)); G=double(X(:,:,2)); B = double(X(:,:,3)); 
sumRGB = R+G+B;
x = rescale(R./sumRGB);
y = rescale(G./sumRGB);
z = rescale(B./sumRGB);
%%%%%%%%%%%%%%%%%%


% Thresholding in color domain: peas 1, bg 0

% histogram(x(:), 100);
% histogram(y(:), 100);
% histogram(z(:), 100);

G_sep = y>0.28;     % Aesthetic at y>0.26 and z<0.58
B_sep = z<0.58;     % -->Lower threshold for less peas

X_sep = sep_objs(G_sep, B_sep);


figure; imagesc(X_sep); colorbar;






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Task 2
close all;

X_bw = bwlabel(X_sep);
figure; imagesc(X_bw); colorbar;

Regions = regionprops(X_bw);
centroids = cat(1, Regions.Centroid);
boxes = cat(1, Regions.BoundingBox);
areas = cat(1, Regions.Area);


show_objs(X_bw, Regions);


% 1.b) Mean value area
m_area = mean(areas);
% 1.c) Estimated std of area
std_area = std(areas);


% 1.d) Throw out more peas with area thresholding
Regions_corrected = split_patch_objs(X, Regions);

show_objs(X_bw, Regions_corrected);




%%%%%%%%%%%%%%%%%%%%%%%%%
%% Task 3

ValidPeaIndices = [Regions.Area] > (m_area - std_area);

















