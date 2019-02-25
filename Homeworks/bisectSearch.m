function [flag,output,it] = bisectSearch(gradf, iniInt, tol)

a = iniInt(1);
b = iniInt(2);
c = (a+b)/2;
gradfc = gradf(c);
it = 0;

while b-a > tol && gradfc ~= 0  
    if gradfc < 0
        a = c;
    else
        b = c;
    end
    c = (a+b)/2;
    gradfc = gradf(c);
    it = it+1;
end
if gradfc == 0
    flag = 0;
    output = c;
else
    flag = 1;
    output = [a,b];
end



end

