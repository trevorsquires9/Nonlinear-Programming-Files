%% Test #2 - min f(x) = x^2 with exact step size using Golden Section method
f = @(x) x.^2;
gradf = @(x) -2.*x;
x0 = 4;
param.eps = 1e-10;
param.getStepSize = @(y) goldenSection(@(x) f(y+gradf(y)*x),0.5,[0,4]); %test different tols
param.itCount = 1000;
param.verbose = true;

[solu,output] = funcMin(f,gradf,x0,param);
figure();
plot(1:output.it,output.iterates)
hold on
plot(1:output.it, output.objVal)
hold off