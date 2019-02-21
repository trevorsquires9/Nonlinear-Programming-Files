clear
clc
close all;

%% Constants
param.eps = 1e-8;
param.itCount = 1000;
param.verbose = true;
GoldenCalls = zeros(1,13);

%% Test #4 - min f(x) = (x_1 - 2)^4 + (x_1 - 2x_2)^2 using Golden Search
f = @(x) (x(1)-2)^4 + (x(1) - 2*x(2))^2;
gradf = @(x) [-4*(x(1)-2)^3 + 2*(x(1)-2*x(2)); 4*(x(1)-2*x(2))];
x0 = [0;3];
exponents = -1:-1:-13;
for i = 1:length(exponents)
    param.getStepSize = @(y,d) goldenSection(@(x) f(y+d*x),10^exponents(i),[0,8]);

    [~,output] = funcMin(f,gradf,x0,param);
    GoldenCalls(i) = output.funcCalls;
    semilogy(0:output.it-1, output.objVal)
    hold on 
    %number of calls greatly depends on tolerance of search
end
title('Objective Values of Iterates by Golden Section')
xlabel('Iteration')
ylabel('Function Value')
legend

%% Test #5 - min f(x) = (x_1 - 2)^4 + (x_1 - 2x_2)^2 using Armijo's Rule
f = @(x) (x(1)-2)^4 + (x(1) - 2*x(2))^2;
gradf = @(x) [4*(x(1)-2)^3 + 2*(x(1)-2*x(2)); -4*(x(1)-2*x(2))];
getDirection = @(x) -1*gradf(x);
thetaGrad = @(x,y,d) d'*[4*(y(1)+x(1)*d(1)-2)^3+2*(y(1)+x(1)*d(1)-2*y(2)-2*x(2)*d(2));-4*(y(1)+x(1)*d(1)- 2*y(2) - 2*x(2)*d(2))];
x0 = [0;3];

param.getStepSize = @(y,d) armijoRule(@(x) f(y+x*d),@(x) thetaGrad(x,y,d),0.2,7,2); 

[solu,output] = funcMin(f,getDirection,x0,param);
ArmijoCalls = output.funcCalls;
figure();
semilogy(0:output.it-1, output.objVal)
title('Objective Values of Iterates by Armijo''s Rule')
xlabel('Iteration')
ylabel('Function Value')

%% Plotting
figure();
scatter(GoldenCalls,zeros(1,13),'ro')
hold on
scatter(ArmijoCalls,0,'b*')

