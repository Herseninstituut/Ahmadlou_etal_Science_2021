GAD2_Exc = [];
for i=1:length(S)
    if strcmp(S(i).group,'GAD2_ZI_Exc')==1
        GAD2_Exc = [GAD2_Exc,i];
    end
end


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
    if ~isempty(S(i).NovelObject)==1 && isfield(S(i).NovelObject,'MovStat')==1
    NovObj = S(i).NovelObject.MovStat;
    for j=1:length(NovObj)
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

figure
bar([1,2],[Med_OLD_Exc;Med_NEW_Exc],'stacked')
legend({'Approach','Sniff','Bite','Grab','Carry','Avoid'})
box off
ylabel('Duration (s)','FontSize',24)
set(gcf,'color','white')
set(gca,'xticklabels',{'Moving Obj (Old)','Static Obj (New)'},'FontSize',20)
%% durations

ivt_graph({Sniff_OLD_duration_Exc,Sniff_NEW_duration_Exc},[],'xticklabels',{'Moving Obj (Old)','Static Obj (New)'},'showpoints',1,'errorbars','sem','color',[.85 .325 .098])
ylabel('Sniff Duration (s; 2 min)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({Bite_OLD_duration_Exc,Bite_NEW_duration_Exc},[],'xticklabels',{'Moving Obj (Old)','Static Obj (New)'},'showpoints',1,'errorbars','sem','color',[.929 .694 .125])
ylabel('Bite Duration (s; 2 min)','FontSize',24)
box off
set(gcf,'color','white')

ivt_graph({Grab_OLD_duration_Exc,Grab_NEW_duration_Exc},[],'xticklabels',{'Moving Obj (Old)','Static Obj (New)'},'showpoints',1,'errorbars','sem','color',[.494 .184 .556])
ylabel('Grab Duration (s; 2 min)','FontSize',24)
box off
set(gcf,'color','white')

ivt_graph({Carry_OLD_duration_Exc,Carry_NEW_duration_Exc},[],'xticklabels',{'Moving Obj (Old)','Static Obj (New)'},'showpoints',1,'errorbars','sem','color',[.466 .674 .188])
ylabel('Carry Duration (s; 2 min)','FontSize',24)
box off
set(gcf,'color','white')

ivt_graph({Avoid_OLD_duration_Exc,Avoid_NEW_duration_Exc},[],'xticklabels',{'Moving Obj (Old)','Static Obj (New)'},'showpoints',1,'errorbars','sem','color',[.301 .745 .933])
ylabel('Avoid Duration (s; 2 min)','FontSize',24)
box off
set(gcf,'color','white')

ivt_graph({App_OLD_duration_Exc,App_NEW_duration_Exc},[],'xticklabels',{'Moving Obj (Old)','Static Obj (New)'},'showpoints',1,'errorbars','sem','color',[0 .447 .741])
ylabel('Approach Duration (s; 2 min)','FontSize',24)
box off
set(gcf,'color','white')
%% number of events

App_NEW_number_Exc = [];
App_OLD_number_Exc = [];
Carry_NEW_number_Exc = [];
Carry_OLD_number_Exc = [];
Avoid_NEW_number_Exc = [];
Avoid_OLD_number_Exc = [];

for i = GAD2_Exc
    % novel object
    if ~isempty(S(i).NovelObject)==1 && isfield(S(i).NovelObject,'MovStat')==1
        NovObj = S(i).NovelObject.MovStat;
        for j=1:length(NovObj)
            App_NEW_number_Exc = [App_NEW_number_Exc , length(NovObj{j}.ApproachNEW_end - NovObj{j}.ApproachNEW_start)];
            App_OLD_number_Exc = [App_OLD_number_Exc , length(NovObj{j}.ApproachOLD_end - NovObj{j}.ApproachOLD_start)];

            Carry_NEW_number_Exc = [Carry_NEW_number_Exc , length(NovObj{j}.CarryNEW_end - NovObj{j}.CarryNEW_start)];
            Carry_OLD_number_Exc = [Carry_OLD_number_Exc , length(NovObj{j}.CarryOLD_end - NovObj{j}.CarryOLD_start)];
            
            Avoid_NEW_number_Exc = [Avoid_NEW_number_Exc , length(NovObj{j}.AvoidNEW_end - NovObj{j}.AvoidNEW_start)];
            Avoid_OLD_number_Exc = [Avoid_OLD_number_Exc , length(NovObj{j}.AvoidOLD_end - NovObj{j}.AvoidOLD_start)];
        end
    end
end

ivt_graph({Carry_OLD_number_Exc,Carry_NEW_number_Exc},[],'xticklabels',{'Moving Obj (Old)','Static Obj (New)'},'showpoints',1,'errorbars','sem','color',[.466 .674 .188])
ylabel('Carry Events (n)','FontSize',24)
box off
set(gcf,'color','white')

ivt_graph({Avoid_OLD_number_Exc,Avoid_NEW_number_Exc},[],'xticklabels',{'Moving Obj (Old)','Static Obj (New)'},'showpoints',1,'errorbars','sem','color',[.301 .745 .933])
ylabel('Avoid Events (n)','FontSize',24)
box off
set(gcf,'color','white')

ivt_graph({App_OLD_number_Exc,App_NEW_number_Exc},[],'xticklabels',{'Moving Obj (Old)','Static Obj (New)'},'showpoints',1,'errorbars','sem','color',[0 .447 .741])
ylabel('Approach Events (n)','FontSize',24)
box off
set(gcf,'color','white')
