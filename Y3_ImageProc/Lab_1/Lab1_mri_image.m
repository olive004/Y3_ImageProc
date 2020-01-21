% Lab 1: mri image
clear all;
close all;

fid=fopen('head.128','r'); % Opens file for reading

[x,npxls]=fread(fid,[128,128],'uchar'); % Reads data values
% into matrix x with 128 rows,
% and 128 columns 

x=x'; % Matlab reads in arrays with a different index order [Ctd...]
 % to that of ‘C’ File was created using C, so transpose matrix

fclose(fid); % Close the file handle 

figure;
image(x); 
colorbar;   % Gives color bar on side

dispGray64(x);

map = gray(64); % Assign the output of the colourmap command to
 % a variable called “map”
mymap = gray(256);

dispGray(x, mymap)









