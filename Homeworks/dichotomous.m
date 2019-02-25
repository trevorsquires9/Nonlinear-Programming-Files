%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DICHOTOMOUS.m
%
% DESCRIPTION
%   Performs exact linesearch via dichotomous search
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   f - function of direction to search
%   iniInt - initial interval of uncertainty
%   tol - tolerance for quitting
%   epsilon - distinguishability constant
%
% OUTPUT
%   finalInt - final interval of uncertainty
%   funcEval - number of function calls
%
% NOTES
%  
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [finalInt,funcEval] = dichotomous(f, iniInt,tol,epsilon)


a = iniInt(1);
b = iniInt(2);
funcEval = 0;

while b-a > tol
    lambda = (a+b)/2 - epsilon; %compute new points
    mu = (a+b)/2 + epsilon;  
    if f(lambda) < f (mu)
        b = mu;
    else
        a = lambda;
    end
    funcEval = funcEval+2;
end

finalInt = [a,b];
