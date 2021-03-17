for q =1:4
for w = 1:4
[h,p] = ttest2(CHR2m.EARLY(q,w,:),CONTm.EARLY(q,w,:));
P(q,w) = p;
end
end
figure; imagesc(P<0.05)

for q =1:4
for w = 1:4
[h,p] = ttest2(CHR2m.LATE(q,w,:),CONTm.LATE(q,w,:));
P(q,w) = p;
end
end
figure; imagesc(P<0.05)