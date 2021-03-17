%load Session.mat
load('\\vs01\csf_data\Shared\InVivo\Experiments\JAABA_analysis\SessionUpdates\Session_Object_Social_26032020.mat')

GAD2_B6 = [];
GAD2_Inh = [];
for i=1:length(S)
    if strcmp(S(i).group,'B6')==1
        GAD2_B6 = [GAD2_B6,i];
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
    % novel object
    if ~isempty(S(i).NovelObject)==1 && isfield(S(i).NovelObject,'NovOld')==1
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

Med_NEW_B6 = [mean(App_NEW_duration_B6),...
    mean(Sniff_NEW_duration_B6),...
    mean(Bite_NEW_duration_B6),...
    mean(Grab_NEW_duration_B6),...
    mean(Carry_NEW_duration_B6),...
    mean(Avoid_NEW_duration_B6)];

Med_OLD_B6 = [mean(App_OLD_duration_B6),...
    mean(Sniff_OLD_duration_B6),...
    mean(Bite_OLD_duration_B6),...
    mean(Grab_OLD_duration_B6),...
    mean(Carry_OLD_duration_B6),...
    mean(Avoid_OLD_duration_B6)];

figure
bar([1,2],[Med_OLD_B6;Med_NEW_B6],'stacked')
legend({'Approach','Sniff','Bite','Grab','Carry','Avoid'})
box off
ylabel('Duration (s)','FontSize',24)
set(gcf,'color','white')
set(gca,'xticklabels',{'Old Object','New Object'},'FontSize',20)

%

ivt_graph({Sniff_OLD_duration_B6,Sniff_NEW_duration_B6},[],'color',[0.4 0.5 0.2],'xticklabels',{'Old Object','New Object'},'showpoints',1,'errorbars','sem')
ylabel('Duration (s)','FontSize',24)
title('Sniff')
box off
set(gcf,'color','white')

ivt_graph({Bite_OLD_duration_B6,Bite_NEW_duration_B6},[],'color',[0.4 0.5 0.2],'xticklabels',{'Old Object','New Object'},'showpoints',1,'errorbars','sem')
ylabel(' Duration (s)','FontSize',24)
title('Bite')
box off
set(gcf,'color','white')

ivt_graph({Grab_OLD_duration_B6,Grab_NEW_duration_B6},[],'color',[0.4 0.5 0.2],'xticklabels',{'Old Object','New Object'},'showpoints',1,'errorbars','sem')
ylabel(' Duration (s)','FontSize',24)
title('Grab')
box off
set(gcf,'color','white')

ivt_graph({Carry_OLD_duration_B6,Carry_NEW_duration_B6},[],'color',[0.4 0.5 0.2],'xticklabels',{'Old Object','New Object'},'showpoints',1,'errorbars','sem')
ylabel(' Duration (s)','FontSize',24)
title('Carry')
box off
set(gcf,'color','white')

ivt_graph({Avoid_OLD_duration_B6,Avoid_NEW_duration_B6},[],'color',[0.4 0.5 0.2],'xticklabels',{'Old Object','New Object'},'showpoints',1,'errorbars','sem')
ylabel(' Duration (s)','FontSize',24)
title('Avoid')
box off
set(gcf,'color','white')

ivt_graph({App_OLD_duration_B6,App_NEW_duration_B6},[],'color',[0.4 0.5 0.2],'xticklabels',{'Old Object','New Object'},'showpoints',1,'errorbars','sem')
ylabel(' Duration (s)','FontSize',24)
plot(App_OLD_duration_B6, App_NEW_duration_B6, 'k')
title('Approach')
box off
set(gcf,'color','white')


App_NEW_number_B6 = [];
App_OLD_number_B6 = [];
Carry_NEW_number_B6 = [];
Carry_OLD_number_B6 = [];
Avoid_NEW_number_B6 = [];
Avoid_OLD_number_B6 = [];

for i = GAD2_B6
    % novel object
    if ~isempty(S(i).NovelObject)==1 && isfield(S(i).NovelObject,'NovOld')==1
        NovObj = S(i).NovelObject.NovOld;
        for j=1:length(NovObj)
            App_NEW_number_B6 = [App_NEW_number_B6 , length(NovObj{j}.ApproachNEW_end - NovObj{j}.ApproachNEW_start)];
            App_OLD_number_B6 = [App_OLD_number_B6 , length(NovObj{j}.ApproachOLD_end - NovObj{j}.ApproachOLD_start)];

            Carry_NEW_number_B6 = [Carry_NEW_number_B6 , length(NovObj{j}.CarryNEW_end - NovObj{j}.CarryNEW_start)];
            Carry_OLD_number_B6 = [Carry_OLD_number_B6 , length(NovObj{j}.CarryOLD_end - NovObj{j}.CarryOLD_start)];
            
            Avoid_NEW_number_B6 = [Avoid_NEW_number_B6 , length(NovObj{j}.AvoidNEW_end - NovObj{j}.AvoidNEW_start)];
            Avoid_OLD_number_B6 = [Avoid_OLD_number_B6 , length(NovObj{j}.AvoidOLD_end - NovObj{j}.AvoidOLD_start)];
        end
    end
end

ivt_graph({App_OLD_number_B6,App_NEW_number_B6},[],'xticklabels',{'Old Object','New Object'},'showpoints',1,'errorbars','sem')
ylabel('Approach number','FontSize',24)
box off
set(gcf,'color','white')

ivt_graph({Carry_OLD_number_B6,Carry_NEW_number_B6},[],'xticklabels',{'Old Object','New Object'},'showpairing', 'true','showpoints',1,'errorbars','sem')
ylabel('Carry number','FontSize',24)
box off
set(gcf,'color','white')

ivt_graph({Avoid_OLD_number_B6,Avoid_NEW_number_B6},[],'xticklabels',{'Old Object','New Object'},'showpoints',1,'errorbars','sem')
ylabel('Avoid number','FontSize',24)
box off
set(gcf,'color','white')

