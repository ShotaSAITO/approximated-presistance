function [A,Y,X] = ion_datasets(c,k)

load 'ionosphere.mat';
YY = zeros(1,length(Y));
for i =1:length(Y)
    if strcmp(Y(i),'g')
        YY(i) = 1;
    else
        YY(i) = 2;
    end
end

Y = YY';
X(:,2) = [];
X = (X - sum(X,1)/size(X,1));
nsq=sum(X.^2,2);
K=bsxfun(@minus,nsq,(2*X)*X.');
K=bsxfun(@plus,nsq.',K);
K = (K + K')/2;
A=exp(-c*K);
A = (A + A')/2;
A=A-diag(diag(A));


n = size(X,1);
portion = floor(n*k/100);

B = zeros(size(A,1),size(A,2));

[~,I] = maxk(A,portion);
for i = 1:size(I,2)
    B(I(:,i),i) = A(I(:,i),i);
    B(i,I(:,i)) = A(I(:,i),i);
end

A = B;

end