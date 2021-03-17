%  load \\vs01\MVP\Shared\InVivo\Experiments\Behavior_Analysis_Janou\ShallowVsDeep\BL6_NovOld_Ratio.mat
F_BL6_new = F.NEW;
ang_BL6_new = asin(F_BL6_new.ratio);
rad_BL6_new = F_BL6_new.totaltime;
a = find(rad_BL6_new==0); %ang_BL6_new(a)=0;

F_BL6_old = F.OLD; %F2.NEW
ang_BL6_old = asin(F_BL6_old.ratio);
rad_BL6_old = F_BL6_old.totaltime;
b = find(rad_BL6_old==0); %ang_BL6_old(b)=0;

figure; polarplot(ang_BL6_new,rad_BL6_new,'o','MarkerEdgeColor',[0.4 0.4 1],'MarkerSize',8,'LineWidth',1.5)
hold on; polarplot(ang_BL6_old,rad_BL6_old,'o','MarkerEdgeColor',[1 0.4 0.4],'MarkerSize',8,'LineWidth',1.5)
title('WT Depth of Object Investigation','FontSize',16)
legend('NewObj','OldObj')
% hold on;scatplot(ang_BL6,rad_BL6,'circles',100,[],[],[],25)
set(gcf,'color','white')
box off
thetalim([-90 90])
thetaticks(linspace(-90,90,5))
thetaticklabels({'-\pi/2','-\pi/4','0','\pi/4','\pi/2'})

% h = polarhistogram(ang_BL6_new,18,'Normalization','probability');h.DisplayStyle = 'stairs';
figure; polarhistogram(ang_BL6_old,'BinEdges',linspace(-0.5*pi,.5*pi,10),'Normalization','probability','FaceColor','r','FaceAlpha',.3);
hold on; polarhistogram(ang_BL6_new,'BinEdges',linspace(-0.5*pi,.5*pi,10),'Normalization','probability','FaceColor','b','FaceAlpha',1);%h.DisplayStyle = 'stairs';
title('WT Depth of Object Investigation','FontSize',16)
legend('Familiar','Novel')
set(gcf,'color','white')
box off
thetalim([-90 90])
thetaticks(linspace(-90,90,5))
thetaticklabels({'-\pi/2','-\pi/4','0','\pi/4','\pi/2'})

ivt_graph({ang_BL6_old , ang_BL6_new},[],'xticklabels',{'Familiar','Novel'},'showpoints',1,'color',[0.4 0.5 0.2],'errorbars','sem','test','signrank')%
ylabel('Preference to Deep Investigation','FontSize',24)
box off
set(gcf,'color','white')
yticks(linspace(-pi/2,pi/2,5))
yticklabels({'-\pi/2','-\pi/4','0','\pi/4','\pi/2'})
ylabel('Deep I vs Shallow I Preference','FontSize',20)