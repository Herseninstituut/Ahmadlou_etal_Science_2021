GAD2_control = [];
GAD2_Exc = [];
for i=1:length(S)
    if strcmp(S(i).group,'GAD2_ZI_Cont')==1
        GAD2_control = [GAD2_control,i];
    elseif strcmp(S(i).group,'GAD2_ZI_Exc')==1
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

for i = GAD2_control
    % push bedding
    if ~isempty(S(i).NovelObject)==1
    NovObj = S(i).NovelObject.dCricOld;
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
    if ~isempty(S(i).NovelObject)==1
        NovObj = S(i).NovelObject.dCricOld;
        for j=1:length(NovObj)
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

% % stacked bargraph

Med_NEW_Exc = [mean(App_NEW_duration_Exc),...
    mean(Bite_NEW_duration_Exc),...
    mean(Sniff_NEW_duration_Exc),...
    mean(Grab_NEW_duration_Exc),...
    mean(Carry_NEW_duration_Exc),...
    mean(Avoid_NEW_duration_Exc)];

Med_OLD_Exc = [mean(App_OLD_duration_Exc),...
    mean(Bite_OLD_duration_Exc),...
    mean(Sniff_OLD_duration_Exc),...
    mean(Grab_OLD_duration_Exc),...
    mean(Carry_OLD_duration_Exc),...
    mean(Avoid_OLD_duration_Exc)];

Med_NEW_control = [mean(App_NEW_duration_control),...
    mean(Bite_NEW_duration_control),...
    mean(Sniff_NEW_duration_control),...
    mean(Grab_NEW_duration_control),...
    mean(Carry_NEW_duration_control),...
    mean(Avoid_NEW_duration_control)];

Med_OLD_control = [mean(App_OLD_duration_control),...
    mean(Bite_OLD_duration_control),...
    mean(Sniff_OLD_duration_control),...
    mean(Grab_OLD_duration_control),...
    mean(Carry_OLD_duration_control),...
    mean(Avoid_OLD_duration_control)];

figure
bar([1,2],[Med_OLD_Exc;Med_NEW_Exc],'stacked')
legend({'Approach','Bite','Sniff','Grab','Carry','Avoid'})
box off
ylabel('Duration (s)','FontSize',24)
set(gcf,'color','white')
set(gca,'xticklabels',{'ChR2/Cricket','ChR2/NewObj'},'FontSize',20)
%

% ivt_graph({PB_duration_hab_0 , PB_duration_2 , PB_duration_3},[],'xticklabels',{'Control','Airpuff','After Airpuff'},'showpoints',1,'style','box','errorbars','sem','correction','Bonferroni')
% ylabel('PB Duration (s)','FontSize',24)
% box off
% set(gcf,'color','white')