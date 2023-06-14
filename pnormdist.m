function D2 = pnormdist_c(ZI,ZJ,C,W,p)
q = p/(p-1);
%Wq = W.^(1/q);
ZII = ZI .* ones(size(ZJ,1),size(ZJ,2));
D2 = sum(sum(W .* abs(C*(ZII - ZJ)').^q));
%D2 = sum(sum(abs(ZII - ZJ).^q).^(1/q));
end