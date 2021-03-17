% GAD2 ChR2 Social
ss = [S(2).Social S(5).Social S(6).Social S(10).Social];
% GAD2 stACR2 Social
ss = [S(1).Social S(7).Social S(9).Social];

% GAD2 control Social
ss = [S(3).Social S(4).Social S(8).Social S(11).Social];



[m,mavg,P] = BehaviorHeatMap_Social_NewJAABA(ss,4);
% save('GAD2_ChR2_HeatMap_NovOld','m')
% save('GAD2_ChR2_HeatMap_NovOld_Avg','mavg')
% save('GAD2_ChR2_HeatMap_NovOld_Pvalues','P')
