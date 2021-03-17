GAD2_B6 = [];
GAD2_Inh = [];
for i=1:length(S)
    if strcmp(S(i).group,'B6')==1
        GAD2_B6 = [GAD2_B6,i];
    elseif strcmp(S(i).group,'GAD2_ZI_Inh')==1
        GAD2_Inh = [GAD2_Inh,i];
    end
end


App_NEW_duration_Inh = [];
App_OLD_duration_Inh = [];
Bite_NEW_duration_Inh = [];
Bite_OLD_duration_Inh = [];
Sniff_NEW_duration_Inh = [];
Sniff_OLD_duration_Inh = [];
Grab_NEW_duration_Inh = [];
Grab_OLD_duration_Inh = [];
Carry_NEW_duration_Inh = [];
Carry_OLD_duration_Inh = [];
Avoid_NEW_duration_Inh = [];
Avoid_OLD_duration_Inh = [];

for i = GAD2_Inh
    % push bedding
    if ~isempty(S(i).NovelObject)==1
    NovObj = S(i).NovelObject.NovOld;
    for j=1:length(NovObj)
            App_NEW_duration_Inh = [App_NEW_duration_Inh , sum(NovObj{j}.ApproachNEW_end - NovObj{j}.ApproachNEW_start)];
            App_OLD_duration_Inh = [App_OLD_duration_Inh , sum(NovObj{j}.ApproachOLD_end - NovObj{j}.ApproachOLD_start)];
            
            Sniff_NEW_duration_Inh = [Sniff_NEW_duration_Inh , sum(NovObj{j}.SniffNEW_end - NovObj{j}.SniffNEW_start)];
            Sniff_OLD_duration_Inh = [Sniff_OLD_duration_Inh , sum(NovObj{j}.SniffOLD_end - NovObj{j}.SniffOLD_start)];
            
            Bite_NEW_duration_Inh = [Bite_NEW_duration_Inh , sum(NovObj{j}.BiteNEW_end - NovObj{j}.BiteNEW_start)];
            Bite_OLD_duration_Inh = [Bite_OLD_duration_Inh , sum(NovObj{j}.BiteOLD_end - NovObj{j}.BiteOLD_start)];
            
            Grab_NEW_duration_Inh = [Grab_NEW_duration_Inh , sum(NovObj{j}.GrabNEW_end - NovObj{j}.GrabNEW_start)];
            Grab_OLD_duration_Inh = [Grab_OLD_duration_Inh , sum(NovObj{j}.GrabOLD_end - NovObj{j}.GrabOLD_start)];
            
            Carry_NEW_duration_Inh = [Carry_NEW_duration_Inh , sum(NovObj{j}.CarryNEW_end - NovObj{j}.CarryNEW_start)];
            Carry_OLD_duration_Inh = [Carry_OLD_duration_Inh , sum(NovObj{j}.CarryOLD_end - NovObj{j}.CarryOLD_start)];
            
            Avoid_NEW_duration_Inh = [Avoid_NEW_duration_Inh , sum(NovObj{j}.AvoidNEW_end - NovObj{j}.AvoidNEW_start)];
            Avoid_OLD_duration_Inh = [Avoid_OLD_duration_Inh , sum(NovObj{j}.AvoidOLD_end - NovObj{j}.AvoidOLD_start)];
        end
    end
end


App_NEW_duration_B6 = [];
App_OLD_duration_B6 = [];
Bite_NEW_duration_B6 = [];
Bite_OLD_duration_B6 = [];
Sniff_NEW_duration_B6 = [];
Sniff_OLD_duration_B6 = [];
Grab_NEW_duration_B6 = [];
Grab_OLD_duration_B6 = [];
Carry_NEW_duration_B6 = [];
Carry_OLD_duration_B6 = [];
Avoid_NEW_duration_B6 = [];
Avoid_OLD_duration_B6 = [];

for i = GAD2_B6
    % push bedding
    if ~isempty(S(i).NovelObject)==1
        NovObj = S(i).NovelObject.NovOld;
        for j=1:length(NovObj)
            App_NEW_duration_B6 = [App_NEW_duration_B6 , sum(NovObj{j}.ApproachNEW_end - NovObj{j}.ApproachNEW_start)];
            App_OLD_duration_B6 = [App_OLD_duration_B6 , sum(NovObj{j}.ApproachOLD_end - NovObj{j}.ApproachOLD_start)];
            
            Sniff_NEW_duration_B6 = [Sniff_NEW_duration_B6 , sum(NovObj{j}.SniffNEW_end - NovObj{j}.SniffNEW_start)];
            Sniff_OLD_duration_B6 = [Sniff_OLD_duration_B6 , sum(NovObj{j}.SniffOLD_end - NovObj{j}.SniffOLD_start)];
            
            Bite_NEW_duration_B6 = [Bite_NEW_duration_B6 , sum(NovObj{j}.BiteNEW_end - NovObj{j}.BiteNEW_start)];
            Bite_OLD_duration_B6 = [Bite_OLD_duration_B6 , sum(NovObj{j}.BiteOLD_end - NovObj{j}.BiteOLD_start)];
            
            Grab_NEW_duration_B6 = [Grab_NEW_duration_B6 , sum(NovObj{j}.GrabNEW_end - NovObj{j}.GrabNEW_start)];
            Grab_OLD_duration_B6 = [Grab_OLD_duration_B6 , sum(NovObj{j}.GrabOLD_end - NovObj{j}.GrabOLD_start)];
            
            Carry_NEW_duration_B6 = [Carry_NEW_duration_B6 , sum(NovObj{j}.CarryNEW_end - NovObj{j}.CarryNEW_start)];
            Carry_OLD_duration_B6 = [Carry_OLD_duration_B6 , sum(NovObj{j}.CarryOLD_end - NovObj{j}.CarryOLD_start)];
            
            Avoid_NEW_duration_B6 = [Avoid_NEW_duration_B6 , sum(NovObj{j}.AvoidNEW_end - NovObj{j}.AvoidNEW_start)];
            Avoid_OLD_duration_B6 = [Avoid_OLD_duration_B6 , sum(NovObj{j}.AvoidOLD_end - NovObj{j}.AvoidOLD_start)];
        end
    end
end

% % stacked bargraph

Med_NEW_Inh = [mean(App_NEW_duration_Inh),...
    mean(Bite_NEW_duration_Inh),...
    mean(Sniff_NEW_duration_Inh),...
    mean(Grab_NEW_duration_Inh),...
    mean(Carry_NEW_duration_Inh),...
    mean(Avoid_NEW_duration_Inh)];

Med_OLD_Inh = [mean(App_OLD_duration_Inh),...
    mean(Bite_OLD_duration_Inh),...
    mean(Sniff_OLD_duration_Inh),...
    mean(Grab_OLD_duration_Inh),...
    mean(Carry_OLD_duration_Inh),...
    mean(Avoid_OLD_duration_Inh)];

Med_NEW_B6 = [mean(App_NEW_duration_B6),...
    mean(Bite_NEW_duration_B6),...
    mean(Sniff_NEW_duration_B6),...
    mean(Grab_NEW_duration_B6),...
    mean(Carry_NEW_duration_B6),...
    mean(Avoid_NEW_duration_B6)];

Med_OLD_B6 = [mean(App_OLD_duration_B6),...
    mean(Bite_OLD_duration_B6),...
    mean(Sniff_OLD_duration_B6),...
    mean(Grab_OLD_duration_B6),...
    mean(Carry_OLD_duration_B6),...
    mean(Avoid_OLD_duration_B6)];

figure
bar([1,2,3,4],[Med_OLD_B6;Med_NEW_B6;Med_OLD_Inh;Med_NEW_Inh],'stacked')
legend({'Approach','Bite','Sniff','Grab','Carry','Avoid'})
box off
ylabel('Duration (s)','FontSize',24)
set(gcf,'color','white')
set(gca,'xticklabels',{'Cont/OldObj','Cont/NewObj','ACR2/OldObj','ACR2/NewObj'},'FontSize',20)

%

ivt_graph({Sniff_OLD_duration_B6,Sniff_NEW_duration_B6,Sniff_OLD_duration_Inh,Sniff_NEW_duration_Inh},[],'xticklabels',{'Old B6','New B6','Old Inh','New Inh'},'showpoints',1,'style','box','errorbars','sem')
ylabel('Sniff Duration (s)','FontSize',24)
box off
set(gcf,'color','white')