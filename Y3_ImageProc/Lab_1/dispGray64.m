% Displays 64 element gray scale
function y = dispGray64(x)
    figure;
    image(x);
    colormap(gray(64));
    colorbar; 