function D2 = pres(Lp,C,W,p)
q = p/(p-1);
D2 = Lp*0;
for current_pos=1:size(Lp,1)
    currLp = Lp(:,current_pos) .* ones(size(Lp,1),size(Lp,2));
    tmp = W.*abs(C*(currLp - Lp)).^q;
    n = sum(abs(tmp));
    D2(current_pos,:) = n';
end
end