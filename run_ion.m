
p = 5;
sigma = 10^(-3); %gaussian parameter
kk = 4; % the number of neighbors of k-NN graph


[A,Y,X] = ion_datasets(sigma,kk);
L = diag(sum(A)) - A;
Lp = pinv(L);
G = graph(A);
C = incidence(G)';
W = G.Edges.Weight;

%obtain the number of the clusters
k = max(Y);

%compose the distance matrix via approximated p-resistance
dist = @(ZI,ZJ)pnormdist(ZI,ZJ,C,W,p);
D2 = pres(Lp,C,W,p);

%conducting kmedoids
idx = kmedoids((1:size(Lp,1))', k, 'Distance', @(ZI, ZJ) D2(ZJ, ZI));

%computing error
err = 1 - AccMeasure(Y,idx)/100;

fprintf('k:%d,sigma:%f,p%f,err:%f\n',kk,sigma,p,err)
