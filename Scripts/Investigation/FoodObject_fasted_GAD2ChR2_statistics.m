datapath = '\\vs01\csf_data\Shared\InVivo\Experiments\JAABA_analysis\Fasted_Food_NovelObject_controlGAD2';
dd = dir(fullfile([datapath,'\*','\**\'],'*LabelExtraction.mat'));
datapath = '\\vs01\csf_data\Shared\InVivo\Experiments\JAABA_analysis\Fasted_food_NovelObject_ChR2GAD2';
kk = dir(fullfile([datapath,'\*','\**\'],'*LabelExtraction.mat'));
S1 ={};
for i=1:length(dd)
    data_file = fullfile([dd(i).folder,'\',dd(i).name]);
    load(data_file);
    S1(i).NovelObject.NovOld = E;
end
S2 ={};
for i=1:length(kk)
    data_file = fullfile([kk(i).folder,'\',kk(i).name]);
    load(data_file);
    S2(i).NovelObject.NovOld = E;
end
S = [S1,S2];

GAD2_control = 1:length(dd);
GAD2_Exc = length(dd)+1:length(dd)+length(kk);


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
    if ~isempty(S(i).NovelObject)==1
    NovObj = S(i).NovelObject.NovOld;
    for j=1:length(NovObj)
            App_NEW_duration_Exc = [App_NEW_duration_Exc , sum(NovObj(j).ApproachNEW_end - NovObj(j).ApproachNEW_start)];
            App_OLD_duration_Exc = [App_OLD_duration_Exc , sum(NovObj(j).ApproachOLD_end - NovObj(j).ApproachOLD_start)];
            
            Sniff_NEW_duration_Exc = [Sniff_NEW_duration_Exc , sum(NovObj(j).SniffNEW_end - NovObj(j).SniffNEW_start)];
            Sniff_OLD_duration_Exc = [Sniff_OLD_duration_Exc , sum(NovObj(j).SniffOLD_end - NovObj(j).SniffOLD_start)];
            
            Bite_NEW_duration_Exc = [Bite_NEW_duration_Exc , sum(NovObj(j).BiteNEW_end - NovObj(j).BiteNEW_start)];
            Bite_OLD_duration_Exc = [Bite_OLD_duration_Exc , sum(NovObj(j).BiteOLD_end - NovObj(j).BiteOLD_start)];
            
            Grab_NEW_duration_Exc = [Grab_NEW_duration_Exc , sum(NovObj(j).GrabNEW_end - NovObj(j).GrabNEW_start)];
            Grab_OLD_duration_Exc = [Grab_OLD_duration_Exc , sum(NovObj(j).GrabOLD_end - NovObj(j).GrabOLD_start)];
            
            Carry_NEW_duration_Exc = [Carry_NEW_duration_Exc , sum(NovObj(j).CarryNEW_end - NovObj(j).CarryNEW_start)];
            Carry_OLD_duration_Exc = [Carry_OLD_duration_Exc , sum(NovObj(j).CarryOLD_end - NovObj(j).CarryOLD_start)];
            
            Avoid_NEW_duration_Exc = [Avoid_NEW_duration_Exc , sum(NovObj(j).AvoidNEW_end - NovObj(j).AvoidNEW_start)];
            Avoid_OLD_duration_Exc = [Avoid_OLD_duration_Exc , sum(NovObj(j).AvoidOLD_end - NovObj(j).AvoidOLD_start)];
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
        NovObj = S(i).NovelObject.NovOld;
        for j=1:length(NovObj)
            App_NEW_duration_control = [App_NEW_duration_control , sum(NovObj(j).ApproachNEW_end - NovObj(j).ApproachNEW_start)];
            App_OLD_duration_control = [App_OLD_duration_control , sum(NovObj(j).ApproachOLD_end - NovObj(j).ApproachOLD_start)];
            
            Sniff_NEW_duration_control = [Sniff_NEW_duration_control , sum(NovObj(j).SniffNEW_end - NovObj(j).SniffNEW_start)];
            Sniff_OLD_duration_control = [Sniff_OLD_duration_control , sum(NovObj(j).SniffOLD_end - NovObj(j).SniffOLD_start)];
            
            Bite_NEW_duration_control = [Bite_NEW_duration_control , sum(NovObj(j).BiteNEW_end - NovObj(j).BiteNEW_start)];
            Bite_OLD_duration_control = [Bite_OLD_duration_control , sum(NovObj(j).BiteOLD_end - NovObj(j).BiteOLD_start)];
            
            Grab_NEW_duration_control = [Grab_NEW_duration_control , sum(NovObj(j).GrabNEW_end - NovObj(j).GrabNEW_start)];
            Grab_OLD_duration_control = [Grab_OLD_duration_control , sum(NovObj(j).GrabOLD_end - NovObj(j).GrabOLD_start)];
            
            Carry_NEW_duration_control = [Carry_NEW_duration_control , sum(NovObj(j).CarryNEW_end - NovObj(j).CarryNEW_start)];
            Carry_OLD_duration_control = [Carry_OLD_duration_control , sum(NovObj(j).CarryOLD_end - NovObj(j).CarryOLD_start)];
            
            Avoid_NEW_duration_control = [Avoid_NEW_duration_control , sum(NovObj(j).AvoidNEW_end - NovObj(j).AvoidNEW_start)];
            Avoid_OLD_duration_control = [Avoid_OLD_duration_control , sum(NovObj(j).AvoidOLD_end - NovObj(j).AvoidOLD_start)];
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
bar([1,2,3,4],[Med_OLD_control;Med_NEW_control;Med_OLD_Exc;Med_NEW_Exc],'stacked')
legend({'Approach','Bite','Sniff','Grab','Carry','Avoid'})
box off
ylabel('Duration (s)','FontSize',24)
set(gcf,'color','white')
set(gca,'xticklabels',{'Cont/Food','Cont/NewObj','ChR2/Food','ChR2/NewObj'},'FontSize',20)
%% durations

ivt_graph({Sniff_OLD_duration_control,Sniff_NEW_duration_control},[],'xticklabels',{'Cont/Food','Cont/NewObj'},'showpoints',1,'errorbars','sem')
ylabel('Sniff Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({Sniff_OLD_duration_Exc,Sniff_NEW_duration_Exc},[],'xticklabels',{'ChR2/Food','ChR2/NewObj'},'showpoints',1,'errorbars','sem')
ylabel('Sniff Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({Bite_OLD_duration_control,Bite_NEW_duration_control},[],'xticklabels',{'Cont/Food','Cont/NewObj'},'showpoints',1,'errorbars','sem')
ylabel('Bite Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({Bite_OLD_duration_Exc,Bite_NEW_duration_Exc},[],'xticklabels',{'ChR2/Food','ChR2/NewObj'},'showpoints',1,'errorbars','sem')
ylabel('Bite Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({Grab_OLD_duration_control,Grab_NEW_duration_control},[],'xticklabels',{'Cont/Food','Cont/NewObj'},'showpoints',1,'errorbars','sem')
ylabel('Grab Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({Grab_OLD_duration_Exc,Grab_NEW_duration_Exc},[],'xticklabels',{'ChR2/Food','ChR2/NewObj'},'showpoints',1,'errorbars','sem')
ylabel('Grab Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({Carry_OLD_duration_control,Carry_NEW_duration_control},[],'xticklabels',{'Cont/Food','Cont/NewObj'},'showpoints',1,'errorbars','sem')
ylabel('Carry Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({Carry_OLD_duration_Exc,Carry_NEW_duration_Exc},[],'xticklabels',{'ChR2/Food','ChR2/NewObj'},'showpoints',1,'errorbars','sem')
ylabel('Carry Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({Avoid_OLD_duration_control,Avoid_NEW_duration_control},[],'xticklabels',{'Cont/Food','Cont/NewObj'},'showpoints',1,'errorbars','sem')
ylabel('Avoid Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({Avoid_OLD_duration_Exc,Avoid_NEW_duration_Exc},[],'xticklabels',{'ChR2/Food','ChR2/NewObj'},'showpoints',1,'errorbars','sem')
ylabel('Avoid Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({App_OLD_duration_control,App_NEW_duration_control},[],'xticklabels',{'Cont/Food','Cont/NewObj'},'showpoints',1,'errorbars','sem')
ylabel('App Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({App_OLD_duration_Exc,App_NEW_duration_Exc},[],'xticklabels',{'ChR2/Food','ChR2/NewObj'},'showpoints',1,'errorbars','sem')
ylabel('App Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')
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
            App_NEW_number_control = [App_NEW_number_control , length(NovObj(j).ApproachNEW_end - NovObj(j).ApproachNEW_start)];
            App_OLD_number_control = [App_OLD_number_control , length(NovObj(j).ApproachOLD_end - NovObj(j).ApproachOLD_start)];

            Carry_NEW_number_control = [Carry_NEW_number_control , length(NovObj(j).CarryNEW_end - NovObj(j).CarryNEW_start)];
            Carry_OLD_number_control = [Carry_OLD_number_control , length(NovObj(j).CarryOLD_end - NovObj(j).CarryOLD_start)];
            
            Avoid_NEW_number_control = [Avoid_NEW_number_control , length(NovObj(j).AvoidNEW_end - NovObj(j).AvoidNEW_start)];
            Avoid_OLD_number_control = [Avoid_OLD_number_control , length(NovObj(j).AvoidOLD_end - NovObj(j).AvoidOLD_start)];
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
            App_NEW_number_Exc = [App_NEW_number_Exc , length(NovObj(j).ApproachNEW_end - NovObj(j).ApproachNEW_start)];
            App_OLD_number_Exc = [App_OLD_number_Exc , length(NovObj(j).ApproachOLD_end - NovObj(j).ApproachOLD_start)];

            Carry_NEW_number_Exc = [Carry_NEW_number_Exc , length(NovObj(j).CarryNEW_end - NovObj(j).CarryNEW_start)];
            Carry_OLD_number_Exc = [Carry_OLD_number_Exc , length(NovObj(j).CarryOLD_end - NovObj(j).CarryOLD_start)];
            
            Avoid_NEW_number_Exc = [Avoid_NEW_number_Exc , length(NovObj(j).AvoidNEW_end - NovObj(j).AvoidNEW_start)];
            Avoid_OLD_number_Exc = [Avoid_OLD_number_Exc , length(NovObj(j).AvoidOLD_end - NovObj(j).AvoidOLD_start)];
        end
    end
end

% ivt_graph({Carry_OLD_number_control,Carry_NEW_number_control,Carry_OLD_number_Exc,Carry_NEW_number_Exc},[],'xticklabels',{'Cont/Food','Cont/NewObj','ChR2/Food','ChR2/NewObj'},'showpoints',1,'errorbars','sem','correction','Bonferroni')
% ylabel('Carry number (s)','FontSize',24)
% box off
% set(gcf,'color','white')
% 
% ivt_graph({Avoid_OLD_number_control,Avoid_NEW_number_control,Avoid_OLD_number_Exc,Avoid_NEW_number_Exc},[],'xticklabels',{'Cont/Food','Cont/NewObj','ChR2/Food','ChR2/NewObj'},'showpoints',1,'errorbars','sem')
% ylabel('Avoid number (s)','FontSize',24)
% box off
% set(gcf,'color','white')
% 
% ivt_graph({App_OLD_number_control,App_NEW_number_control,App_OLD_number_Exc,App_NEW_number_Exc},[],'xticklabels',{'Cont/Food','Cont/NewObj','ChR2/Food','ChR2/NewObj'},'showpoints',1,'errorbars','sem')
% ylabel('Approach number (s)','FontSize',24)
% box off
% set(gcf,'color','white')


ivt_graph({Carry_OLD_number_control,Carry_NEW_number_control},[],'xticklabels',{'Cont/Food','Cont/NewObj'},'showpoints',1,'errorbars','sem','correction','Bonferroni')
ylabel('Carry number (s)','FontSize',24)
box off
set(gcf,'color','white')

ivt_graph({Carry_OLD_number_Exc,Carry_NEW_number_Exc},[],'xticklabels',{'ChR2/Food','ChR2/NewObj'},'showpoints',1,'errorbars','sem','correction','Bonferroni')
ylabel('Carry number (s)','FontSize',24)
box off
set(gcf,'color','white')

ivt_graph({Avoid_OLD_number_control,Avoid_NEW_number_control},[],'xticklabels',{'Cont/Food','Cont/NewObj'},'showpoints',1,'errorbars','sem')
ylabel('Avoid number (s)','FontSize',24)
box off
set(gcf,'color','white')

ivt_graph({Avoid_OLD_number_Exc,Avoid_NEW_number_Exc},[],'xticklabels',{'ChR2/Food','ChR2/NewObj'},'showpoints',1,'errorbars','sem')
ylabel('Avoid number (s)','FontSize',24)
box off
set(gcf,'color','white')

ivt_graph({App_OLD_number_control,App_NEW_number_control},[],'xticklabels',{'Cont/Food','Cont/NewObj'},'showpoints',1,'errorbars','sem')
ylabel('Approach number (s)','FontSize',24)
box off
set(gcf,'color','white')

ivt_graph({App_OLD_number_Exc,App_NEW_number_Exc},[],'xticklabels',{'ChR2/Food','ChR2/NewObj'},'showpoints',1,'errorbars','sem')
ylabel('Approach number (s)','FontSize',24)
box off
set(gcf,'color','white')



Invest_NEW_control = Sniff_NEW_duration_control+Bite_NEW_duration_control+Carry_NEW_duration_control;
Invest_NEW_Exc = Sniff_NEW_duration_Exc+Bite_NEW_duration_Exc+Carry_NEW_duration_Exc;
Invest_OLD_control = Sniff_OLD_duration_control+Bite_OLD_duration_control+Carry_OLD_duration_control;
Invest_OLD_Exc = Sniff_OLD_duration_Exc+Bite_OLD_duration_Exc+Carry_OLD_duration_Exc;

% cd \\vs01\MVP\Shared\InVivo\Experiments\Investigation_Figures\GAD2\ChR2_Fasted_Food
ivt_graph({Invest_OLD_control Invest_NEW_control Invest_OLD_Exc Invest_NEW_Exc},[],'color','b','xticklabels',{'Food','Novel','Food','Novel'},'showpoints',1,'errorbars','sem')
ylabel('Investigation Duration (s)','FontSize',24)
box off
set(gcf,'color','white')
% savefig('Investigation_Duration.fig')
% saveas(gcf,'Investigation_Duration','epsc')