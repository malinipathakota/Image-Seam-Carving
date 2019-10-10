function verticalSeam = find_vertical_seam(cumulativeEnergyMap)
    row = size(cumulativeEnergyMap,1);
    col = size(cumulativeEnergyMap,2);
    eMap = cumulativeEnergyMap(row, :);
    minMap = min(eMap);
    finMap = find(eMap == minMap);

    temp = finMap(1);
    verticalSeam = zeros(row, 1);
    verticalSeam(row) = temp;

    for i = row : -1 : 2
        xvar = i - 1;
        minus = temp - 2;
        plus = temp + 2;
        minimumval = cumulativeEnergyMap(xvar, temp);
        ind = temp;
        
        switch true
            case temp > 1 && cumulativeEnergyMap(xvar, minus+1) < minimumval
                ind = minus + 1;
            case temp < col && cumulativeEnergyMap(xvar, plus-1) < minimumval
                ind = plus - 1;
        end
        temp = ind;
        verticalSeam(xvar) = temp;
    end
end