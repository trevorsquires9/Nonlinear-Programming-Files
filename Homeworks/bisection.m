%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BISECTION.m
%
% DESCRIPTION
%   Minimizes f(x)/gradf based on bisection method
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   gradf - function handle of gradient
%   iniInt - initial interval of uncertainty
%   tol - tolerance for quitting
%
% OUTPUT
%   flag 
%       1 - if output is interval of uncertainty
%       0 - if output is an optimal solution
%   output - solution based on exit status
%   it - number of iterations executed
%
% NOTES
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [flag,output,it] = bisection(gradf, iniInt, tol)

a = iniInt(1);
b = iniInt(2);
c = (a+b)/2;
gradfc = gradf(c);
it = 0;

while b-a > tol && gradfc ~= 0  
    if gradfc < 0 %decide which point to replace
        a = c;
    else
        b = c;
    end
    c = (a+b)/2; %compute new point
    gradfc = gradf(c);
    it = it+1;
end
if gradfc == 0
    flag = 0;
    output = c;
else
    flag = 1;
    output = [a,b];
end



end

