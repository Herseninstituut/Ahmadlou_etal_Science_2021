%% USE ONLY THIS ONE PLEASE 
%%

GAD2_control = [];
GAD2_Inh = [];
for i=1:length(S)
    if strcmp(S(i).group,'GAD2_ZI_Cont_10')==1 %|| strcmp(S(i).group,'GAD2_ZI_Cont_10')==1
        GAD2_control = [GAD2_control,i];
    elseif strcmp(S(i).group,'Gad2_ZI_Inh')==1
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
    if ~isempty(S(i).NovelObject)==1 && isfield(S(i).NovelObject,'NovOld')==1
    NovObj = S(i).NovelObject.NovOld;
    for j=1:length(NovObj)
            idx = NovObj{j}.ApproachNEW_start<120;
            NovObj{j}.ApproachNEW_start = NovObj{j}.ApproachNEW_start(idx);
            NovObj{j}.ApproachNEW_end = NovObj{j}.ApproachNEW_end(idx);
            if ~isempty(NovObj{j}.ApproachNEW_end) && NovObj{j}.ApproachNEW_end(end)>120
                NovObj{j}.ApproachNEW_end(end) = 120;
            end
            App_NEW_duration_Inh = [App_NEW_duration_Inh , sum(NovObj{j}.ApproachNEW_end - NovObj{j}.ApproachNEW_start)];
            
            idx = NovObj{j}.ApproachOLD_start<120;
            NovObj{j}.ApproachOLD_start = NovObj{j}.ApproachOLD_start(idx);
            NovObj{j}.ApproachOLD_end = NovObj{j}.ApproachOLD_end(idx);
            if ~isempty(NovObj{j}.ApproachOLD_end) && NovObj{j}.ApproachOLD_end(end)>120
                NovObj{j}.ApproachOLD_end(end) = 120;
            end
            App_OLD_duration_Inh = [App_OLD_duration_Inh , sum(NovObj{j}.ApproachOLD_end - NovObj{j}.ApproachOLD_start)];
            
            idx = NovObj{j}.SniffNEW_start<120;
            NovObj{j}.SniffNEW_start = NovObj{j}.SniffNEW_start(idx);
            NovObj{j}.SniffNEW_end = NovObj{j}.SniffNEW_end(idx);
            if ~isempty(NovObj{j}.SniffNEW_end) && NovObj{j}.SniffNEW_end(end)>120
                NovObj{j}.SniffNEW_end(end) = 120;
            end
            Sniff_NEW_duration_Inh = [Sniff_NEW_duration_Inh , sum(NovObj{j}.SniffNEW_end - NovObj{j}.SniffNEW_start)];
            
            idx = NovObj{j}.SniffOLD_start<120;
            NovObj{j}.SniffOLD_start = NovObj{j}.SniffOLD_start(idx);
            NovObj{j}.SniffOLD_end = NovObj{j}.SniffOLD_end(idx);
            if ~isempty(NovObj{j}.SniffOLD_end) && NovObj{j}.SniffOLD_end(end)>120
                NovObj{j}.SniffOLD_end(end) = 120;
            end
            Sniff_OLD_duration_Inh = [Sniff_OLD_duration_Inh , sum(NovObj{j}.SniffOLD_end - NovObj{j}.SniffOLD_start)];
            
            idx = NovObj{j}.BiteNEW_start<120;
            NovObj{j}.BiteNEW_start = NovObj{j}.BiteNEW_start(idx);
            NovObj{j}.BiteNEW_end = NovObj{j}.BiteNEW_end(idx);
            if ~isempty(NovObj{j}.BiteNEW_end) && NovObj{j}.BiteNEW_end(end)>120
                NovObj{j}.BiteNEW_end(end) = 120;
            end
            Bite_NEW_duration_Inh = [Bite_NEW_duration_Inh , sum(NovObj{j}.BiteNEW_end - NovObj{j}.BiteNEW_start)];
            
            idx = NovObj{j}.BiteOLD_start<120;
            NovObj{j}.BiteOLD_start = NovObj{j}.BiteOLD_start(idx);
            NovObj{j}.BiteOLD_end = NovObj{j}.BiteOLD_end(idx);
            if ~isempty(NovObj{j}.BiteOLD_end) && NovObj{j}.BiteOLD_end(end)>120
                NovObj{j}.BiteOLD_end(end) = 120;
            end
            Bite_OLD_duration_Inh = [Bite_OLD_duration_Inh , sum(NovObj{j}.BiteOLD_end - NovObj{j}.BiteOLD_start)];
            
            idx = NovObj{j}.GrabNEW_start<120;
            NovObj{j}.GrabNEW_start = NovObj{j}.GrabNEW_start(idx);
            NovObj{j}.GrabNEW_end = NovObj{j}.GrabNEW_end(idx);
            if ~isempty(NovObj{j}.GrabNEW_end) && NovObj{j}.GrabNEW_end(end)>120
                NovObj{j}.GrabNEW_end(end) = 120;
            end
            Grab_NEW_duration_Inh = [Grab_NEW_duration_Inh , sum(NovObj{j}.GrabNEW_end - NovObj{j}.GrabNEW_start)];
            
            idx = NovObj{j}.GrabOLD_start<120;
            NovObj{j}.GrabOLD_start = NovObj{j}.GrabOLD_start(idx);
            NovObj{j}.GrabOLD_end = NovObj{j}.GrabOLD_end(idx);
            if ~isempty(NovObj{j}.GrabOLD_end) && NovObj{j}.GrabOLD_end(end)>120
                NovObj{j}.GrabOLD_end(end) = 120;
            end
            Grab_OLD_duration_Inh = [Grab_OLD_duration_Inh , sum(NovObj{j}.GrabOLD_end - NovObj{j}.GrabOLD_start)];
            
            idx = NovObj{j}.CarryNEW_start<120;
            NovObj{j}.CarryNEW_start = NovObj{j}.CarryNEW_start(idx);
            NovObj{j}.CarryNEW_end = NovObj{j}.CarryNEW_end(idx);
            if ~isempty(NovObj{j}.CarryNEW_end) && NovObj{j}.CarryNEW_end(end)>120
                NovObj{j}.CarryNEW_end(end) = 120;
            end
            Carry_NEW_duration_Inh = [Carry_NEW_duration_Inh , sum(NovObj{j}.CarryNEW_end - NovObj{j}.CarryNEW_start)];
            
            idx = NovObj{j}.CarryOLD_start<120;
            NovObj{j}.CarryOLD_start = NovObj{j}.CarryOLD_start(idx);
            NovObj{j}.CarryOLD_end = NovObj{j}.CarryOLD_end(idx);
            if ~isempty(NovObj{j}.CarryOLD_end) && NovObj{j}.CarryOLD_end(end)>120
                NovObj{j}.CarryOLD_end(end) = 120;
            end
            Carry_OLD_duration_Inh = [Carry_OLD_duration_Inh , sum(NovObj{j}.CarryOLD_end - NovObj{j}.CarryOLD_start)];
            
            idx = NovObj{j}.AvoidNEW_start<120;
            NovObj{j}.AvoidNEW_start = NovObj{j}.AvoidNEW_start(idx);
            NovObj{j}.AvoidNEW_end = NovObj{j}.AvoidNEW_end(idx);
            if ~isempty(NovObj{j}.AvoidNEW_end) && NovObj{j}.AvoidNEW_end(end)>120
                NovObj{j}.AvoidNEW_end(end) = 120;
            end
            Avoid_NEW_duration_Inh = [Avoid_NEW_duration_Inh , sum(NovObj{j}.AvoidNEW_end - NovObj{j}.AvoidNEW_start)];
            
            idx = NovObj{j}.AvoidOLD_start<120;
            NovObj{j}.AvoidOLD_start = NovObj{j}.AvoidOLD_start(idx);
            NovObj{j}.AvoidOLD_end = NovObj{j}.AvoidOLD_end(idx);
            if ~isempty(NovObj{j}.AvoidOLD_end) && NovObj{j}.AvoidOLD_end(end)>120
                NovObj{j}.AvoidOLD_end(end) = 120;
            end
            Avoid_OLD_duration_Inh = [Avoid_OLD_duration_Inh , sum(NovObj{j}.AvoidOLD_end - NovObj{j}.AvoidOLD_start)];
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
            idx = NovObj{j}.ApproachNEW_start<120;
            NovObj{j}.ApproachNEW_start = NovObj{j}.ApproachNEW_start(idx);
            NovObj{j}.ApproachNEW_end = NovObj{j}.ApproachNEW_end(idx);
            if ~isempty(NovObj{j}.ApproachNEW_end) && NovObj{j}.ApproachNEW_end(end)>120
                NovObj{j}.ApproachNEW_end(end) = 120;
            end
            App_NEW_duration_control = [App_NEW_duration_control , sum(NovObj{j}.ApproachNEW_end - NovObj{j}.ApproachNEW_start)];
            
            idx = NovObj{j}.ApproachOLD_start<120;
            NovObj{j}.ApproachOLD_start = NovObj{j}.ApproachOLD_start(idx);
            NovObj{j}.ApproachOLD_end = NovObj{j}.ApproachOLD_end(idx);
            if ~isempty(NovObj{j}.ApproachOLD_end) && NovObj{j}.ApproachOLD_end(end)>120
                NovObj{j}.ApproachOLD_end(end) = 120;
            end
            App_OLD_duration_control = [App_OLD_duration_control , sum(NovObj{j}.ApproachOLD_end - NovObj{j}.ApproachOLD_start)];
            
            idx = NovObj{j}.SniffNEW_start<120;
            NovObj{j}.SniffNEW_start = NovObj{j}.SniffNEW_start(idx);
            NovObj{j}.SniffNEW_end = NovObj{j}.SniffNEW_end(idx);
            if ~isempty(NovObj{j}.SniffNEW_end) && NovObj{j}.SniffNEW_end(end)>120
                NovObj{j}.SniffNEW_end(end) = 120;
            end
            Sniff_NEW_duration_control = [Sniff_NEW_duration_control , sum(NovObj{j}.SniffNEW_end - NovObj{j}.SniffNEW_start)];
            
            idx = NovObj{j}.SniffOLD_start<120;
            NovObj{j}.SniffOLD_start = NovObj{j}.SniffOLD_start(idx);
            NovObj{j}.SniffOLD_end = NovObj{j}.SniffOLD_end(idx);
            if ~isempty(NovObj{j}.SniffOLD_end) && NovObj{j}.SniffOLD_end(end)>120
                NovObj{j}.SniffOLD_end(end) = 120;
            end
            Sniff_OLD_duration_control = [Sniff_OLD_duration_control , sum(NovObj{j}.SniffOLD_end - NovObj{j}.SniffOLD_start)];
            
            idx = NovObj{j}.BiteNEW_start<120;
            NovObj{j}.BiteNEW_start = NovObj{j}.BiteNEW_start(idx);
            NovObj{j}.BiteNEW_end = NovObj{j}.BiteNEW_end(idx);
            if ~isempty(NovObj{j}.BiteNEW_end) && NovObj{j}.BiteNEW_end(end)>120
                NovObj{j}.BiteNEW_end(end) = 120;
            end
            Bite_NEW_duration_control = [Bite_NEW_duration_control , sum(NovObj{j}.BiteNEW_end - NovObj{j}.BiteNEW_start)];
            
            idx = NovObj{j}.BiteOLD_start<120;
            NovObj{j}.BiteOLD_start = NovObj{j}.BiteOLD_start(idx);
            NovObj{j}.BiteOLD_end = NovObj{j}.BiteOLD_end(idx);
            if ~isempty(NovObj{j}.BiteOLD_end) && NovObj{j}.BiteOLD_end(end)>120
                NovObj{j}.BiteOLD_end(end) = 120;
            end
            Bite_OLD_duration_control = [Bite_OLD_duration_control , sum(NovObj{j}.BiteOLD_end - NovObj{j}.BiteOLD_start)];
            
            idx = NovObj{j}.GrabNEW_start<120;
            NovObj{j}.GrabNEW_start = NovObj{j}.GrabNEW_start(idx);
            NovObj{j}.GrabNEW_end = NovObj{j}.GrabNEW_end(idx);
            if ~isempty(NovObj{j}.GrabNEW_end) && NovObj{j}.GrabNEW_end(end)>120
                NovObj{j}.GrabNEW_end(end) = 120;
            end
            Grab_NEW_duration_control = [Grab_NEW_duration_control , sum(NovObj{j}.GrabNEW_end - NovObj{j}.GrabNEW_start)];
            
            idx = NovObj{j}.GrabOLD_start<120;
            NovObj{j}.GrabOLD_start = NovObj{j}.GrabOLD_start(idx);
            NovObj{j}.GrabOLD_end = NovObj{j}.GrabOLD_end(idx);
            if ~isempty(NovObj{j}.GrabOLD_end) && NovObj{j}.GrabOLD_end(end)>120
                NovObj{j}.GrabOLD_end(end) = 120;
            end
            Grab_OLD_duration_control = [Grab_OLD_duration_control , sum(NovObj{j}.GrabOLD_end - NovObj{j}.GrabOLD_start)];
            
            idx = NovObj{j}.CarryNEW_start<120;
            NovObj{j}.CarryNEW_start = NovObj{j}.CarryNEW_start(idx);
            NovObj{j}.CarryNEW_end = NovObj{j}.CarryNEW_end(idx);
            if ~isempty(NovObj{j}.CarryNEW_end) && NovObj{j}.CarryNEW_end(end)>120
                NovObj{j}.CarryNEW_end(end) = 120;
            end
            Carry_NEW_duration_control = [Carry_NEW_duration_control , sum(NovObj{j}.CarryNEW_end - NovObj{j}.CarryNEW_start)];
            
            idx = NovObj{j}.CarryOLD_start<120;
            NovObj{j}.CarryOLD_start = NovObj{j}.CarryOLD_start(idx);
            NovObj{j}.CarryOLD_end = NovObj{j}.CarryOLD_end(idx);
            if ~isempty(NovObj{j}.CarryOLD_end) && NovObj{j}.CarryOLD_end(end)>120
                NovObj{j}.CarryOLD_end(end) = 120;
            end
            Carry_OLD_duration_control = [Carry_OLD_duration_control , sum(NovObj{j}.CarryOLD_end - NovObj{j}.CarryOLD_start)];
            
            idx = NovObj{j}.AvoidNEW_start<120;
            NovObj{j}.AvoidNEW_start = NovObj{j}.AvoidNEW_start(idx);
            NovObj{j}.AvoidNEW_end = NovObj{j}.AvoidNEW_end(idx);
            if ~isempty(NovObj{j}.AvoidNEW_end) && NovObj{j}.AvoidNEW_end(end)>120
                NovObj{j}.AvoidNEW_end(end) = 120;
            end
            Avoid_NEW_duration_control = [Avoid_NEW_duration_control , sum(NovObj{j}.AvoidNEW_end - NovObj{j}.AvoidNEW_start)];
            
            idx = NovObj{j}.AvoidOLD_start<120;
            NovObj{j}.AvoidOLD_start = NovObj{j}.AvoidOLD_start(idx);
            NovObj{j}.AvoidOLD_end = NovObj{j}.AvoidOLD_end(idx);
            if ~isempty(NovObj{j}.AvoidOLD_end) && NovObj{j}.AvoidOLD_end(end)>120
                NovObj{j}.AvoidOLD_end(end) = 120;
            end
            Avoid_OLD_duration_control = [Avoid_OLD_duration_control , sum(NovObj{j}.AvoidOLD_end - NovObj{j}.AvoidOLD_start)];
        end
    end
end
% % stacked bargraph

Med_NEW_Inh = [mean(App_NEW_duration_Inh),...
    mean(Sniff_NEW_duration_Inh),...    
    mean(Bite_NEW_duration_Inh),...
    mean(Grab_NEW_duration_Inh),...
    mean(Carry_NEW_duration_Inh),...
    mean(Avoid_NEW_duration_Inh)];

Med_OLD_Inh = [mean(App_OLD_duration_Inh),...
    mean(Sniff_OLD_duration_Inh),...
    mean(Bite_OLD_duration_Inh),...    
    mean(Grab_OLD_duration_Inh),...
    mean(Carry_OLD_duration_Inh),...
    mean(Avoid_OLD_duration_Inh)];

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

figure
bar([1,2,3,4],[Med_OLD_control;Med_NEW_control;Med_OLD_Inh;Med_NEW_Inh],'stacked')
legend({'Approach','Sniff','Bite','Grab','Carry','Avoid'})
box off
ylabel('Duration (s; 2 min)','FontSize',24)
set(gcf,'color','white')
set(gca,'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'FontSize',20)
hold on
annotation('textbox',[.23 .84 .27 .11],'String','GAD2 Control','FontName','Arial','FontSize',22.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
annotation('textbox',[.52 .84 .27 .11],'String','PV ChR2','FontName','Arial','FontSize',22.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
%% durations

ivt_graph({Sniff_OLD_duration_control,Sniff_NEW_duration_control,Sniff_OLD_duration_Inh,Sniff_NEW_duration_Inh},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.85 .325 .098])
ylabel('Sniff Duration (s; 2 min)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')
hold on
annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');

ivt_graph({Bite_OLD_duration_control,Bite_NEW_duration_control,Bite_OLD_duration_Inh,Bite_NEW_duration_Inh},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.929 .694 .125])
ylabel('Bite Duration (s; 2 min)','FontSize',24)
box off
set(gcf,'color','white')
hold on
annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');

ivt_graph({Grab_OLD_duration_control,Grab_NEW_duration_control,Grab_OLD_duration_Inh,Grab_NEW_duration_Inh},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.494 .184 .556])
ylabel('Grab Duration (s; 2 min)','FontSize',24)
box off
set(gcf,'color','white')
hold on
annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');

ivt_graph({Carry_OLD_duration_control,Carry_NEW_duration_control,Carry_OLD_duration_Inh,Carry_NEW_duration_Inh},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.466 .674 .188])
ylabel('Carry Duration (s; 2 min)','FontSize',24)
box off
set(gcf,'color','white')
hold on
annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');

ivt_graph({Avoid_OLD_duration_control,Avoid_NEW_duration_control,Avoid_OLD_duration_Inh,Avoid_NEW_duration_Inh},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.301 .745 .933])
ylabel('Avoid Duration (s; 2 min)','FontSize',24)
box off
set(gcf,'color','white')
hold on
annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');

ivt_graph({App_OLD_duration_control,App_NEW_duration_control,App_OLD_duration_Inh,App_NEW_duration_Inh},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[0 .447 .741])
ylabel('Approach Duration (s; 2 min)','FontSize',24)
box off
set(gcf,'color','white')
hold on
annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
%% number of events

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
            App_NEW_number_control = [App_NEW_number_control , sum(NovObj{j}.ApproachNEW_start<120)];
            App_OLD_number_control = [App_OLD_number_control , sum(NovObj{j}.ApproachOLD_start<120)];
            
            Carry_NEW_number_control = [Carry_NEW_number_control , sum(NovObj{j}.CarryNEW_start<120)];
            Carry_OLD_number_control = [Carry_OLD_number_control , sum(NovObj{j}.CarryOLD_start<120)];
            
            Avoid_NEW_number_control = [Avoid_NEW_number_control , sum(NovObj{j}.AvoidNEW_start<120)];
            Avoid_OLD_number_control = [Avoid_OLD_number_control , sum(NovObj{j}.AvoidOLD_start<120)];
        end
    end
end

App_NEW_number_Inh = [];
App_OLD_number_Inh = [];
Carry_NEW_number_Inh = [];
Carry_OLD_number_Inh = [];
Avoid_NEW_number_Inh = [];
Avoid_OLD_number_Inh = [];

for i = GAD2_Inh
    % novel object
    if ~isempty(S(i).NovelObject)==1
        NovObj = S(i).NovelObject.NovOld;
        for j=1:length(NovObj)
            App_NEW_number_Inh = [App_NEW_number_Inh , sum(NovObj{j}.ApproachNEW_start<120)];
            App_OLD_number_Inh = [App_OLD_number_Inh , sum(NovObj{j}.ApproachOLD_start<120)];
            
            Carry_NEW_number_Inh = [Carry_NEW_number_Inh , sum(NovObj{j}.CarryNEW_start<120)];
            Carry_OLD_number_Inh = [Carry_OLD_number_Inh , sum(NovObj{j}.CarryOLD_start<120)];
            
            Avoid_NEW_number_Inh = [Avoid_NEW_number_Inh , sum(NovObj{j}.AvoidNEW_start<120)];
            Avoid_OLD_number_Inh = [Avoid_OLD_number_Inh , sum(NovObj{j}.AvoidOLD_start<120)];
        end
    end
end

ivt_graph({Carry_OLD_number_control,Carry_NEW_number_control,Carry_OLD_number_Inh,Carry_NEW_number_Inh},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.466 .674 .188])
ylabel('Carry Events (n)','FontSize',24)
box off
set(gcf,'color','white')
hold on
annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');

ivt_graph({Avoid_OLD_number_control,Avoid_NEW_number_control,Avoid_OLD_number_Inh,Avoid_NEW_number_Inh},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.301 .745 .933])
ylabel('Avoid Events (n)','FontSize',24)
box off
set(gcf,'color','white')
hold on
annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');

ivt_graph({App_OLD_number_control,App_NEW_number_control,App_OLD_number_Inh,App_NEW_number_Inh},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[0 .447 .741])
ylabel('Approach Events (n)','FontSize',24)
box off
set(gcf,'color','white')
hold on
annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
