function view_seam(im, seam, seamDirection)
    switch seamDirection
        case 'HORIZONTAL'
            imagesc(im);
            hold on;
            plot(seam);
        case 'VERTICAL'
            imagesc(im);
            hold on;
            count = 0;
            for i = 1:size(seam,1)
                for j = 1:size(seam,2)
                    count = count + 1;
                end
            end
            plot(seam,1:count)
    end 
end
