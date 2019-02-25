% Test function f'' for HW3Q5.
% f(x) = x.^3.*(4-3*x), if x >= 0
%        x.^3.*(4+3*x), if x < 0

function y = hessf(x)

if x >= 0
    y = 12*x.*(2-3*x);
else
    y = 12*x.*(2+3*x);
end