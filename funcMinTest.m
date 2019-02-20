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

%% Test #2 - min f(x) = x^2 with exact step size using Dichotomas method
f = @(x) x.^2;
gradf = @(x) -2.*x;
x0 = 4;
param.eps = 1e-10;
param.getStepSize = @bisectSearch;
param.itCount = 1000;
param.verbose = true;

[solu,output] = funcMin(f,gradf,x0,param);