% paired ttest for heatmaps

for q =1:6
for w = 1:6
[h,p] = ttest2(GAD2m.NEW(q,w,:),TAC1m.NEW(q,w,:));
P(q,w) = p;
end
end
figure; imagesc(P<0.05)