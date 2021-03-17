% load \\vs01\MVP\Shared\InVivo\Experiments\Behavior_Analysis_Janou\ShallowVsDeep\TAC1_ChR2_NovOld_Ratio.mat

F_ChR2_new = F1.NEW;
ang_ChR2_new = asin(F_ChR2_new.ratio);
rad_ChR2_new = F_ChR2_new.totaltime;
a = find(rad_ChR2_new==0); %ang_ChR2_new(a)=0;

F_ChR2_old = F2.NEW;
% F_ChR2_old = F1.OLD;
ang_ChR2_old = asin(F_ChR2_old.ratio);
rad_ChR2_old = F_ChR2_old.totaltime;
b = find(rad_ChR2_old==0); %ang_ChR2_old(b)=0;

figure; polarplot(ang_ChR2_new,rad_ChR2_new,'o','MarkerEdgeColor',[0.4 0.4 1],'MarkerSize',8,'LineWidth',1.5)
hold on; polarplot(ang_ChR2_old,rad_ChR2_old,'o','MarkerEdgeColor',[1 0.4 0.4],'MarkerSize',8,'LineWidth',1.5)
title('TAC1/tdTom Depth of Object Investigation','FontSize',16)
legend('TAC1','tdTom')
% hold on;scatplot(ang_ChR2,rad_ChR2,'circles',100,[],[],[],25)
set(gcf,'color','white')
box off
thetalim([-90 90])
thetaticks(linspace(-90,90,5))
thetaticklabels({'-\pi/2','-\pi/4','0','\pi/4','\pi/2'})

% h = polarhistogram(ang_ChR2_new,18,'Normalization','probability');h.DisplayStyle = 'stairs';
figure; polarhistogram(ang_ChR2_new,'BinEdges',linspace(-0.5*pi,.5*pi,10),'Normalization','probability','FaceColor','r','FaceAlpha',1.0);
hold on; polarhistogram(ang_ChR2_old,'BinEdges',linspace(-0.5*pi,.5*pi,10),'Normalization','probability','FaceColor','g','FaceAlpha',0.3);%h.DisplayStyle = 'stairs';
title('TAC1/ChR2 Depth of Object Investigation','FontSize',16)
legend('TAC1','tdTom')
set(gcf,'color','white')
box off
thetalim([-90 90])
thetaticks(linspace(-90,90,5))
thetaticklabels({'-\pi/2','-\pi/4','0','\pi/4','\pi/2'})

% ivt_graph({ang_ChR2_new(~isnan(ang_ChR2_old)) , ang_ChR2_old(~isnan(ang_ChR2_old))},[],'xticklabels',{'New','Old'},'showpoints',1,'errorbars','sem')
ivt_graph({ang_ChR2_new, ang_ChR2_old},[],'xticklabels',{'tdTom','TAC1'},'showpoints',1,'errorbars','sem','test','ranksum')
ylabel('Preference to Deep Investigation','FontSize',24)
box off
set(gcf,'color','white')
yticks(linspace(-pi/2,pi/2,5))
yticklabels({'-\pi/2','-\pi/4','0','\pi/4','\pi/2'})
ylabel('Deep I vs Shallow I Preference','FontSize',20)
title('PV/tdTom DSP New vs Old','FontSize',16)