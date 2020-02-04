% Quick plotting function for bounding boxes 
function x = show_objs(X_bw, Regions)

    centroids = cat(1, Regions.Centroid);
    boxes = cat(1, Regions.BoundingBox);
    areas = cat(1, Regions.Area);

    % 1.a) How many objects
    num_obj = size(centroids, 1);
    
    figure;
    imshow(X_bw);
    hold on
    plot(centroids(:,1),centroids(:,2),'b*');
    for i=1:size(boxes,1)
        gradient_r = i/size(boxes,1);
        gradient_b = 1 - gradient_r;
        h = rectangle('Position',[boxes(i,1),boxes(i,2),boxes(i,3),boxes(i,4)],'EdgeColor','r','LineWidth',2);
        set(h,'EdgeColor', [gradient_r 0 gradient_b]);
        x = centroids(i,1); y=centroids(i,2);
        h = text(x,y, num2str(i));
        
    end
    title(['Num of objs: ', num2str(num_obj)]);
    hold off

end









