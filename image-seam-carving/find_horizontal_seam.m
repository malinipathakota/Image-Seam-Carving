function horizontalSeam = find_horizontal_seam(cumulativeEnergyMap)
   transposedMap = transpose(cumulativeEnergyMap);
   horSeam = find_vertical_seam(transposedMap);  
   horizontalSeam = transpose(horSeam);
end