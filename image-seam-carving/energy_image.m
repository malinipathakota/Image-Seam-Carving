function energyImage = energy_image(im)
    grayImage = rgb2gray(im);
    colormap(gray(256));
    [Gx, Gy] = imgradientxy(grayImage, 'sobel');
    xvar = double(Gx);
    yvar = double(Gy);
    energyImage = sqrt(xvar .^2 + yvar .^2);
end
