% In regions with multiple fat objects touching, we tryna split them into singles

function Regions_split = split_patch_objs(X, Regions)
    m_area = mean([Regions.Area]);
    std_area = std([Regions.Area]);
    % Chuck out all the bois that are too smol
    Regions_big = Regions([Regions.Area] > (m_area - 1.2*std_area));
    % Chuck those that are too big (mult pea areas)
    Regions_medium = Regions_big([Regions_big.Area] < (m_area + std_area));
    mean_single_obj_area = mean([Regions_medium.Area]);
    
    Regions_too_big = Regions_big([Regions_big.Area] > (m_area + std_area));

    
    Regions_split = Regions(1);   % Initialize return    
    patches = cat(1,Regions_too_big.BoundingBox);
    
    for i = size(patches,1)
        Regions_patch = Regions(1);  % initialize regions in current patch
        Regions_split(i) = Regions_patch;
        % Get coordinates to crop X at
        low_x = patches(i,1); low_y=patches(i,2); width=patches(i,3); height=patches(i,4); % [lowerx lowery width height]
        crop_X = X(((X>low_x) & (X< (low_x+width))), ((X>low_y) & (X<(low_y+height))), :,:,:);
        
        imshow(crop_X)
        % Get areas of peas in patch
        areas = cat(1,Regions_too_big.Area);
        
        restr_threshold = [0.28 0.58];
        
        % Prep color channels for separating peas
        R=double(crop_X(:,:,1)); G=double(crop_X(:,:,2)); B = double(crop_X(:,:,3)); 
        sumRGB = R+G+B;
        % Normalized color channels
        y = rescale(G./sumRGB);
        z = rescale(B./sumRGB);
        % Change threshold until the patch has believable obj counts
        while((2*mean(areas)) < mean_single_obj_area)
            % Binary color channels
            G_sep = y>restr_threshold(1);     % 1 for peas, 0 for none Aesthetic at y>0.26 and z<0.58
            B_sep = z<restr_threshold(2);     % -->Lower threshold for less peas
            
            restr_threshold = [(restr_threshold + 0.01) (restr_threshold - 0.01)];
            X_sep = sep_objs(G_sep, B_sep);
            
            Regions_patch = regionprops(bwlabel(X_sep));
            
            areas = cat(1, Regions_patch);
            
        end    
        
        whos Regions_patch
        whos Regions_split
%         Regions_split = Regions_split;
        
    end


end
