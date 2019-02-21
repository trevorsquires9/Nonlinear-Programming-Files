function [stepSize] = armijoRule(theta, thetaGrad, eps, stepSize)
theta0 = thetaGrad(0);

thetaBar = @(y) theta(0) + y*eps*theta0;
thetaPt = theta(stepSize);
thetaBarPt = thetaBar(stepSize);

if thetaPt <= thetaBarPt
    while thetaPt <= thetaBarPt
        stepSize = stepSize*2;
        thetaPt = theta(stepSize);
        thetaBarPt = thetaBar(stepSize);
    end
    stepSize = stepSize/2;
else
    while thetaPt > thetaBarPt
        stepSize = stepSize/2;
        thetaPt = theta(stepSize);
        thetaBarPt = thetaBar(stepSize);
    end
    stepSize = stepSize*2;
end
