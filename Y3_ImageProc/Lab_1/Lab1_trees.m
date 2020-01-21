% Lab 1.5: trees
clear all;
close all;

[X,map] = imread("trees.tif");
image(X); % Display the image…
colormap(map); % with its colormap (as read from the TIFF file) 
colorbar;


[X,map] = imread("lily.tif"); 
image(X);

column_ramp = [0:1/255:1]';% Create column of values running from 0 to 1
% The next 3 lines create three colourmaps, intended for displaying the
% red green and blue components separately. 
redmap = [column_ramp,zeros(256,1),zeros(256,1)];
greenmap = [zeros(256,1),column_ramp,zeros(256,1)];
bluemap = [zeros(256,1),zeros(256,1),column_ramp];

 % Below, display the three image planes in 3 separate windows
figure; colormap(redmap);image(X(:,:,1)); colorbar;
figure; colormap(greenmap);image(X(:,:,2)); colorbar;
figure; colormap(bluemap);image(X(:,:,3)); colorbar;



% True Color RGB: trichromatic values
R=double(X(:,:,1)); G=double(X(:,:,2)); B = double(X(:,:,3)); 
sumRGB = R+G+B;
x = rescale(R./sumRGB);
y = rescale(G./sumRGB);
z = rescale(B./sumRGB);


% min_x = min(min(x)); max_x = max(max(x)); range_x = (max_x - min_x);
% x_ramp = [0:1/(255*range_x):1]'; range_red = size(x_ramp,1);
% 
% min_y = min(min(y)); max_y = max(max(y)); range_y = (max_y - min_y);
% y_ramp = [0:1/(255*range_y):1]'; range_green = size(y_ramp,1);
% 
% min_z = min(min(z)); max_z = max(max(z)); range_z = (max_z - min_z);
% z_ramp = [0:1/(255*range_z):1]'; range_blue = size(z_ramp,1);

% xmap = [x_ramp,zeros(range_red,1),zeros(range_red,1)];
% ymap = [zeros(range_green,1), y_ramp,zeros(range_green,1)];
% zmap = [zeros(range_blue,1),zeros(range_blue,1),z_ramp];

gray = gray(64);

figure; colormap(gray);imagesc(x); colorbar;
figure; colormap(gray);imagesc(y); colorbar;
figure; colormap(gray);imagesc(z); colorbar;

