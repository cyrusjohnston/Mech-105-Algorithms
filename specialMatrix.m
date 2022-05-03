function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
c='specialMatrix';
b=nargin(c);
if b~=2
    error('No, please, 2 inputs, for the love of god')
end
A = zeros(n,m);
A(:,1)=(1:n);
A(1,:)=(1:m);
for i= 2:n
    for j= 2:m
    A(i,j)= A((i-1),j)+A(i,(j-1));
    end
end
end