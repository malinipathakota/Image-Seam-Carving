%Malini Pathakota & Srikavya Dindu
inputImage = imread('inputSeamCarvingPrague.jpg');
energy = energy_image(inputImage);

% variables to be changed by function
newImage = inputImage;
newEnergy = energy;

i = 0;
while i < 100
   [newImage,newEnergy] = decrease_width(newImage,newEnergy);
   i = i + 1;
end
imwrite(newImage, 'outputReduceWidthPrague.png')