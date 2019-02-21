%% Test #4 - min f(x) = (x_1 - 2)^4 + (x_1 - 2x_2)^2 using Golden Search
f = @(x) (x(1)-2)^4 + (x(1) - 2*x(2))^2;
gradf = @(x) [-4*(x(1)-2)^3 + 2*(x(1)-2*x(2)); 4*(x(1)-2*x(2))];
x0 = [0;3];
param.eps = 1e-10;
param.getStepSize = @(y,d) goldenSection(@(x) f(y+d*x),1e-8,[0,8]); 
param.itCount = 1000;
param.verbose = true;

[solu,output] = funcMin(f,gradf,x0,param);
figure();
semilogy(0:output.it-1, output.objVal)
