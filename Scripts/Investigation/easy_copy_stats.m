% A1 = [[mean(Carry_OLD_duration_control),sem(Carry_OLD_duration_control)];...
%     [mean(Carry_NEW_duration_control),sem(Carry_NEW_duration_control)];...
%     [mean(Carry_OLD_duration_Exc),sem(Carry_OLD_duration_Exc)];...
%    [ mean(Carry_NEW_duration_Exc),sem(Carry_NEW_duration_Exc)]]

[p0,h,stats0] = signrank(Carry_OLD_duration_Exc,Carry_NEW_duration_Exc);
[p1,h,stats1] = ranksum(Carry_OLD_duration_control,Carry_OLD_duration_Exc);
[p2,h,stats2] = ranksum(Carry_NEW_duration_control,Carry_NEW_duration_Exc);

p0*3,stats0.signedrank
p1*3,stats1.ranksum
p2*3,stats2.ranksum