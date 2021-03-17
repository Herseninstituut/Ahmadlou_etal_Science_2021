load('\\vs01\csf_data\Shared\InVivo\Experiments\JAABA_analysis\SessionUpdates\Session_Object_Social_26032020.mat')

GAD2_control = [];
GAD2_Exc = [];
for i=1:length(S)
    if strcmp(S(i).group,'GAD2_ZI_Cont_CNO')==1 % 'GAD2_ZI_Exc_PLsaline'%'GAD2_ZI_Cont'%'ZIPAG_Cont_CNO'
        GAD2_control = [GAD2_control,i];
    elseif strcmp(S(i).group,'GAD2_ZI_CNO')==1 % 'GAD2_ZI_Exc_PLCNO'%'GAD2_ZI_PAG_Exc'
        GAD2_Exc = [GAD2_Exc,i];
    end
end

% 'GAD2_ZI_PAG_Exc'
% 'GAD2_ZI_MLR_Exc'
% 'GAD2_ZI_PnO_Exc'

App_NEW_duration_Exc = [];
App_OLD_duration_Exc = [];
Bite_NEW_duration_Exc = [];
Bite_OLD_duration_Exc = [];
Sniff_NEW_duration_Exc = [];
Sniff_OLD_duration_Exc = [];
Grab_NEW_duration_Exc = [];
Grab_OLD_duration_Exc = [];
Carry_NEW_duration_Exc = [];
Carry_OLD_duration_Exc = [];
Avoid_NEW_duration_Exc = [];
Avoid_OLD_duration_Exc = [];


for i = GAD2_Exc
    % push bedding
    if ~isempty(S(i).NovelObject)==1 && isfield(S(i).NovelObject,'NovOld')==1
    NovObj = S(i).NovelObject.NovOld;
    for j=1:length(NovObj)
        if isfield(NovObj{1,j},'ApproachNEW_start')
            App_NEW_duration_Exc = [App_NEW_duration_Exc , sum(NovObj{j}.ApproachNEW_end - NovObj{j}.ApproachNEW_start)];
            App_OLD_duration_Exc = [App_OLD_duration_Exc , sum(NovObj{j}.ApproachOLD_end - NovObj{j}.ApproachOLD_start)];
            
            Sniff_NEW_duration_Exc = [Sniff_NEW_duration_Exc , sum(NovObj{j}.SniffNEW_end - NovObj{j}.SniffNEW_start)];
            Sniff_OLD_duration_Exc = [Sniff_OLD_duration_Exc , sum(NovObj{j}.SniffOLD_end - NovObj{j}.SniffOLD_start)];
            
            Bite_NEW_duration_Exc = [Bite_NEW_duration_Exc , sum(NovObj{j}.BiteNEW_end - NovObj{j}.BiteNEW_start)];
            Bite_OLD_duration_Exc = [Bite_OLD_duration_Exc , sum(NovObj{j}.BiteOLD_end - NovObj{j}.BiteOLD_start)];
            
            Grab_NEW_duration_Exc = [Grab_NEW_duration_Exc , sum(NovObj{j}.GrabNEW_end - NovObj{j}.GrabNEW_start)];
            Grab_OLD_duration_Exc = [Grab_OLD_duration_Exc , sum(NovObj{j}.GrabOLD_end - NovObj{j}.GrabOLD_start)];
            
            Carry_NEW_duration_Exc = [Carry_NEW_duration_Exc , sum(NovObj{j}.CarryNEW_end - NovObj{j}.CarryNEW_start)];
            Carry_OLD_duration_Exc = [Carry_OLD_duration_Exc , sum(NovObj{j}.CarryOLD_end - NovObj{j}.CarryOLD_start)];
            
            Avoid_NEW_duration_Exc = [Avoid_NEW_duration_Exc , sum(NovObj{j}.AvoidNEW_end - NovObj{j}.AvoidNEW_start)];
            Avoid_OLD_duration_Exc = [Avoid_OLD_duration_Exc , sum(NovObj{j}.AvoidOLD_end - NovObj{j}.AvoidOLD_start)];
        end
    end
    end
end


App_NEW_duration_control = [];
App_OLD_duration_control = [];
Bite_NEW_duration_control = [];
Bite_OLD_duration_control = [];
Sniff_NEW_duration_control = [];
Sniff_OLD_duration_control = [];
Grab_NEW_duration_control = [];
Grab_OLD_duration_control = [];
Carry_NEW_duration_control = [];
Carry_OLD_duration_control = [];
Avoid_NEW_duration_control = [];
Avoid_OLD_duration_control = [];

for i = GAD2_control
    % push bedding
    if ~isempty(S(i).NovelObject)==1 && isfield(S(i).NovelObject,'NovOld')==1
        NovObj = S(i).NovelObject.NovOld;
        for j=1:length(NovObj)
            if isfield(NovObj{1,j},'ApproachNEW_start')
            App_NEW_duration_control = [App_NEW_duration_control , sum(NovObj{j}.ApproachNEW_end - NovObj{j}.ApproachNEW_start)];
            App_OLD_duration_control = [App_OLD_duration_control , sum(NovObj{j}.ApproachOLD_end - NovObj{j}.ApproachOLD_start)];
            
            Sniff_NEW_duration_control = [Sniff_NEW_duration_control , sum(NovObj{j}.SniffNEW_end - NovObj{j}.SniffNEW_start)];
            Sniff_OLD_duration_control = [Sniff_OLD_duration_control , sum(NovObj{j}.SniffOLD_end - NovObj{j}.SniffOLD_start)];
            
            Bite_NEW_duration_control = [Bite_NEW_duration_control , sum(NovObj{j}.BiteNEW_end - NovObj{j}.BiteNEW_start)];
            Bite_OLD_duration_control = [Bite_OLD_duration_control , sum(NovObj{j}.BiteOLD_end - NovObj{j}.BiteOLD_start)];
            
            Grab_NEW_duration_control = [Grab_NEW_duration_control , sum(NovObj{j}.GrabNEW_end - NovObj{j}.GrabNEW_start)];
            Grab_OLD_duration_control = [Grab_OLD_duration_control , sum(NovObj{j}.GrabOLD_end - NovObj{j}.GrabOLD_start)];
            
            Carry_NEW_duration_control = [Carry_NEW_duration_control , sum(NovObj{j}.CarryNEW_end - NovObj{j}.CarryNEW_start)];
            Carry_OLD_duration_control = [Carry_OLD_duration_control , sum(NovObj{j}.CarryOLD_end - NovObj{j}.CarryOLD_start)];
            
            Avoid_NEW_duration_control = [Avoid_NEW_duration_control , sum(NovObj{j}.AvoidNEW_end - NovObj{j}.AvoidNEW_start)];
            Avoid_OLD_duration_control = [Avoid_OLD_duration_control , sum(NovObj{j}.AvoidOLD_end - NovObj{j}.AvoidOLD_start)];
            end
        end
    end
end

% % stacked bargraph

Med_NEW_Exc = [mean(App_NEW_duration_Exc),...
    mean(Sniff_NEW_duration_Exc),...
    mean(Bite_NEW_duration_Exc),...
    mean(Grab_NEW_duration_Exc),...
    mean(Carry_NEW_duration_Exc),...
    mean(Avoid_NEW_duration_Exc)];

Med_OLD_Exc = [mean(App_OLD_duration_Exc),...
    mean(Sniff_OLD_duration_Exc),...
    mean(Bite_OLD_duration_Exc),...
    mean(Grab_OLD_duration_Exc),...
    mean(Carry_OLD_duration_Exc),...
    mean(Avoid_OLD_duration_Exc)];

Med_NEW_control = [mean(App_NEW_duration_control),...
    mean(Sniff_NEW_duration_control),...
    mean(Bite_NEW_duration_control),...
    mean(Grab_NEW_duration_control),...
    mean(Carry_NEW_duration_control),...
    mean(Avoid_NEW_duration_control)];

Med_OLD_control = [mean(App_OLD_duration_control),...
    mean(Sniff_OLD_duration_control),...
    mean(Bite_OLD_duration_control),...
    mean(Grab_OLD_duration_control),...
    mean(Carry_OLD_duration_control),...
    mean(Avoid_OLD_duration_control)];

% cd \\vs01\MVP\Shared\InVivo\Experiments\Investigation_Figures\PL_ZI\hM4Di

figure
bar([1,2,3,4],[Med_OLD_control;Med_NEW_control;Med_OLD_Exc;Med_NEW_Exc],'stacked')
legend({'Approach','Sniff','Bite','Grab','Carry','Avoid'})
box off
ylabel('Duration (s)','FontSize',24)
set(gcf,'color','white')
set(gca,'xticklabels',{'Familiar','Novel','Familiar','Novel'},'FontSize',20)
% savefig('StackedBar.fig')
% saveas(gcf,'StackedBar','epsc')
% close
%% Colors

C_approach=[0 114 189]/255;
C_sniff=[217 83 25]/255;
C_bite=[237 177 32]/255;
C_grab=[126 47 142]/255;
C_carry=[119 172 48]/255;
C_avoid=[77 190 238]/255;
%% Durations

% cd \\vs01\MVP\Shared\InVivo\Experiments\Investigation_Figures\GAD2\stACR2_Object\Supplementary

ivt_graph({Sniff_OLD_duration_control,Sniff_NEW_duration_control,Sniff_OLD_duration_Exc,Sniff_NEW_duration_Exc},[],'color',C_sniff,'xticklabels',{'Cont/Familiar','Cont/Novel','Exc/Familiar','Exc/Novel'},'showpoints',1 ,'errorbars','sem')
ylabel('Sniff Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')
% savefig('review_Sniff_Duration.fig')
% saveas(gcf,'review_Sniff_Duration','epsc')

ivt_graph({Bite_OLD_duration_control,Bite_NEW_duration_control,Bite_OLD_duration_Exc,Bite_NEW_duration_Exc},[],'color',C_bite,'xticklabels',{'Familiar','Novel','Familiar','Novel'},'showpoints',1,'errorbars','sem')
ylabel('Bite Duration (s)','FontSize',24)
box off
set(gcf,'color','white')
% savefig('review_Bite_Duration.fig')
% saveas(gcf,'review_Bite_Duration','epsc')

ivt_graph({Grab_OLD_duration_control,Grab_NEW_duration_control,Grab_OLD_duration_Exc,Grab_NEW_duration_Exc},[],'color',C_grab,'xticklabels',{'Familiar','Novel','Familiar','Novel'},'showpoints',1,'errorbars','sem')
ylabel('Grab Duration (s)','FontSize',24)
box off
set(gcf,'color','white')
% savefig('review_Grab_Duration.fig')
% saveas(gcf,'review_Grab_Duration','epsc')

ivt_graph({Carry_OLD_duration_control,Carry_NEW_duration_control,Carry_OLD_duration_Exc,Carry_NEW_duration_Exc},[],'color',C_carry,'xticklabels',{'Familiar','Novel','Familiar','Novel'},'showpoints',1,'errorbars','sem')
ylabel('Carry Duration (s)','FontSize',24)
box off
set(gcf,'color','white')
% savefig('review_Carry_Duration.fig')
% saveas(gcf,'review_Carry_Duration','epsc')

% ivt_graph({Avoid_OLD_duration_control,Avoid_NEW_duration_control,Avoid_OLD_duration_Exc,Avoid_NEW_duration_Exc},[],'color',C_avoid,'xticklabels',{'Familiar','Novel','Familiar','Novel'},'showpoints',1,'errorbars','sem')
% ylabel('Avoid Duration (s)','FontSize',24)
% box off
% set(gcf,'color','white')
% savefig('Avoid_Duration.fig')
% saveas(gcf,'Avoid_Duration','epsc')

% ivt_graph({App_OLD_duration_control,App_NEW_duration_control,App_OLD_duration_Exc,App_NEW_duration_Exc},[],'color',C_approach,'xticklabels',{'Familiar','Novel','Familiar','Novel'},'showpoints',1,'errorbars','sem')
% ylabel('Approach Duration (s)','FontSize',24)
% box off
% set(gcf,'color','white')
% savefig('Approach_Duration.fig')
% saveas(gcf,'Approach_Duration','epsc')

Invest_control = Sniff_NEW_duration_control+Bite_NEW_duration_control+Carry_NEW_duration_control;
Invest_Exc = Sniff_NEW_duration_Exc+Bite_NEW_duration_Exc+Carry_NEW_duration_Exc;
%% Number of events

App_NEW_number_control = [];
App_OLD_number_control = [];
Carry_NEW_number_control = [];
Carry_OLD_number_control = [];
Avoid_NEW_number_control = [];
Avoid_OLD_number_control = [];

for i = GAD2_control
    % novel object
    if ~isempty(S(i).NovelObject)==1
        NovObj = S(i).NovelObject.NovOld;
        for j=1:length(NovObj)
            if isfield(NovObj{1,j},'ApproachNEW_start')
            App_NEW_number_control = [App_NEW_number_control , length(NovObj{j}.ApproachNEW_end - NovObj{j}.ApproachNEW_start)];
            App_OLD_number_control = [App_OLD_number_control , length(NovObj{j}.ApproachOLD_end - NovObj{j}.ApproachOLD_start)];

            Carry_NEW_number_control = [Carry_NEW_number_control , length(NovObj{j}.CarryNEW_end - NovObj{j}.CarryNEW_start)];
            Carry_OLD_number_control = [Carry_OLD_number_control , length(NovObj{j}.CarryOLD_end - NovObj{j}.CarryOLD_start)];
            
            Avoid_NEW_number_control = [Avoid_NEW_number_control , length(NovObj{j}.AvoidNEW_end - NovObj{j}.AvoidNEW_start)];
            Avoid_OLD_number_control = [Avoid_OLD_number_control , length(NovObj{j}.AvoidOLD_end - NovObj{j}.AvoidOLD_start)];
            end
        end
    end
end

App_NEW_number_Exc = [];
App_OLD_number_Exc = [];
Carry_NEW_number_Exc = [];
Carry_OLD_number_Exc = [];
Avoid_NEW_number_Exc = [];
Avoid_OLD_number_Exc = [];

for i = GAD2_Exc
    % novel object
    if ~isempty(S(i).NovelObject)==1
        NovObj = S(i).NovelObject.NovOld;
        for j=1:length(NovObj)
            if isfield(NovObj{1,j},'ApproachNEW_start')
            App_NEW_number_Exc = [App_NEW_number_Exc , length(NovObj{j}.ApproachNEW_end - NovObj{j}.ApproachNEW_start)];
            App_OLD_number_Exc = [App_OLD_number_Exc , length(NovObj{j}.ApproachOLD_end - NovObj{j}.ApproachOLD_start)];

            Carry_NEW_number_Exc = [Carry_NEW_number_Exc , length(NovObj{j}.CarryNEW_end - NovObj{j}.CarryNEW_start)];
            Carry_OLD_number_Exc = [Carry_OLD_number_Exc , length(NovObj{j}.CarryOLD_end - NovObj{j}.CarryOLD_start)];
            
            Avoid_NEW_number_Exc = [Avoid_NEW_number_Exc , length(NovObj{j}.AvoidNEW_end - NovObj{j}.AvoidNEW_start)];
            Avoid_OLD_number_Exc = [Avoid_OLD_number_Exc , length(NovObj{j}.AvoidOLD_end - NovObj{j}.AvoidOLD_start)];
            end
        end
    end
end

% ivt_graph({Carry_OLD_number_control,Carry_NEW_number_control,Carry_OLD_number_Exc,Carry_NEW_number_Exc},[],'color',C_carry,'xticklabels',{'Familiar','Novel','Familiar','Novel'},'showpoints',1,'errorbars','sem')
% ylabel('Carry number (s)','FontSize',24)
% box off
% set(gcf,'color','white')
% savefig('Carry_Number.fig')
% saveas(gcf,'Carry_Number','epsc')

ivt_graph({Avoid_OLD_number_control,Avoid_NEW_number_control,Avoid_OLD_number_Exc,Avoid_NEW_number_Exc},[],'color',C_avoid,'xticklabels',{'Familiar','Novel','Familiar','Novel'},'showpoints',1,'errorbars','sem')
ylabel('Avoid number (s)','FontSize',24)
box off
set(gcf,'color','white')
% savefig('review_Avoid_Number.fig')
% saveas(gcf,'review_Avoid_Number','epsc')

ivt_graph({App_OLD_number_control,App_NEW_number_control,App_OLD_number_Exc,App_NEW_number_Exc},[],'color',C_approach,'xticklabels',{'Familiar','Novel','Familiar','Novel'},'showpoints',1,'errorbars','sem')
ylabel('Approach number (s)','FontSize',24)
box off
set(gcf,'color','white')
% savefig('review_Approach_Number.fig')
% saveas(gcf,'review_Approach_Number','epsc')



% ivt_graph({(App_NEW_number_control-App_OLD_number_control)./(App_NEW_number_control+App_OLD_number_control),(App_NEW_number_Exc-App_OLD_number_Exc)./(App_NEW_number_Exc+App_OLD_number_Exc)},[],'color',C_approach,'xticklabels',{'control NOR','stACR2 NOR'},'showpoints',1,'errorbars','sem')
% ylabel('Approach number (s)','FontSize',24)
% box off
% set(gcf,'color','white')
% 
% ivt_graph({(App_NEW_number_control-App_OLD_number_control)./(App_NEW_number_control+App_OLD_number_control),(App_NEW_number_Exc-App_OLD_number_Exc)./(App_NEW_number_Exc+App_OLD_number_Exc)},[],'color',C_approach,'xticklabels',{'control NOR','stACR2 NOR'},'showpoints',1,'errorbars','sem')
% ylabel('Novelty Recognition Index','FontSize',24)
% box off
% set(gcf,'color','white')
% 
% 
% ivt_graph({(Sniff_NEW_duration_control-Sniff_OLD_duration_control)./(Sniff_NEW_duration_control+Sniff_OLD_duration_control),(Sniff_NEW_duration_Exc-Sniff_OLD_duration_Exc)./(Sniff_NEW_duration_Exc+Sniff_OLD_duration_Exc)},[],'color',C_approach,'xticklabels',{'control NOR','stACR2 NOR'},'showpoints',1,'errorbars','sem')
% ylabel('Novelty Recognition Index','FontSize',24)
% box off
% set(gcf,'color','white')


%%
% [p,h,stats] = signrank(App_OLD_number_Exc,App_NEW_number_Exc)
% p*3
% [p,h,stats] = ranksum(App_OLD_number_control,App_OLD_number_Exc)
% p*3
% [p,h,stats] = ranksum(App_NEW_number_control,App_NEW_number_Exc)
% p*3
% mean(App_OLD_number_control),sem(App_OLD_number_control)
% mean(App_NEW_number_control),sem(App_NEW_number_control)
% mean(App_OLD_number_Exc),sem(App_OLD_number_Exc)
% mean(App_NEW_number_Exc),sem(App_NEW_number_Exc)
% 
% %%
% [p1,h,stats] = signrank(Carry_OLD_duration_Exc,Carry_NEW_duration_Exc)
% p1*3
% [p2,h,stats] = ranksum(Carry_OLD_duration_control,Carry_OLD_duration_Exc)
% p2*3
% [p3,h,stats] = ranksum(Carry_NEW_duration_control,Carry_NEW_duration_Exc)
% p3*3
% mean(Carry_OLD_duration_control),sem(Carry_OLD_duration_control)
% mean(Carry_NEW_duration_control),sem(Carry_NEW_duration_control)
% mean(Carry_OLD_duration_Exc),sem(Carry_OLD_duration_Exc)
% mean(Carry_NEW_duration_Exc),sem(Carry_NEW_duration_Exc)
