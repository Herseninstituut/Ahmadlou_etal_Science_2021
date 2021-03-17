hold on

set(gcf,'color','w')



[r,c] = find(isnan(P)==1);
c = c-.5;
r = (r-.5)*-1;

scatter(c,r,'x','k')