%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GOLDENSECTION.m
%
% DESCRIPTION
%   Performs exact linesearch via golden section
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   f - function of direction to search
%   iniInt - initial interval of uncertainty
%   tol - tolerance for quitting
%
% OUTPUT
%   finalInt - final interval of uncertainty
%   funcEval - number of function calls
%
% NOTES
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [finalInt,funcEval] = goldenSection(f, iniInt,tol)

% Initialization 
phi = (1+sqrt(5))/2-1;
a = iniInt(1);
b = iniInt(2);

% Evaluate new points
l = a+(1-phi)*(b-a);
u = a + phi*(b-a);

fl = f(l);
fu = f(u);
funcEval = 2;

while b-a > tol
    if fl > fu %determine which point to replace
        a = l;
        l = u;
        u = a+phi*(b-a); %find new point
        fl = fu; %reuse function evaluations
        fu = f(u); 
    else
        b = u;
        u = l;
        l = a+(1-phi)*(b-a);
        fu = fl;
        fl = f(l);
    end
    funcEval = funcEval+1;
end

finalInt = [a,b];
