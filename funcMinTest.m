clear
clc
close all;

%% Test #1 - min f(x) = x^2 with constant step size
f = @(x) x.^2;
gradf = @(x) -2.*x;
x0 = 4;
param.eps = 1e-10;
param.lambda = 1e-2;
param.itCount = 1000;
param.verbose = true;

[solu,output] = funcMin(f,gradf,x0,param);
figure();
plot(1:output.it,output.iterates)
hold on
plot(1:output.it, output.objVal)
hold off

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

%% Test #3 - min f(x) = x^2 with inexact step using Armijo's Rule
f = @(x) x.^2;
gradf = @(x) -2.*x;
x0 = 4;
param.eps = 1e-10;
param.getStepSize = @(y) armijoRule(@(x) f(y+x*gradf(y)), @(x) 2*(y+gradf(y)*x)*gradf(y),0.2,7); 
param.itCount = 1000;
param.verbose = true;

[solu,output] = funcMin(f,gradf,x0,param);
figure();
plot(1:output.it,output.iterates)
hold on
plot(1:output.it, output.objVal)
hold off

%% Test #4 - min f(x) = (x_1 - 2)^4 + (x_1 - 2x_2)^2 using Golden Search
f = @(x) (x(1)-2)^4 + (x(1) - 2*x(2))^2;
gradf = @(x) [-4*(x(1)-2)^3 + 2*(x(1)-2*x(2)); 4*(x(1)-2*x(2))];
x0 = [0;3];
param.eps = 1e-10;
param.getStepSize = @(y) goldenSection(@(x) f(y+gradf(y)*x),1e-8,[0,8]); 
param.itCount = 20;
param.verbose = true;

[solu,output] = funcMin(f,gradf,x0,param);
figure();
loglog(1:output.it, output.objVal)

