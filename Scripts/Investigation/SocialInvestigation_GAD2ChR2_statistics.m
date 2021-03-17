GAD2_control = [];
GAD2_Exc = [];
for i=1:length(S)
    if strcmp(S(i).group,'GAD2_ZI_Cont')==1 || strcmp(S(i).group,'GAD2_ZI_Cont_10')==1
        GAD2_control = [GAD2_control,i];
    elseif strcmp(S(i).group,'GAD2_ZI_Exc')==1
        GAD2_Exc = [GAD2_Exc,i];
    end
end


App1_duration_Exc = [];
Follow_duration_Exc = [];
Accept_duration_Exc = [];
Avoid_duration_Exc = [];
Def1_duration_Exc = [];
Anogenital_duration_Exc = [];
Facial_duration_Exc = [];
Body_duration_Exc = [];
Grab_duration_Exc = [];
App2_duration_Exc = [];
Def2_duration_Exc = [];


for i = GAD2_Exc
    % push bedding
    if ~isempty(S(i).Social)==1 %%%%%%%
    NovObj = S(i).Social; %%%%%%
    for j=1:length(NovObj)
            App1_duration_Exc = [App1_duration_Exc , sum(NovObj{j}.App1_end - NovObj{j}.App1_start)];
            Follow_duration_Exc = [Follow_duration_Exc , sum(NovObj{j}.Follow_end - NovObj{j}.Follow_start)];
            Accept_duration_Exc = [Accept_duration_Exc , sum(NovObj{j}.Accept_end - NovObj{j}.Accept_start)];
            Avoid_duration_Exc = [Avoid_duration_Exc , sum(NovObj{j}.Avoid_end - NovObj{j}.Avoid_start)];
            Def1_duration_Exc = [Def1_duration_Exc , sum(NovObj{j}.Def1_end - NovObj{j}.Def1_start)];
            Anogenital_duration_Exc = [Anogenital_duration_Exc , sum(NovObj{j}.Anogenital_end - NovObj{j}.Anogenital_start)];
            Facial_duration_Exc = [Facial_duration_Exc , sum(NovObj{j}.Facial_end - NovObj{j}.Facial_start)];
            Body_duration_Exc = [Body_duration_Exc , sum(NovObj{j}.Body_end - NovObj{j}.Body_start)];
            Grab_duration_Exc = [Grab_duration_Exc , sum(NovObj{j}.Grab_end - NovObj{j}.Grab_start)];
            App2_duration_Exc = [App2_duration_Exc , sum(NovObj{j}.App2_end - NovObj{j}.App2_start)];
            Def2_duration_Exc = [Def2_duration_Exc , sum(NovObj{j}.Def2_end - NovObj{j}.Def2_start)];
        end
    end
end


App1_duration_control = [];
Follow_duration_control = [];
Accept_duration_control = [];
Avoid_duration_control = [];
Def1_duration_control = [];
Anogenital_duration_control = [];
Facial_duration_control = [];
Body_duration_control = [];
Grab_duration_control = [];
App2_duration_control = [];
Def2_duration_control = [];

for i = GAD2_control
    % push bedding
    if ~isempty(S(i).Social)==1 %%%%%%
        NovObj = S(i).Social; %%%%%%
        for j=1:length(NovObj)
            App1_duration_control = [App1_duration_control , sum(NovObj{j}.App1_end - NovObj{j}.App1_start)];
            Follow_duration_control = [Follow_duration_control , sum(NovObj{j}.Follow_end - NovObj{j}.Follow_start)];
            Accept_duration_control = [Accept_duration_control , sum(NovObj{j}.Accept_end - NovObj{j}.Accept_start)];
            Avoid_duration_control = [Avoid_duration_control , sum(NovObj{j}.Avoid_end - NovObj{j}.Avoid_start)];
            Def1_duration_control = [Def1_duration_control , sum(NovObj{j}.Def1_end - NovObj{j}.Def1_start)];
            Anogenital_duration_control = [Anogenital_duration_control , sum(NovObj{j}.Anogenital_end - NovObj{j}.Anogenital_start)];
            Facial_duration_control = [Facial_duration_control , sum(NovObj{j}.Facial_end - NovObj{j}.Facial_start)];
            Body_duration_control = [Body_duration_control , sum(NovObj{j}.Body_end - NovObj{j}.Body_start)];
            Grab_duration_control = [Grab_duration_control , sum(NovObj{j}.Grab_end - NovObj{j}.Grab_start)];
            App2_duration_control = [App2_duration_control , sum(NovObj{j}.App2_end - NovObj{j}.App2_start)];
            Def2_duration_control = [Def2_duration_control , sum(NovObj{j}.Def2_end - NovObj{j}.Def2_start)];
        end
    end
end

% % stacked bargraph

Med_Exc = [mean(App1_duration_Exc),...
    mean(Follow_duration_Exc),...
    mean(Accept_duration_Exc),...
    mean(Avoid_duration_Exc),...
    mean(Def1_duration_Exc),...
    mean(Anogenital_duration_Exc),...
    mean(Facial_duration_Exc),...
    mean(Body_duration_Exc),...
    mean(Grab_duration_Exc),...
    mean(App2_duration_Exc),...
    mean(Def2_duration_Exc)];

Med_control = [mean(App1_duration_control),...
    mean(Follow_duration_control),...
    mean(Accept_duration_control),...
    mean(Avoid_duration_control),...
    mean(Def1_duration_control),...
    mean(Anogenital_duration_control),...
    mean(Facial_duration_control),...
    mean(Body_duration_control),...
    mean(Grab_duration_control),...
    mean(App2_duration_control),...
    mean(Def2_duration_control)];


figure
bar([1,2],[Med_control;Med_Exc],'stacked')
legend({'App1','Follow','Accept','Avoid','Def1','Anogenital','Facial','Body','Grab','App2','Def2'})
box off
ylabel('Duration (s)','FontSize',24)
set(gcf,'color','white')
set(gca,'xticklabels',{'Control','Exc'},'FontSize',20)

% %% durations
% 
ivt_graph({App1_duration_control(2:end),App1_duration_Exc},[],'xticklabels',{'Control','Exc'},'showpoints',1,'errorbars','sem')
ylabel('App1 Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({Follow_duration_control(2:end),Follow_duration_Exc},[],'xticklabels',{'Control','Exc'},'showpoints',1,'errorbars','sem')
ylabel('Follow Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({Accept_duration_control(2:end),Accept_duration_Exc},[],'xticklabels',{'Control','Exc'},'showpoints',1,'errorbars','sem')
ylabel('Accept Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({Avoid_duration_control(2:end),Avoid_duration_Exc},[],'xticklabels',{'Control','Exc'},'showpoints',1,'errorbars','sem')
ylabel('Avoid Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({Anogenital_duration_control(2:end),Anogenital_duration_Exc},[],'xticklabels',{'Control','Exc'},'showpoints',1,'errorbars','sem')
ylabel('Anogenital Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({Body_duration_control(2:end),Body_duration_Exc},[],'xticklabels',{'Control','Exc'},'showpoints',1,'errorbars','sem')
ylabel('Body Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({Facial_duration_control(2:end),Facial_duration_Exc},[],'xticklabels',{'Control','Exc'},'showpoints',1,'errorbars','sem')
ylabel('Facial Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')


ivt_graph({Grab_duration_control(2:end),Grab_duration_Exc},[],'xticklabels',{'Control','Exc'},'showpoints',1,'errorbars','sem')
ylabel('Grab Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')


ivt_graph({Anogenital_duration_control(2:end)+Body_duration_control(2:end)+Facial_duration_control(2:end),Anogenital_duration_Exc+Body_duration_Exc+Facial_duration_Exc},[],'xticklabels',{'Control','Exc'},'showpoints',1,'errorbars','sem')
ylabel('Total Investigation Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')
%% number of events
% 
% App_NEW_number_control = [];
% App_OLD_number_control = [];
% Carry_NEW_number_control = [];
% Carry_OLD_number_control = [];
% Avoid_NEW_number_control = [];
% Avoid_OLD_number_control = [];
% 
% for i = GAD2_control
%     % novel object
%     if ~isempty(S(i).NovelObject)==1
%         NovObj = S(i).NovelObject.NovOld;
%         for j=1:length(NovObj)
%             App_NEW_number_control = [App_NEW_number_control , length(NovObj{j}.ApproachNEW_end - NovObj{j}.ApproachNEW_start)];
%             App_OLD_number_control = [App_OLD_number_control , length(NovObj{j}.ApproachOLD_end - NovObj{j}.ApproachOLD_start)];
% 
%             Carry_NEW_number_control = [Carry_NEW_number_control , length(NovObj{j}.CarryNEW_end - NovObj{j}.CarryNEW_start)];
%             Carry_OLD_number_control = [Carry_OLD_number_control , length(NovObj{j}.CarryOLD_end - NovObj{j}.CarryOLD_start)];
%             
%             Avoid_NEW_number_control = [Avoid_NEW_number_control , length(NovObj{j}.AvoidNEW_end - NovObj{j}.AvoidNEW_start)];
%             Avoid_OLD_number_control = [Avoid_OLD_number_control , length(NovObj{j}.AvoidOLD_end - NovObj{j}.AvoidOLD_start)];
%         end
%     end
% end
% 
% App_NEW_number_Exc = [];
% App_OLD_number_Exc = [];
% Carry_NEW_number_Exc = [];
% Carry_OLD_number_Exc = [];
% Avoid_NEW_number_Exc = [];
% Avoid_OLD_number_Exc = [];
% 
% for i = GAD2_Exc
%     % novel object
%     if ~isempty(S(i).NovelObject)==1
%         NovObj = S(i).NovelObject.NovOld;
%         for j=1:length(NovObj)
%             App_NEW_number_Exc = [App_NEW_number_Exc , length(NovObj{j}.ApproachNEW_end - NovObj{j}.ApproachNEW_start)];
%             App_OLD_number_Exc = [App_OLD_number_Exc , length(NovObj{j}.ApproachOLD_end - NovObj{j}.ApproachOLD_start)];
% 
%             Carry_NEW_number_Exc = [Carry_NEW_number_Exc , length(NovObj{j}.CarryNEW_end - NovObj{j}.CarryNEW_start)];
%             Carry_OLD_number_Exc = [Carry_OLD_number_Exc , length(NovObj{j}.CarryOLD_end - NovObj{j}.CarryOLD_start)];
%             
%             Avoid_NEW_number_Exc = [Avoid_NEW_number_Exc , length(NovObj{j}.AvoidNEW_end - NovObj{j}.AvoidNEW_start)];
%             Avoid_OLD_number_Exc = [Avoid_OLD_number_Exc , length(NovObj{j}.AvoidOLD_end - NovObj{j}.AvoidOLD_start)];
%         end
%     end
% end
% 
% ivt_graph({Carry_OLD_number_control,Carry_NEW_number_control,Carry_OLD_number_Exc,Carry_NEW_number_Exc},[],'xticklabels',{'Cont/OldObj','Cont/NewObj','ChR2/OldObj','ChR2/NewObj'},'showpoints',1,'errorbars','sem','correction','Bonferroni')
% ylabel('Carry number (s)','FontSize',24)
% box off
% set(gcf,'color','white')
% 
% ivt_graph({Avoid_OLD_number_control,Avoid_NEW_number_control,Avoid_OLD_number_Exc,Avoid_NEW_number_Exc},[],'xticklabels',{'Cont/OldObj','Cont/NewObj','ChR2/OldObj','ChR2/NewObj'},'showpoints',1,'errorbars','sem')
% ylabel('Avoid number (s)','FontSize',24)
% box off
% set(gcf,'color','white')
% 
% ivt_graph({App_OLD_number_control,App_NEW_number_control,App_OLD_number_Exc,App_NEW_number_Exc},[],'xticklabels',{'Cont/OldObj','Cont/NewObj','ChR2/OldObj','ChR2/NewObj'},'showpoints',1,'errorbars','sem')
% ylabel('Approach number (s)','FontSize',24)
% box off
% set(gcf,'color','white')
