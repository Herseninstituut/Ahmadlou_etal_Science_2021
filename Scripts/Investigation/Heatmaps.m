% Heatmaps
load('\\vs01\csf_data\Shared\InVivo\Experiments\JAABA_analysis\SessionUpdates\Session_Object_Social_26032020.mat');

% GAD2 ChR2 NovOld
ss = [S(16).NovelObject.NovOld S(17).NovelObject.NovOld S(18).NovelObject.NovOld S(19).NovelObject.NovOld S(20).NovelObject.NovOld S(21).NovelObject.NovOld S(22).NovelObject.NovOld];
[m,mavg,P] = BehaviorHeatMap(ss,0,0);
save('GAD2_ChR2_HeatMap_NovOld','m')
save('GAD2_ChR2_HeatMap_NovOld_Avg','mavg')
save('GAD2_ChR2_HeatMap_NovOld_Pvalues','P')
Graph_Object_Investigation(nanmean(m.NEW,3),nanmean(m.OLD,3),0.1) % just to plot the nanmedian graph
Graph_Object_Investigation(mavg.NEW,mavg.OLD,0.1) 
Pnew = squeeze(m.NEW(2,3,:)); % sniff to bite transiency New object
Pold = squeeze(m.OLD(2,3,:)); % sniff to bite transiency Old object
Pnew(isnan(Pold))=NaN;
Pold(isnan(Pnew))=NaN;
ivt_graph({Pold,Pnew},[],'xticklabels',{'Familiar','Novel'},'showpoints',0,'errorbars','sem','test','signrank','showpairing',true,'markersize',10)
ylabel('Sniff-Bite Transiency','FontSize',24)
box off
set(gcf,'color','white')

% GAD2 ChR2 FoodOld
ss = [S(13).NovelObject.FoodOld S(14).NovelObject.FoodOld S(15).NovelObject.FoodOld S(16).NovelObject.FoodOld S(17).NovelObject.FoodOld S(18).NovelObject.FoodOld S(19).NovelObject.FoodOld];
[m,mavg,P] = BehaviorHeatMap(ss,0,0);
save('GAD2_ChR2_HeatMap_FoodOld','m')
save('GAD2_ChR2_HeatMap_FoodOld_Avg','mavg')
save('GAD2_ChR2_HeatMap_FoodOld_Pvalues','P')

% GAD2 ChR2 dCricOld
ss = [S(13).NovelObject.dCricOld S(14).NovelObject.dCricOld S(15).NovelObject.dCricOld S(16).NovelObject.dCricOld S(17).NovelObject.dCricOld S(18).NovelObject.dCricOld S(19).NovelObject.dCricOld];
[m,mavg,P] = BehaviorHeatMap(ss,0,0);
save('GAD2_ChR2_HeatMap_dCricOld','m')
save('GAD2_ChR2_HeatMap_dCricOld_Avg','mavg')
save('GAD2_ChR2_HeatMap_dCricOld_Pvalues','P')

% GAD2 ChR2 aCricOld
ss = [S(13).NovelObject.aCricOld S(14).NovelObject.aCricOld S(16).NovelObject.aCricOld S(17).NovelObject.aCricOld S(18).NovelObject.aCricOld S(19).NovelObject.aCricOld];
[m,mavg,P] = BehaviorHeatMap(ss,0,0);
save('GAD2_ChR2_HeatMap_aCricOld','m')
save('GAD2_ChR2_HeatMap_aCricOld_Avg','mavg')
save('GAD2_ChR2_HeatMap_aCricOld_Pvalues','P')

% GAD2 ChR2 FourOld
ss = [S(16).NovelObject.FourOld S(17).NovelObject.FourOld S(19).NovelObject.FourOld S(20).NovelObject.FourOld S(21).NovelObject.FourOld S(22).NovelObject.FourOld];
[m,mavg,P] = BehaviorHeatMap(ss,0,0);
save('GAD2_ChR2_HeatMap_FourOld','m')
save('GAD2_ChR2_HeatMap_FourOld_Avg','mavg')
save('GAD2_ChR2_HeatMap_FourOld_Pvalues','P')

% GAD2 ChR2 MovStat
ss = [S(13).NovelObject.MovStat S(14).NovelObject.MovStat S(16).NovelObject.MovStat S(17).NovelObject.MovStat S(18).NovelObject.MovStat S(19).NovelObject.MovStat];
[m,mavg,P] = BehaviorHeatMap(ss,0,0);
save('GAD2_ChR2_HeatMap_MovStat','m')
save('GAD2_ChR2_HeatMap_MovStat_Avg','mavg')
save('GAD2_ChR2_HeatMap_MovStat_Pvalues','P')

% B6 NovOld
ss = [S(1).NovelObject.NovOld S(2).NovelObject.NovOld S(3).NovelObject.NovOld S(4).NovelObject.NovOld S(5).NovelObject.NovOld S(6).NovelObject.NovOld S(7).NovelObject.NovOld S(8).NovelObject.NovOld];
[m,mavg,P] = BehaviorHeatMap(ss,0,0);
Pnew = squeeze(m.NEW(2,3,:)); % sniff to bite transiency New object
Pold = squeeze(m.OLD(2,3,:)); % sniff to bite transiency Old object
Pnew(isnan(Pold))=NaN;
Pold(isnan(Pnew))=NaN;
ivt_graph({Pold,Pnew},[],'xticklabels',{'Familiar','Novel'},'showpoints',0,'errorbars','sem','test','signrank','showpairing',true,'markersize',10)
ylabel('Sniff-Bite Transiency','FontSize',24)
box off
set(gcf,'color','white')

% save('BL6_HeatMap_NovOld','m')
% save('BL6_HeatMap_NovOld_Avg','mavg')
% save('BL6_HeatMap_NovOld_Pvalues','P')
% Graph_Object_Investigation(m.NEW,m.OLD,0.05) % just to plot the nanmedian graph
% Graph_Object_Investigation(mavg.NEW,mavg.OLD,0.0) 


% GAD2 stACR2 NovOld
ss = [S(23).NovelObject.NovOld S(24).NovelObject.NovOld S(25).NovelObject.NovOld S(26).NovelObject.NovOld ...
     S(97).NovelObject.NovOld S(98).NovelObject.NovOld S(99).NovelObject.NovOld];
[m,mavg,P] = BehaviorHeatMap(ss,0,1);
% save('GAD2_stACR2_HeatMap_NovOld','m')
% save('GAD2_stACR2_HeatMap_NovOld_Avg','mavg')
% save('GAD2_stACR2_HeatMap_NovOld_Pvalues','P')
Pnew = squeeze(m.NEW(2,3,:)); % sniff to bite transiency New object
Pold = squeeze(m.OLD(2,3,:)); % sniff to bite transiency Old object
Pnew(isnan(Pold))=NaN;
Pold(isnan(Pnew))=NaN;
ivt_graph({Pold,Pnew},[],'xticklabels',{'Familiar','Novel'},'showpoints',0,'errorbars','sem','test','signrank','showpairing',true,'markersize',10)
ylabel('Sniff-Bite Transiency','FontSize',24)
box off
set(gcf,'color','white')




% GAD2 Control FoodOld
ss = [S(9).NovelObject.FoodOld S(10).NovelObject.FoodOld S(11).NovelObject.FoodOld];
[m,mavg,P] = BehaviorHeatMap(ss,0,0);
save('GAD2_Control_HeatMap_FoodOld','m')
save('GAD2_Control_HeatMap_FoodOld_Avg','mavg')
save('GAD2_Control_HeatMap_FoodOld_Pvalues','P')

% GAD2 Control NovOld
ss = [S(9).NovelObject.NovOld S(10).NovelObject.NovOld S(11).NovelObject.NovOld S(12).NovelObject.NovOld];
[m,mavg,P] = BehaviorHeatMap(ss,0,0);
save('GAD2_Control_HeatMap_NovOld','m')
save('GAD2_Control_HeatMap_NovOld_Avg','mavg')
save('GAD2_Control_HeatMap_NovOld_Pvalues','P')
Graph_Object_Investigation(m.NEW,m.OLD,0.1) % just to plot the nanmedian graph
Graph_Object_Investigation(mavg.NEW,mavg.OLD,0.1) 


% GAD2 Control dCricOld
ss = [S(9).NovelObject.dCricOld S(10).NovelObject.dCricOld S(11).NovelObject.dCricOld];
[m,mavg,P] = BehaviorHeatMap(ss,0,0);
save('GAD2_Control_HeatMap_dCricOld','m')
save('GAD2_Control_HeatMap_dCricOld_Avg','mavg')
save('GAD2_Control_HeatMap_dCricOld_Pvalues','P')

% TAC1 ChR2 NovOld
ss = [S(27).NovelObject.NovOld S(28).NovelObject.NovOld S(29).NovelObject.NovOld];
[m,mavg,P] = BehaviorHeatMap(ss,0,0);
save('TAC1_ChR2_HeatMap_NovOld','m')
save('TAC1_ChR2_HeatMap_NovOld_Avg','mavg')
save('TAC1_ChR2_HeatMap_NovOld_Pvalues','P')

% PV ChR2 NovOld
ss = [S(27).NovelObject.NovOld S(28).NovelObject.NovOld S(29).NovelObject.NovOld];
[m,mavg,P] = BehaviorHeatMap(ss,0,0);
save('PV_ChR2_HeatMap_NovOld','m')
save('PV_ChR2_HeatMap_NovOld_Avg','mavg')
save('PV_ChR2_HeatMap_NovOld_Pvalues','P')

% SST ChR2 NovOld
ss = [S(30).NovelObject.NovOld S(31).NovelObject.NovOld S(32).NovelObject.NovOld];
[m,mavg,P] = BehaviorHeatMap(ss,0,0);
save('SST_ChR2_HeatMap_NovOld','m')
save('SST_ChR2_HeatMap_NovOld_Avg','mavg')
save('SST_ChR2_HeatMap_NovOld_Pvalues','P')

% ZI PAG ChR2 NovOld
ss = [S(41).NovelObject.NovOld S(42).NovelObject.NovOld S(43).NovelObject.NovOld];
[m,mavg,P] = BehaviorHeatMap(ss,0,0);

% ZI TAC1 stACR2 NovOld
ss = [S(30).NovelObject.NovOld S(55).NovelObject.NovOld S(56).NovelObject.NovOld S(93).NovelObject.NovOld S(94).NovelObject.NovOld];
[m,mavg,P] = BehaviorHeatMap(ss,0,0);
