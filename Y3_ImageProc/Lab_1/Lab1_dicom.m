% Lab 1.7: dicoms
clear all;
close all;

info = dicominfo('US-PAL-8-10x-echo.dcm'); 
[X, map] = dicomread('US-PAL-8-10x-echo.dcm');
montage(X, map); 
colorbar;



M=immovie(X,map);
movie(M,20,10); 


