function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
%Inputs: 
% func= function being evaluated
% xl = lower bound
% xu = upper bound
% es = stopping criterion
% maxit = maximum iterations
%Outputs:
% root = location of root
% f(x) = value of f(x) at the location of the root
% ea= approximate error
% iter= number of iterations
if nargin <4
    es=.0001;
    maxit=200;
end
if nargin<5
    maxit=200;
end
iter=0;
xrl=xl;
ea= 100;
while (ea)>es && iter<maxit 
    iter=iter+1;
    if func(xl)*func(xu)>=0
        if func(xl)*func(xu)==0
            if func(xl)==0
                root=(xl);
                fx=func(xl);
                fprintf ('root, fx, ea, iter')
                break
            else
                root=(xu);
                fx=func(xu);
                fprintf ('root, fx, ea, iter')
                break
            end
        else
            error('does not bracket')
        end
    else
        xr=(xl)-(func(xl)*(xu-xl)/(func(xu)-func(xl)));
        if (xr)==0
                ea=0;
        else
             ea= abs(((xr-xrl)/(xr))*100);
        end
        xrl=xr;
        if func(xr)==0
            ea=0;
            root=(xr);
            fx=func(xr);
            fprintf ('root, fx, ea, iter')
            break
        end
        if func(xu)*func(xr)>0
            xu=xr;
        else
            xl=xr;
        end
    end
end
if ea<es
    root=xr;
    fx=func(xr);
    fprintf ('root, fx, ea, iter')
end    
if iter==maxit
    root=xr;
    fx=func(xr);
    fprintf ('root, fx, ea, iter')
end
if ea<es
    root=xr;
    fx=func(xr);
    fprintf ('root, fx, ea, iter')
end
end
