% MATH:8110 Spring 2019 
% Homework 3, Question 3

clear;
clc;

f = @(x)(x^2 + 2*x);    % Function to be minimized
iniInt = [-3, 6];       % Initial interval of uncertainty
tol = 1e-8;             % allowable length of uncertainty
distConst = 1e-10;      % Distinguishability constant


[dicho.finalInt,dicho.funcEval] = dichotomous(f,iniInt,tol,distConst);
[golden.finalInt,golden.funcEval] = goldenSection(f,iniInt,tol);
% Output of your functions: 
%   finalInt - final interval of uncertainty as a 2-d vector [a, b]
%   funcEval - # of function evaluations performed


dicho
golden