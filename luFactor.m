function [L, U, P] = luFactor(A)
% This function computes the LU decomposition of a matrix.
%Inputs: 'a' square matrix
%Outputs: lower and upper triangular matrices and a pivot matrix
plz=ismatrix(A);
if plz == 0
    error('A needs to be a matrix')
end
[m,n]=size(A);
if m~=n
    error ('matrix must be square')
end
L= eye(length(A));
P=L;
for i= 1:m
    [~,loc]= max(abs(A(i:m,i)));
    loc=loc+i-1;
    if loc~=i
        temp=A(i,:);
        A(i,:)=A(loc,:);
        A(loc,:)=temp;
        ptemp=P(i,:);
        P(i,:)=P(loc,:);
        P(loc,:)=ptemp; 
        if i>=2
            templ=L(i,1:i-1);
            L(i,1:i-1)=L(loc,1:i-1);
            L(loc,1:i-1)=templ;
        end
    end
    for j= i+1:m
        factor= (A(j,i))/(A(i,i));
        L(j,i)=factor;
        A(j,:)= (A(j,:))-(factor.*(A(i,:)));
    end
end
U=A;
end