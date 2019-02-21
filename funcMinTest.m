clear
clc
close all;

%% Test #1 - min f(x) = x^2 with constant step size
f = @(x) x.^2;
negGradf = @(x) -2.*x;
x0 = 4;
param.eps = 1e-10;
param.lambda = 1e-2;
param.itCount = 1000;
param.verbose = true;

[solu,output] = funcMin(f,negGradf,x0,param);

figure();
semilogy(0:output.it-1, output.objVal)


%% Test #2 - min f(x) = x^2 with exact step size using Golden Section method
f = @(x) x.^2;
gradf = @(x) -2.*x;
x0 = 4;
param.eps = 1e-10;
param.getStepSize = @(y,d) goldenSection(@(x) f(y+d*x),0.5,[0,4]); %test different tols
param.itCount = 1000;
param.verbose = true;

[solu,output] = funcMin(f,gradf,x0,param);
figure();
semilogy(0:output.it-1, output.objVal)

%% Test #3 - min f(x) = x^2 with inexact step using Armijo's Rule
f = @(x) x.^2;
gradf = @(x) -2.*x;
x0 = 4;
param.eps = 1e-10;
param.getStepSize = @(y,d) armijoRule(@(x) f(y+x*d), @(x) 2*(y+d*x)*d,0.2,7,1); 
param.itCount = 1000;
param.verbose = true;

[solu,output] = funcMin(f,gradf,x0,param);
figure();
semilogy(0:output.it-1, output.objVal)


%% Test #4 - min f(x) = (x_1 - 2)^4 + (x_1 - 2x_2)^2 using Golden Search
f = @(x) (x(1)-2)^4 + (x(1) - 2*x(2))^2;
gradf = @(x) [-4*(x(1)-2)^3 + 2*(x(1)-2*x(2)); 4*(x(1)-2*x(2))];
x0 = [0;3];
param.eps = 1e-5;
param.getStepSize = @(y,d) goldenSection(@(x) f(y+d*x),1e-3,[0,8]); 
param.itCount = 1000;
param.verbose = true;

[solu,output] = funcMin(f,gradf,x0,param);
figure();
semilogy(0:output.it-1, output.objVal)


%% Test #5 - min f(x) = (x_1 - 2)^4 + (x_1 - 2x_2)^2 using Armijo's Rule
f = @(x) (x(1)-2)^4 + (x(1) - 2*x(2))^2;
gradf = @(x) [4*(x(1)-2)^3 + 2*(x(1)-2*x(2)); -4*(x(1)-2*x(2))];
getDirection = @(x) -1*gradf(x);
thetaGrad = @(x,y,d) d'*[4*(y(1)+x(1)*d(1)-2)^3+2*(y(1)+x(1)*d(1)-2*y(2)-2*x(2)*d(2));-4*(y(1)+x(1)*d(1)- 2*y(2) - 2*x(2)*d(2))];
x0 = [0;3];
param.eps = 1e-5;

param.getStepSize = @(y,d) armijoRule(@(x) f(y+x*d),@(x) thetaGrad(x,y,d),0.2,7,2); 

param.itCount = 1000;
param.verbose = true;

[solu,output] = funcMin(f,getDirection,x0,param);
figure();
semilogy(0:output.it-1, output.objVal)

