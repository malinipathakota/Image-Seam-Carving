function [reducedColorImage, reducedEnergyImage] = decrease_height(im, energyImage)
    Map = cumulative_min_energy_map(energyImage,'HORIZONTAL');
    hSeam = find_horizontal_seam(Map);

    row = size(energyImage,1);
    col = size(energyImage,2);

    i=1;
    while(i<=col)
        preborder = row-1;
        seaminc = hSeam(i)+1;
        im(hSeam(i):preborder,i,:) = im(seaminc:row,i,:);
        i = i+1;
    end
    reducedColorImage = im(1:preborder,:,:);
    reducedEnergyImage = energy_image(reducedColorImage);
end