function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination
if length(x)~=length(y)
    error ('arrays must be same size')
end
[sortedY, sortOrder]= sort(y);
sortedX= x(sortOrder);
n=length(y);
qone= floor((n+1)/4);
qthree= floor(((3*n)+3)/4);
Q1= sortedY(qone);
Q3= sortedY(qthree);
IQR=Q3-Q1;
fX=sortedX;
fY=sortedY;
for i=n:-1:1
    if (sortedY(i)*1.5*IQR)<Q1
        fY(i)= [];
        fX(i)= [];
    elseif (sortedY(i)*1.5*IQR)>Q3
        fY(i)= [];
        fX(i)= [];
    end  
end
m=length(fY);
ymean= (1/m)*sum(fY);
xmean= (1/m)*sum(fX);
slope= ((m*sum(fX.*fY))-sum(fX)*sum(fY))/(m*sum(fX.^2)-(sum(fX))^2);
intercept=ymean-slope*xmean;
fofx= intercept+slope.*(fX);
sstot=0;
for j=1:length(fX)
    b=((fY(j)-ymean)^2);
    sstot=sstot+b;
ssres=0;
end
for k=1:length(fX)
    a=((fY(k)-fofx(k))^2);
    ssres=ssres+a;
end
Rsquared=1-(ssres/sstot);
end
