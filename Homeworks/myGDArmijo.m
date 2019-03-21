%%%%%%%%%%%%%%%%%%%%%%%%%%%
% gradDescent.m
%
% DESCRIPTION
%   Minimizes a function using gradient descent
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   f - function of direction to search
%   gradf - gradient of function to minimizes
%   tol - tolerance for quitting
%   x0 - initial point
%   armijoParams - parameters to run armijo's line search
%   maxIter - cap on iterations
%
% OUTPUT
%   it - number of iterations
%   xk - vector of iterative points
%   fxk - function values of vec_x
%   alphak - vector of step sizes accepted
%   gradfxk - gradients at xk of f
%   normGrad - norms of gradfxk
%
%
% NOTES
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [x,it,xk,fxk,alphak, gradfxk, normGrad] = myGDArmijo(f,gradf,scale,tol,x0,armijoParams,maxIter)

%% Initialization
n = length(x0);
xk = zeros(n,maxIter);
fxk = zeros(1,maxIter);
alphak = zeros(1,maxIter);
gradfxk = zeros(n,maxIter);
normGrad = zeros(1,maxIter);


c = defaultField(armijoParams,'c',0.001);
rho = defaultField(armijoParams,'rho',0.001);
alphaMax = defaultField(armijoParams,'alphaMax',0.001);

%% Step 0
xk(:,1) = x0;
fxk(1) = f(xk(:,1));
gradfxk(:,1) = gradf(xk(:,1));
normGrad(1) = norm(gradfxk(:,1),2);
it = 1;

%% Looping
while it <= maxIter && normGrad(it) > tol
    
    %% Armijo's Rule for steepest descent
    theta = @(lambda) f(xk(:,it)+lambda*(scale*scale')*(-gradfxk(:,it)));
    thetaGrad0 = - (((scale*scale')*(gradfxk(:,it)))'*gradfxk(:,it));
    thetaHat = @(lambda) theta(0) + lambda*c*thetaGrad0;
    stepSize = alphaMax;
    while theta(stepSize) <= thetaHat(stepSize)
        stepSize = stepSize/rho;
    end
    while theta(stepSize) > thetaHat(stepSize)
        stepSize = stepSize*rho;
    end
    alphak(it) = stepSize;
    
    xk(:,it+1) = xk(:,it) - alphak(it)*(scale*scale')*gradfxk(:,it); %update xk+1
    fxk(it+1) = f(xk(:,it+1)); %and other parameters
    gradfxk(:,it+1) = gradf(xk(:,it+1));
    normGrad(it+1) = norm(gradfxk(:,it+1),2);
    it = it+1;
    
end
x = xk(:,it);
xk = xk(:,1:it);
fxk = fxk(:,1:it);
gradfxk = gradfxk(:,1:it);
normGrad = normGrad(:,1:it);
