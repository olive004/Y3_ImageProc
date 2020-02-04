% Returns binary image where obj in im are separated by G and B channels

function X_sep = sep_objs(G_sep, B_sep)
    X_sep = zeros(size(G_sep));    % initializing empty

    for i=1:numel(G_sep)
        X_sep(i) = G_sep(i) && B_sep(i);
    end


end