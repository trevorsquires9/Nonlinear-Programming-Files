% MATH:8110 Spring 2019
% Homework 3, Question 5
% Run with gradf.m and hessf.m

clear;
clc;

tol = 1e-10;    % Tolerance such that |f'(sol)| < tol
maxIter = 100;   % Max # of iterations (in case of divergence)

%% Test 1

x0 = 0.4;   % Starting point

[newton1.flag,newton1.sol,newton1.iter] = newton(@gradf,@hessf,tol,x0,maxIter);
% Output of your functions: 
%   flag - 1,  if exits normally;
%        - 0,  if maxIter reached but |f'(sol)| >= tol;
%        - -1, if invertible Hessian observed
%   sol - approximated solution with |f'(sol)| < tol (if flag == 1)
%   iter - # of iterations

newton1

%% Test 2

x0 = 0.6;     % Starting point

% g = x.^4/4 - x.^2 + 2.*x;
gradg = @(x) x.^3 - 2.*x + 2;
hessg = @(x) 3*x.^2 - 2;

[newton2.flag,newton2.sol,newton2.iter] = newton(@gradf,@hessf,tol,x0,maxIter);

newton2

%% Test 3

x0 = 2/3;

[newton3.flag,newton3.sol,newton3.iter] = newton(@gradf,@hessf,tol,x0,maxIter);

newton3
