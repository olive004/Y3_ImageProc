% Displays 64 element gray scale
function y = dispGray(x, map)
    figure;
    image(x);
    colormap(map);
    colorbar; 