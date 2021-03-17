GAD2_Inh = [];
for i=1:length(S)
    if strcmp(S(i).group,'GAD2_ZI_Inh')==1
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

figure
bar([1,2],[Med_OLD_Inh;Med_NEW_Inh],'stacked')
legend({'Approach','Sniff','Bite','Grab','Carry','Avoid'})
box off
ylabel('Duration (s)','FontSize',24)
set(gcf,'color','white')
set(gca,'xticklabels',{'Old Obj','New Obj'},'FontSize',20)
%% durations

ivt_graph({Sniff_OLD_duration_Inh,Sniff_NEW_duration_Inh},[],'xticklabels',{'Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.85 .325 .098])
ylabel('Sniff Duration (s; 2 min)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({Bite_OLD_duration_Inh,Bite_NEW_duration_Inh},[],'xticklabels',{'Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.929 .694 .125])
ylabel('Bite Duration (s; 2 min)','FontSize',24)
box off
set(gcf,'color','white')

ivt_graph({Grab_OLD_duration_Inh,Grab_NEW_duration_Inh},[],'xticklabels',{'Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.494 .184 .556])
ylabel('Grab Duration (s; 2 min)','FontSize',24)
box off
set(gcf,'color','white')

ivt_graph({Carry_OLD_duration_Inh,Carry_NEW_duration_Inh},[],'xticklabels',{'Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.466 .674 .188])
ylabel('Carry Duration (s; 2 min)','FontSize',24)
box off
set(gcf,'color','white')

ivt_graph({Avoid_OLD_duration_Inh,Avoid_NEW_duration_Inh},[],'xticklabels',{'Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.301 .745 .933])
ylabel('Avoid Duration (s; 2 min)','FontSize',24)
box off
set(gcf,'color','white')

ivt_graph({App_OLD_duration_Inh,App_NEW_duration_Inh},[],'xticklabels',{'Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[0 .447 .741])
ylabel('Approach Duration (s; 2 min)','FontSize',24)
box off
set(gcf,'color','white')
%% number of events

App_NEW_number_Inh = [];
App_OLD_number_Inh = [];
Carry_NEW_number_Inh = [];
Carry_OLD_number_Inh = [];
Avoid_NEW_number_Inh = [];
Avoid_OLD_number_Inh = [];

for i = GAD2_Inh
    % novel object
    if ~isempty(S(i).NovelObject)==1 && isfield(S(i).NovelObject,'NovOld')==1
        NovObj = S(i).NovelObject.NovOld;
        for j=1:length(NovObj)
            idx = NovObj{j}.ApproachNEW_start<120;
            NovObj{j}.ApproachNEW_start = NovObj{j}.ApproachNEW_start(idx);
            NovObj{j}.ApproachNEW_end = NovObj{j}.ApproachNEW_end(idx);
            if ~isempty(NovObj{j}.ApproachNEW_end) && NovObj{j}.ApproachNEW_end(end)>120
                NovObj{j}.ApproachNEW_end(end) = 120;
            end
            App_NEW_number_Inh = [App_NEW_number_Inh , length(NovObj{j}.ApproachNEW_end - NovObj{j}.ApproachNEW_start)];
            
            idx = NovObj{j}.ApproachOLD_start<120;
            NovObj{j}.ApproachOLD_start = NovObj{j}.ApproachOLD_start(idx);
            NovObj{j}.ApproachOLD_end = NovObj{j}.ApproachOLD_end(idx);
            if ~isempty(NovObj{j}.ApproachOLD_end) && NovObj{j}.ApproachOLD_end(end)>120
                NovObj{j}.ApproachOLD_end(end) = 120;
            end
            App_OLD_number_Inh = [App_OLD_number_Inh , length(NovObj{j}.ApproachOLD_end - NovObj{j}.ApproachOLD_start)];

            idx = NovObj{j}.CarryNEW_start<120;
            NovObj{j}.CarryNEW_start = NovObj{j}.CarryNEW_start(idx);
            NovObj{j}.CarryNEW_end = NovObj{j}.CarryNEW_end(idx);
            if ~isempty(NovObj{j}.CarryNEW_end) && NovObj{j}.CarryNEW_end(end)>120
                NovObj{j}.CarryNEW_end(end) = 120;
            end
            Carry_NEW_number_Inh = [Carry_NEW_number_Inh , length(NovObj{j}.CarryNEW_end - NovObj{j}.CarryNEW_start)];
            
            idx = NovObj{j}.CarryOLD_start<120;
            NovObj{j}.CarryOLD_start = NovObj{j}.CarryOLD_start(idx);
            NovObj{j}.CarryOLD_end = NovObj{j}.CarryOLD_end(idx);
            if ~isempty(NovObj{j}.CarryOLD_end) && NovObj{j}.CarryOLD_end(end)>120
                NovObj{j}.CarryOLD_end(end) = 120;
            end
            Carry_OLD_number_Inh = [Carry_OLD_number_Inh , length(NovObj{j}.CarryOLD_end - NovObj{j}.CarryOLD_start)];
            
            idx = NovObj{j}.AvoidNEW_start<120;
            NovObj{j}.AvoidNEW_start = NovObj{j}.AvoidNEW_start(idx);
            NovObj{j}.AvoidNEW_end = NovObj{j}.AvoidNEW_end(idx);
            if ~isempty(NovObj{j}.AvoidNEW_end) && NovObj{j}.AvoidNEW_end(end)>120
                NovObj{j}.AvoidNEW_end(end) = 120;
            end
            Avoid_NEW_number_Inh = [Avoid_NEW_number_Inh , length(NovObj{j}.AvoidNEW_end - NovObj{j}.AvoidNEW_start)];
            
            idx = NovObj{j}.AvoidOLD_start<120;
            NovObj{j}.AvoidOLD_start = NovObj{j}.AvoidOLD_start(idx);
            NovObj{j}.AvoidOLD_end = NovObj{j}.AvoidOLD_end(idx);
            if ~isempty(NovObj{j}.AvoidOLD_end) && NovObj{j}.AvoidOLD_end(end)>120
                NovObj{j}.AvoidOLD_end(end) = 120;
            end
            Avoid_OLD_number_Inh = [Avoid_OLD_number_Inh , length(NovObj{j}.AvoidOLD_end - NovObj{j}.AvoidOLD_start)];
        end
    end
end

ivt_graph({Carry_OLD_number_Inh,Carry_NEW_number_Inh},[],'xticklabels',{'Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.466 .674 .188])
ylabel('Carry Events (n)','FontSize',24)
box off
set(gcf,'color','white')

ivt_graph({Avoid_OLD_number_Inh,Avoid_NEW_number_Inh},[],'xticklabels',{'Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.301 .745 .933])
ylabel('Avoid Events (n)','FontSize',24)
box off
set(gcf,'color','white')

ivt_graph({App_OLD_number_Inh,App_NEW_number_Inh},[],'xticklabels',{'Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[0 .447 .741])
ylabel('Approach Events (n)','FontSize',24)
box off
set(gcf,'color','white')
