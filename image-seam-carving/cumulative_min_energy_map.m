function M = cumulative_min_energy_map(energyImage, seamDirection)
    switch seamDirection
        case 'HORIZONTAL'
            ei = transpose(energyImage);
        case 'VERTICAL'
            ei = energyImage;
    end
    
    [r, c] = size(ei);
    M = zeros([r,c]);
    M(1, :) = ei(1, :);

    for i = 1: r-1
        for j = 1: c-2
            switch j
                case 1
                    M(i+1,j) = ei(i+1,j) + min([M(i,j), M(i,j+1)]);
            end
            findmin = min([M(i,j), M(i,j+1), M(i,j+2)]);
            M(i+1,j+1) = ei(i+1,j+1) + findmin;
        end        
        findColMin = min([M(i,c), M(i,c-1)]);
        M(i+1,c) = ei(i+1,c) + findColMin;
    end

    switch seamDirection
        case 'HORIZONTAL'
            M = transpose(M);
        case 'VERTICAL'
            M = M;
    end
end
