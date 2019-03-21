%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NEWTON.m
%
% DESCRIPTION
%   Minimizes f(x) via Newton's method
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   gradf - function handle of gradient
%   hessf - function handle of hessian
%   tol - tolerance for quitting
%   x0 - initial point
%   maxIt - maximum iterations to executed
%
% OUTPUT
%   flag
%      1 - if exits normally;
%      0 - if maxIter reached but |f'(sol)| >= tol;
%     -1 - if invertible Hessian observed
%   output - solution based on exit status
%   it - number of iterations executed
%
% NOTES
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [flag,solu,it] = newton(gradf, hessf,tol,x0,maxIt)

x = x0;
flag = 0;

for it = 1:maxIt
    gradfx = gradf(x);
    if abs(gradfx) < tol %exit condition 1
        flag = 1;
        break;
    end
    hessfx = hessf(x);
    if det(hessfx) < tol %exit condition 2
        flag = -1;
        break;
    end
    x = x-(hessfx\gradfx); %newtons next point
end
solu = x;
