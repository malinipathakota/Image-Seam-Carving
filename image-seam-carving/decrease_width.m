function [reducedColorImage, reducedEnergyImage] = decrease_width(im, energyImage)
    Map = cumulative_min_energy_map(energyImage,'HORIZONTAL');
    vSeam = find_vertical_seam(Map);

    row = size(energyImage,1);
    col = size(energyImage,2);

    i=1;
    while(i<=row)
        preborder =col-1;
        seaminc =vSeam(i)+1;
        im(i,vSeam(i):preborder,:) = im(i,seaminc:col,:);
        i = i+1;
    end
    reducedColorImage = im(:,1:preborder,:);
    reducedEnergyImage = energy_image(reducedColorImage);
end
