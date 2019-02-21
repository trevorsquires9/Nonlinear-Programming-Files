function [stepSize] = goldenSection(f, tol, iniInt)

phi = (1+sqrt(5))/2-1;
a = iniInt(1);
b = iniInt(2);

l = a+(1-phi)*(b-a);
u = a + phi*(b-a);

fl = f(l);
fu = f(u);
k = 1;

while b-a > tol
    if fl > fu
        a = l;
        l = u;
        u = a+phi*(b-a);
        fl = fu;
        fu = f(u);
    else
        b = u;
        u = l;
        l = a+(1-phi)*(b-a);
        fu = fl;
        fl = f(l);
    end
    k = k+1;
end

stepSize = (a+b)/2;
