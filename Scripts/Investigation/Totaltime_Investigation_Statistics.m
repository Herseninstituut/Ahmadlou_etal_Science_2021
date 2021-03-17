%Totaltime Investigation Statistics
% cd \\vs01\MVP\Shared\InVivo\Experiments\Investigation_Figures\PL_ZI\hM4Di
ivt_graph({F_cont.OLD.totaltime F_cont.NEW.totaltime F_chr2.OLD.totaltime F_chr2.NEW.totaltime},[],'color','b','xticklabels',{'Familiar','Novel','Familiar','Novel'},'showpoints',1,'errorbars','sem')
ylabel('Investigation Duration (s)','FontSize',24)
box off
set(gcf,'color','white')
% savefig('Investigation_Duration.fig')
% saveas(gcf,'Investigation_Duration','epsc')

cd \\vs01\MVP\Shared\InVivo\Experiments\Behavior_Analysis_Janou
F1 = F_cont;
F2 = F_chr2;
polarplot_GAD2


Invest_control = Sniff_NEW_duration_control+Bite_NEW_duration_control+Carry_NEW_duration_control;
Invest_Exc = Sniff_NEW_duration_Exc+Bite_NEW_duration_Exc+Carry_NEW_duration_Exc;
Invest_control_old = Sniff_OLD_duration_control+Bite_OLD_duration_control+Carry_OLD_duration_control;
Invest_Exc_old = Sniff_OLD_duration_Exc+Bite_OLD_duration_Exc+Carry_OLD_duration_Exc;

ivt_graph({Invest_control_old Invest_control Invest_Exc_old Invest_Exc},[],'color','b','xticklabels',{'Familiar','Novel','Familiar','Novel'},'showpoints',1,'errorbars','sem')
ylabel('Investigation Duration (s)','FontSize',24)
box off
set(gcf,'color','white')
% cd \\vs01\MVP\Shared\InVivo\Experiments\Investigation_Figures\GAD2\ChR2_Object
% savefig('Investigation_Duration.fig')
% saveas(gcf,'Investigation_Duration','epsc')


ivt_graph({Invest_Exc_old Invest_Exc},[],'color','b','xticklabels',{'Food','Novel'},'showpoints',1,'errorbars','sem')
ylabel('Investigation Duration (s)','FontSize',24)
box off
set(gcf,'color','white')
% cd \\vs01\MVP\Shared\InVivo\Experiments\Investigation_Figures\GAD2\ChR2_Object
savefig('Investigation_Duration.fig')
saveas(gcf,'Investigation_Duration','epsc')

% cd \\vs01\MVP\Shared\InVivo\Experiments\Investigation_Figures\GAD2\ChR2_Food
% ivt_graph({F.OLD.totaltime F.NEW.totaltime},[],'color','b','xticklabels',{'Food','Novel'},'showpoints',1,'errorbars','sem')
% ylabel('Investigation Duration (s)','FontSize',24)
% box off
% set(gcf,'color','white')
% savefig('Investigation_Duration.fig')
% saveas(gcf,'Investigation_Duration','epsc')
% 
% cd \\vs01\MVP\Shared\InVivo\Experiments\Investigation_Figures\GAD2\ChR2_Cricket
% ivt_graph({F.OLD.totaltime F.NEW.totaltime},[],'color','b','xticklabels',{'Cricket','Novel'},'showpoints',1,'errorbars','sem')
% ylabel('Investigation Duration (s)','FontSize',24)
% box off
% set(gcf,'color','white')
% savefig('Investigation_Duration.fig')
% saveas(gcf,'Investigation_Duration','epsc')
% 
% cd \\vs01\MVP\Shared\InVivo\Experiments\Investigation_Figures\GAD2\stACR2_Object
% ivt_graph({F_cont.OLD.totaltime F_cont.NEW.totaltime F_acr2.OLD.totaltime F_acr2.NEW.totaltime},[],'color','b','xticklabels',{'Familiar','Novel','Familiar','Novel'},'showpoints',1,'errorbars','sem')
% ylabel('Investigation Duration (s) in 10 min','FontSize',24)
% box off
% set(gcf,'color','white')
% savefig('Investigation_Duration.fig')
% saveas(gcf,'Investigation_Duration','epsc')
% 
% cd \\vs01\MVP\Shared\InVivo\Experiments\Behavior_Analysis_Janou
% F1 = F_cont;
% F2 = F_acr2;
% polarplot_GAD2