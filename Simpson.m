function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
if length(x)~=length(y)
    error('independent variable and function values must be the same size')
end
if range(x(2:end)-x(1:end-1))~=0
    error('the variable x must have uniform spacing')
end
[a,~]= size(x);
[c,~]= size(y);
if a~=1 || c~=1
    error('Arrays must be one dimensional')
end
I=0;
n=length(x)-1;
if n==1
    h=(x(end)-x(1));
    warning('the trap rule is being applied')
    I=h*(y(1)+y(end))/2;
end
if n>1  
    if rem(n,2)~=0
        warning('a trap rule will be applied at the end')
        tx=[x(end-1) x(end)];
        ty=[y(end-1) y(end)];
        th=tx(2)-tx(1);
        bx=x;
        by=y;
        bx(end)= [];
        by(end)= [];
        n=length(bx)-1;
        disp(length(bx))
        e=bx(1);
        f=bx(end);
        h=(f-e);
        for j= 0:length(bx)-1
            k=j+1;
            if j==0
                I=I+by(k);
            end
            if j==(length(bx)-1)
                I=(((I+by(k))*h/(3*(n)))+(th*(ty(1)+ty(2))/2));
                break
            end   
            if j>=1
                if rem(j/2,1)~=0
                    I=I+4*by(k);
                end
                if rem(j/2,1)==0
                    I=I+2*by(k);
                end
            end
        end
    elseif rem(n,1)==0
        e=x(end);
        f=x(1);
        h=(e-f);
        for j= 0:length(x)-1
            k=j+1;
            if j==0
                I=I+y(k);
            end
            if j==(length(x)-1)
                I=((I+y(k))*h/(3*(n)));
                break
            end        
            if j>=1
                 if rem(j/2,1)~=0
                     I=I+4*y(k);
                 end
                if rem(j/2,1)==0
                    I=I+2*y(k);
                end
            end
        end
    end
end
