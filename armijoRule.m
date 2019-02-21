function [stepSize,calls] = armijoRule(theta, thetaGrad, eps, stepSize,dim)
theta0 = thetaGrad(zeros(dim,1));

thetaBar = @(y) theta(0) + y*eps*theta0;
thetaPt = theta(stepSize);
thetaBarPt = thetaBar(stepSize);
calls = 2;

if thetaPt <= thetaBarPt
    while thetaPt <= thetaBarPt
        stepSize = stepSize*2;
        thetaPt = theta(stepSize);
        thetaBarPt = thetaBar(stepSize);
        calls = calls+2;
    end
    stepSize = stepSize/2;
else
    while thetaPt > thetaBarPt
        stepSize = stepSize/2;
        thetaPt = theta(stepSize);
        thetaBarPt = thetaBar(stepSize);
        calls = calls+2;
    end
end
