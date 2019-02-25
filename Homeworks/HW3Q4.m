% MATH:8110 Spring 2019 
% Homework 3, Question 4

clear;
clc;

f = @(x)(x^2 + 2*x);      % Function to be minimized
gradf = @(x)(2*x + 2);    % Derivative function
iniInt = [-3, 6];         % Initial interval of uncertainty
tol = 1e-8;               % Allowable length of uncertainty


[bisec.flag,bisec.output,bisec.iter] = bisection(f,gradf,iniInt,tol);
% Output of your function: 
%   flag - 1, if output is interval of uncertainty;
%          0, if output is an optimal solution
%   output - final interval of uncertainty as a 2-d vector [a, b] or
%            an optimal solution
%   iter - # of iterations


bisec
