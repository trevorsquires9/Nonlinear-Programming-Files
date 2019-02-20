function [stepSize] = bisectSearch(gradf, tol, iniInt)

a = iniInt(1);
b = iniInt(2);

while b-a > tol
    stepSize = (b-a)/2;
    gradIterate = gradf(stepSize);
    if gradIterate == 0
        break;
    elseif gradIterate > 0
        b = stepSize;
    else
        a = stepSize;
    end
end


end

