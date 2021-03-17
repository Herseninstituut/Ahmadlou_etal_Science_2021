GAD2_control = [];
GAD2_Exc = [];
for i=1:length(S)
    if strcmp(S(i).group,'GAD2_ZI_Cont_10')==1 || strcmp(S(i).group,'GAD2_ZI_Cont')==1
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

XX = 300; % including only the first XXs
for i = GAD2_Exc
    %
    if ~isempty(S(i).Social)==1
        NovObj = S(i).Social;
        for j=1:length(NovObj)
            %
            idx = NovObj{j}.App1_start<XX;
            NovObj{j}.App1_start = NovObj{j}.App1_start(idx);
            NovObj{j}.App1_end = NovObj{j}.App1_end(idx);
            if ~isempty(NovObj{j}.App1_end) && NovObj{j}.App1_end(end)>XX
                NovObj{j}.App1_end(end) = XX;
            end
            App1_duration_Exc = [App1_duration_Exc , sum(NovObj{j}.App1_end - NovObj{j}.App1_start)];
            
            
            %
            idx = NovObj{j}.Follow_start<XX;
            NovObj{j}.Follow_start = NovObj{j}.Follow_start(idx);
            NovObj{j}.Follow_end = NovObj{j}.Follow_end(idx);
            if ~isempty(NovObj{j}.Follow_end) && NovObj{j}.Follow_end(end)>XX
                NovObj{j}.Follow_end(end) = XX;
            end
            Follow_duration_Exc = [Follow_duration_Exc , sum(NovObj{j}.Follow_end - NovObj{j}.Follow_start)];
            
           %
            idx = NovObj{j}.Accept_start<XX;
            NovObj{j}.Accept_start = NovObj{j}.Accept_start(idx);
            NovObj{j}.Accept_end = NovObj{j}.Accept_end(idx);
            if ~isempty(NovObj{j}.Accept_end) && NovObj{j}.Accept_end(end)>XX
                NovObj{j}.Accept_end(end) = XX;
            end
            Accept_duration_Exc = [Accept_duration_Exc , sum(NovObj{j}.Accept_end - NovObj{j}.Accept_start)];
            
            %
            idx = NovObj{j}.Avoid_start<XX;
            NovObj{j}.Avoid_start = NovObj{j}.Avoid_start(idx);
            NovObj{j}.Avoid_end = NovObj{j}.Avoid_end(idx);
            if ~isempty(NovObj{j}.Avoid_end) && NovObj{j}.Avoid_end(end)>XX
                NovObj{j}.Avoid_end(end) = XX;
            end
            Avoid_duration_Exc = [Avoid_duration_Exc , sum(NovObj{j}.Avoid_end - NovObj{j}.Avoid_start)];
            
            %
            idx = NovObj{j}.Def1_start<XX;
            NovObj{j}.Def1_start = NovObj{j}.Def1_start(idx);
            NovObj{j}.Def1_end = NovObj{j}.Def1_end(idx);
            if ~isempty(NovObj{j}.Def1_end) && NovObj{j}.Def1_end(end)>XX
                NovObj{j}.Def1_end(end) = XX;
            end
            Def1_duration_Exc = [Def1_duration_Exc , sum(NovObj{j}.Def1_end - NovObj{j}.Def1_start)];
            
            %
            idx = NovObj{j}.Anogenital_start<XX;
            NovObj{j}.Anogenital_start = NovObj{j}.Anogenital_start(idx);
            NovObj{j}.Anogenital_end = NovObj{j}.Anogenital_end(idx);
            if ~isempty(NovObj{j}.Anogenital_end) && NovObj{j}.Anogenital_end(end)>XX
                NovObj{j}.Anogenital_end(end) = XX;
            end
            Anogenital_duration_Exc = [Anogenital_duration_Exc , sum(NovObj{j}.Anogenital_end - NovObj{j}.Anogenital_start)];
            
            %
            idx = NovObj{j}.Facial_start<XX;
            NovObj{j}.Facial_start = NovObj{j}.Facial_start(idx);
            NovObj{j}.Facial_end = NovObj{j}.Facial_end(idx);
            if ~isempty(NovObj{j}.Facial_end) && NovObj{j}.Facial_end(end)>XX
                NovObj{j}.Facial_end(end) = XX;
            end
            Facial_duration_Exc = [Facial_duration_Exc , sum(NovObj{j}.Facial_end - NovObj{j}.Facial_start)];
            
            %
            idx = NovObj{j}.Body_start<XX;
            NovObj{j}.Body_start = NovObj{j}.Body_start(idx);
            NovObj{j}.Body_end = NovObj{j}.Body_end(idx);
            if ~isempty(NovObj{j}.Body_end) && NovObj{j}.Body_end(end)>XX
                NovObj{j}.Body_end(end) = XX;
            end
            Body_duration_Exc = [Body_duration_Exc , sum(NovObj{j}.Body_end - NovObj{j}.Body_start)];
            
            %
            idx = NovObj{j}.Grab_start<XX;
            NovObj{j}.Grab_start = NovObj{j}.Grab_start(idx);
            NovObj{j}.Grab_end = NovObj{j}.Grab_end(idx);
            if ~isempty(NovObj{j}.Grab_end) && NovObj{j}.Grab_end(end)>XX
                NovObj{j}.Grab_end(end) = XX;
            end
            Grab_duration_Exc = [Grab_duration_Exc , sum(NovObj{j}.Grab_end - NovObj{j}.Grab_start)];
            
            %
            idx = NovObj{j}.App2_start<XX;
            NovObj{j}.App2_start = NovObj{j}.App2_start(idx);
            NovObj{j}.App2_end = NovObj{j}.App2_end(idx);
            if ~isempty(NovObj{j}.App2_end) && NovObj{j}.App2_end(end)>XX
                NovObj{j}.App2_end(end) = XX;
            end
            App2_duration_Exc = [App2_duration_Exc , sum(NovObj{j}.App2_end - NovObj{j}.App2_start)];
            
            %
            idx = NovObj{j}.Def2_start<XX;
            NovObj{j}.Def2_start = NovObj{j}.Def2_start(idx);
            NovObj{j}.Def2_end = NovObj{j}.Def2_end(idx);
            if ~isempty(NovObj{j}.Def2_end) && NovObj{j}.Def2_end(end)>XX
                NovObj{j}.Def2_end(end) = XX;
            end
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


for i = GAD2_control(1:end)
    %
    if ~isempty(S(i).Social)==1
        NovObj = S(i).Social;
        for j=1:length(NovObj)
            %
            idx = NovObj{j}.App1_start<XX;
            NovObj{j}.App1_start = NovObj{j}.App1_start(idx);
            NovObj{j}.App1_end = NovObj{j}.App1_end(idx);
            if ~isempty(NovObj{j}.App1_end) && NovObj{j}.App1_end(end)>XX
                NovObj{j}.App1_end(end) = XX;
            end
            App1_duration_control = [App1_duration_control , sum(NovObj{j}.App1_end - NovObj{j}.App1_start)];
            
            
            %
            idx = NovObj{j}.Follow_start<XX;
            NovObj{j}.Follow_start = NovObj{j}.Follow_start(idx);
            NovObj{j}.Follow_end = NovObj{j}.Follow_end(idx);
            if ~isempty(NovObj{j}.Follow_end) && NovObj{j}.Follow_end(end)>XX
                NovObj{j}.Follow_end(end) = XX;
            end
            Follow_duration_control = [Follow_duration_control , sum(NovObj{j}.Follow_end - NovObj{j}.Follow_start)];
            
           %
            idx = NovObj{j}.Accept_start<XX;
            NovObj{j}.Accept_start = NovObj{j}.Accept_start(idx);
            NovObj{j}.Accept_end = NovObj{j}.Accept_end(idx);
            if ~isempty(NovObj{j}.Accept_end) && NovObj{j}.Accept_end(end)>XX
                NovObj{j}.Accept_end(end) = XX;
            end
            Accept_duration_control = [Accept_duration_control , sum(NovObj{j}.Accept_end - NovObj{j}.Accept_start)];
            
            %
            idx = NovObj{j}.Avoid_start<XX;
            NovObj{j}.Avoid_start = NovObj{j}.Avoid_start(idx);
            NovObj{j}.Avoid_end = NovObj{j}.Avoid_end(idx);
            if ~isempty(NovObj{j}.Avoid_end) && NovObj{j}.Avoid_end(end)>XX
                NovObj{j}.Avoid_end(end) = XX;
            end
            Avoid_duration_control = [Avoid_duration_control , sum(NovObj{j}.Avoid_end - NovObj{j}.Avoid_start)];
            
            %
            idx = NovObj{j}.Def1_start<XX;
            NovObj{j}.Def1_start = NovObj{j}.Def1_start(idx);
            NovObj{j}.Def1_end = NovObj{j}.Def1_end(idx);
            if ~isempty(NovObj{j}.Def1_end) && NovObj{j}.Def1_end(end)>XX
                NovObj{j}.Def1_end(end) = XX;
            end
            Def1_duration_control = [Def1_duration_control , sum(NovObj{j}.Def1_end - NovObj{j}.Def1_start)];
            
            %
            idx = NovObj{j}.Anogenital_start<XX;
            NovObj{j}.Anogenital_start = NovObj{j}.Anogenital_start(idx);
            NovObj{j}.Anogenital_end = NovObj{j}.Anogenital_end(idx);
            if ~isempty(NovObj{j}.Anogenital_end) && NovObj{j}.Anogenital_end(end)>XX
                NovObj{j}.Anogenital_end(end) = XX;
            end
            Anogenital_duration_control = [Anogenital_duration_control , sum(NovObj{j}.Anogenital_end - NovObj{j}.Anogenital_start)];
            
            %
            idx = NovObj{j}.Facial_start<XX;
            NovObj{j}.Facial_start = NovObj{j}.Facial_start(idx);
            NovObj{j}.Facial_end = NovObj{j}.Facial_end(idx);
            if ~isempty(NovObj{j}.Facial_end) && NovObj{j}.Facial_end(end)>XX
                NovObj{j}.Facial_end(end) = XX;
            end
            Facial_duration_control = [Facial_duration_control , sum(NovObj{j}.Facial_end - NovObj{j}.Facial_start)];
            
            %
            idx = NovObj{j}.Body_start<XX;
            NovObj{j}.Body_start = NovObj{j}.Body_start(idx);
            NovObj{j}.Body_end = NovObj{j}.Body_end(idx);
            if ~isempty(NovObj{j}.Body_end) && NovObj{j}.Body_end(end)>XX
                NovObj{j}.Body_end(end) = XX;
            end
            Body_duration_control = [Body_duration_control , sum(NovObj{j}.Body_end - NovObj{j}.Body_start)];
            
            %
            idx = NovObj{j}.Grab_start<XX;
            NovObj{j}.Grab_start = NovObj{j}.Grab_start(idx);
            NovObj{j}.Grab_end = NovObj{j}.Grab_end(idx);
            if ~isempty(NovObj{j}.Grab_end) && NovObj{j}.Grab_end(end)>XX
                NovObj{j}.Grab_end(end) = XX;
            end
            Grab_duration_control = [Grab_duration_control , sum(NovObj{j}.Grab_end - NovObj{j}.Grab_start)];
            
            %
            idx = NovObj{j}.App2_start<XX;
            NovObj{j}.App2_start = NovObj{j}.App2_start(idx);
            NovObj{j}.App2_end = NovObj{j}.App2_end(idx);
            if ~isempty(NovObj{j}.App2_end) && NovObj{j}.App2_end(end)>XX
                NovObj{j}.App2_end(end) = XX;
            end
            App2_duration_control = [App2_duration_control , sum(NovObj{j}.App2_end - NovObj{j}.App2_start)];
            
            %
            idx = NovObj{j}.Def2_start<XX;
            NovObj{j}.Def2_start = NovObj{j}.Def2_start(idx);
            NovObj{j}.Def2_end = NovObj{j}.Def2_end(idx);
            if ~isempty(NovObj{j}.Def2_end) && NovObj{j}.Def2_end(end)>XX
                NovObj{j}.Def2_end(end) = XX;
            end
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
ivt_graph({App1_duration_control,App1_duration_Exc},[],'xticklabels',{'Control','Exc'},'showpoints',1,'errorbars','sem')
ylabel('App1 Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({Follow_duration_control,Follow_duration_Exc},[],'xticklabels',{'Control','Exc'},'showpoints',1,'errorbars','sem')
ylabel('Follow Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({Accept_duration_control,Accept_duration_Exc},[],'xticklabels',{'Control','Exc'},'showpoints',1,'errorbars','sem')
ylabel('Accept Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({Avoid_duration_control,Avoid_duration_Exc},[],'xticklabels',{'Control','Exc'},'showpoints',1,'errorbars','sem')
ylabel('Avoid Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({Anogenital_duration_control,Anogenital_duration_Exc},[],'xticklabels',{'Control','Exc'},'showpoints',1,'errorbars','sem')
ylabel('Anogenital Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({Body_duration_control,Body_duration_Exc},[],'xticklabels',{'Control','Exc'},'showpoints',1,'errorbars','sem')
ylabel('Body Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({Facial_duration_control,Facial_duration_Exc},[],'xticklabels',{'Control','Exc'},'showpoints',1,'errorbars','sem')
ylabel('Facial Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')


ivt_graph({Grab_duration_control,Grab_duration_Exc},[],'xticklabels',{'Control','Exc'},'showpoints',1,'errorbars','sem')
ylabel('Grab Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')


ivt_graph({Anogenital_duration_control+Body_duration_control+Facial_duration_control,Anogenital_duration_Exc+Body_duration_Exc+Facial_duration_Exc},[],'xticklabels',{'Control','Exc'},'showpoints',1,'errorbars','sem')
ylabel('Total Investigation Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')



% figure
% bar([1,2],[Med_control;Med_Exc],'stacked')
% legend({'Approach','Sniff','Bite','Grab','Carry','Avoid'})
% box off
% ylabel('Duration (s; 2 min)','FontSize',24)
% set(gcf,'color','white')
% set(gca,'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'FontSize',20)
% hold on
% annotation('textbox',[.23 .84 .27 .11],'String','GAD2 Control','FontName','Arial','FontSize',22.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% annotation('textbox',[.52 .84 .27 .11],'String','PV ChR2','FontName','Arial','FontSize',22.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% %% durations
% 
% ivt_graph({Sniff_OLD_duration_control,Sniff_NEW_duration_control,Sniff_OLD_duration_Exc,Sniff_NEW_duration_Exc},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.85 .325 .098])
% ylabel('Sniff Duration (s; 2 min)','FontSize',24) % later do:'correction','Bonferroni'
% box off
% set(gcf,'color','white')
% hold on
% annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% 
% ivt_graph({Bite_OLD_duration_control,Bite_NEW_duration_control,Bite_OLD_duration_Exc,Bite_NEW_duration_Exc},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.929 .694 .125])
% ylabel('Bite Duration (s; 2 min)','FontSize',24)
% box off
% set(gcf,'color','white')
% hold on
% annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% 
% ivt_graph({Grab_OLD_duration_control,Grab_NEW_duration_control,Grab_OLD_duration_Exc,Grab_NEW_duration_Exc},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.494 .184 .556])
% ylabel('Grab Duration (s; 2 min)','FontSize',24)
% box off
% set(gcf,'color','white')
% hold on
% annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% 
% ivt_graph({Carry_OLD_duration_control,Carry_NEW_duration_control,Carry_OLD_duration_Exc,Carry_NEW_duration_Exc},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.466 .674 .188])
% ylabel('Carry Duration (s; 2 min)','FontSize',24)
% box off
% set(gcf,'color','white')
% hold on
% annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% 
% ivt_graph({Avoid_OLD_duration_control,Avoid_NEW_duration_control,Avoid_OLD_duration_Exc,Avoid_NEW_duration_Exc},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.301 .745 .933])
% ylabel('Avoid Duration (s; 2 min)','FontSize',24)
% box off
% set(gcf,'color','white')
% hold on
% annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% 
% ivt_graph({App_OLD_duration_control,App_NEW_duration_control,App_OLD_duration_Exc,App_NEW_duration_Exc},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[0 .447 .741])
% ylabel('Approach Duration (s; 2 min)','FontSize',24)
% box off
% set(gcf,'color','white')
% hold on
% annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% %% number of events
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
%             App_NEW_number_control = [App_NEW_number_control , sum(NovObj{j}.ApproachNEW_start<XX)];
%             App_OLD_number_control = [App_OLD_number_control , sum(NovObj{j}.ApproachOLD_start<XX)];
%             
%             Carry_NEW_number_control = [Carry_NEW_number_control , sum(NovObj{j}.CarryNEW_start<XX)];
%             Carry_OLD_number_control = [Carry_OLD_number_control , sum(NovObj{j}.CarryOLD_start<XX)];
%             
%             Avoid_NEW_number_control = [Avoid_NEW_number_control , sum(NovObj{j}.AvoidNEW_start<XX)];
%             Avoid_OLD_number_control = [Avoid_OLD_number_control , sum(NovObj{j}.AvoidOLD_start<XX)];
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
%             App_NEW_number_Exc = [App_NEW_number_Exc , sum(NovObj{j}.ApproachNEW_start<XX)];
%             App_OLD_number_Exc = [App_OLD_number_Exc , sum(NovObj{j}.ApproachOLD_start<XX)];
%             
%             Carry_NEW_number_Exc = [Carry_NEW_number_Exc , sum(NovObj{j}.CarryNEW_start<XX)];
%             Carry_OLD_number_Exc = [Carry_OLD_number_Exc , sum(NovObj{j}.CarryOLD_start<XX)];
%             
%             Avoid_NEW_number_Exc = [Avoid_NEW_number_Exc , sum(NovObj{j}.AvoidNEW_start<XX)];
%             Avoid_OLD_number_Exc = [Avoid_OLD_number_Exc , sum(NovObj{j}.AvoidOLD_start<XX)];
%         end
%     end
% end
% 
% ivt_graph({Carry_OLD_number_control,Carry_NEW_number_control,Carry_OLD_number_Exc,Carry_NEW_number_Exc},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.466 .674 .188])
% ylabel('Carry Events (n)','FontSize',24)
% box off
% set(gcf,'color','white')
% hold on
% annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% 
% ivt_graph({Avoid_OLD_number_control,Avoid_NEW_number_control,Avoid_OLD_number_Exc,Avoid_NEW_number_Exc},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.301 .745 .933])
% ylabel('Avoid Events (n)','FontSize',24)
% box off
% set(gcf,'color','white')
% hold on
% annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% 
% ivt_graph({App_OLD_number_control,App_NEW_number_control,App_OLD_number_Exc,App_NEW_number_Exc},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[0 .447 .741])
% ylabel('Approach Events (n)','FontSize',24)
% box off
% set(gcf,'color','white')
% hold on
% annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
