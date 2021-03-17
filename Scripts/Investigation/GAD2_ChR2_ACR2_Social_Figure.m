% %Investigation Statistics
% cd \\vs01\MVP\Shared\InVivo\Experiments\Investigation_Figures\GAD2\ChR2_stACR2_Social
% ivt_graph({Investigation_duration_control,Investigation_duration_Exc,Investigation_duration_Inh},[],'color','b','xticklabels',{'tdTOM','ChR2','stGtACR2'},'showpoints',1,'errorbars','sem')
% ylabel('Investigation Duration (s)','FontSize',24)
% box off
% set(gcf,'color','white')
% % savefig('review_Investigation_Duration.fig')
% % saveas(gcf,'review_Investigation_Duration','epsc')
% 
% 
% figure
% bar([1,2,3],[Med_control;Med_Exc;Med_Inh],'stacked')
% legend({'Approach','Investigation','Avoid','Defense','Grab','Intruder: Approach','Intruder: Defense'})
% box off
% ylabel('Duration (s) in 10 min','FontSize',24)
% set(gcf,'color','white')
% set(gca,'xticklabels',{'tdTOM','ChR2','stGtACR2'},'FontSize',24)
% % savefig('review_StackedBar.fig')
% % saveas(gcf,'review_StackedBar','epsc')


%Investigation Statistics Begin / Last
cd \\vs01\MVP\Shared\InVivo\Experiments\Investigation_Figures\GAD2\ChR2_stACR2_Social
ivt_graph({Inv_Cont_Last,Inv_Exc_Last,Inv_Inh_Last},[],'color','b','xticklabels',{'tdTOM','ChR2','stGtACR2'},'showpoints',1,'errorbars','sem')
ylabel('Investigation Duration (s)','FontSize',24)
box off
set(gcf,'color','white')
savefig('review_Investigation_Duration_Familiar.fig')
saveas(gcf,'review_Investigation_Duration_Familiar','epsc')


figure
bar([1,2,3],[Med_Cont_Last;Med_Exc_Last;Med_Inh_Last],'stacked')
legend({'Approach','Investigation','Avoid','Defense','Grab','Intruder: Approach','Intruder: Defense'})
box off
ylabel('Duration (s) in 10 min','FontSize',24)
set(gcf,'color','white')
set(gca,'xticklabels',{'tdTOM','ChR2','stGtACR2'},'FontSize',24)
savefig('review_StackedBar_Familiar.fig')
saveas(gcf,'review_StackedBar_Familiar','epsc')