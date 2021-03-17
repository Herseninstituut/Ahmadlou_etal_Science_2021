load \\vs01\CSF_DATA\Shared\InVivo\Experiments\JAABA_analysis\SessionUpdates\Session_Social_20042020.mat
S = T;
GAD2_control = [];
GAD2_Inh = [];
for i=1:length(S)
%         if strcmp(S(i).group,'GAD2_ZI_Exc')==1 %'GAD2_ZI_Cont_CNO'%'GAD2_ZI_Cont' or 'GAD2_ZI_Inh_PLsaline' for PL
    if strcmp(S(i).group,'GAD2_ZI_Cont')==1 || strcmp(S(i).group,'B6')==1
        GAD2_control = [GAD2_control,i];
    elseif strcmp(S(i).group,'GAD2_ZI_Exc')==1 %'GAD2_ZI_CNO'%'GAD2_ZI_PAG_Exc'
        GAD2_Inh = [GAD2_Inh,i];
    end
end

App1_duration_Inh = [];
% Follow_duration_Inh = [];
Investigation_duration_Inh = [];
Avoid_duration_Inh = [];
Def1_duration_Inh = [];
% Anogenital_duration_Inh = [];
% Facial_duration_Inh = [];
% Body_duration_Inh = [];
Grab_duration_Inh = [];
App2_duration_Inh = [];
Def2_duration_Inh = [];

XX = 1; % use ONLY XX=1
for i = GAD2_Inh
    %
    if ~isempty(S(i).Social)==1
        NovObj = S(i).Social;
        for j=1:length(NovObj)
            if isfield(NovObj{1,j},'Investigation_start')
            %
            idx = NovObj{j}.App1_start>XX;
            NovObj{j}.App1_start = NovObj{j}.App1_start(idx);
            NovObj{j}.App1_end = NovObj{j}.App1_end(idx);
            if ~isempty(NovObj{j}.App1_start) && NovObj{j}.App1_end(1)<XX
                NovObj{j}.App1_end(end) = XX;
            end
            App1_duration_Inh = [App1_duration_Inh , sum(NovObj{j}.App1_end - NovObj{j}.App1_start)];
            
           %
            idx = NovObj{j}.Investigation_start>XX;
            NovObj{j}.Investigation_start = NovObj{j}.Investigation_start(idx);
            NovObj{j}.Investigation_end = NovObj{j}.Investigation_end(idx);
            if ~isempty(NovObj{j}.Investigation_start) && NovObj{j}.Investigation_end(1)<XX
                NovObj{j}.Investigation_end(end) = XX;
            end
            Investigation_duration_Inh = [Investigation_duration_Inh , sum(NovObj{j}.Investigation_end - NovObj{j}.Investigation_start)];
           
            %
            idx = NovObj{j}.Avoid_start>XX;
            NovObj{j}.Avoid_start = NovObj{j}.Avoid_start(idx);
            NovObj{j}.Avoid_end = NovObj{j}.Avoid_end(idx);
            if ~isempty(NovObj{j}.Avoid_start) && NovObj{j}.Avoid_end(1)<XX
                NovObj{j}.Avoid_end(end) = XX;
            end
            Avoid_duration_Inh = [Avoid_duration_Inh , sum(NovObj{j}.Avoid_end - NovObj{j}.Avoid_start)];
            
            %
            idx = NovObj{j}.Def1_start>XX;
            NovObj{j}.Def1_start = NovObj{j}.Def1_start(idx);
            NovObj{j}.Def1_end = NovObj{j}.Def1_end(idx);
            if ~isempty(NovObj{j}.Def1_start) && NovObj{j}.Def1_end(1)<XX
                NovObj{j}.Def1_end(end) = XX;
            end
            Def1_duration_Inh = [Def1_duration_Inh , sum(NovObj{j}.Def1_end - NovObj{j}.Def1_start)];
            
            %
            idx = NovObj{j}.Grab_start>XX;
            NovObj{j}.Grab_start = NovObj{j}.Grab_start(idx);
            NovObj{j}.Grab_end = NovObj{j}.Grab_end(idx);
            if ~isempty(NovObj{j}.Grab_start) && NovObj{j}.Grab_end(1)<XX
                NovObj{j}.Grab_end(end) = XX;
            end
            Grab_duration_Inh = [Grab_duration_Inh , sum(NovObj{j}.Grab_end - NovObj{j}.Grab_start)];
            
            %
            idx = NovObj{j}.App2_start>XX;
            NovObj{j}.App2_start = NovObj{j}.App2_start(idx);
            NovObj{j}.App2_end = NovObj{j}.App2_end(idx);
            if ~isempty(NovObj{j}.App2_start) && NovObj{j}.App2_end(1)<XX
                NovObj{j}.App2_end(end) = XX;
            end
            App2_duration_Inh = [App2_duration_Inh , sum(NovObj{j}.App2_end - NovObj{j}.App2_start)];
            
            %
            idx = NovObj{j}.Def2_start>XX;
            NovObj{j}.Def2_start = NovObj{j}.Def2_start(idx);
            NovObj{j}.Def2_end = NovObj{j}.Def2_end(idx);
            if ~isempty(NovObj{j}.Def2_start) && NovObj{j}.Def2_end(1)<XX
                NovObj{j}.Def2_end(end) = XX;
            end
            Def2_duration_Inh = [Def2_duration_Inh , sum(NovObj{j}.Def2_end - NovObj{j}.Def2_start)];
            end
        end
    end
end


App1_duration_control = [];
% Follow_duration_control = [];
Investigation_duration_control = [];
Avoid_duration_control = [];
Def1_duration_control = [];
% Anogenital_duration_control = [];
% Facial_duration_control = [];
% Body_duration_control = [];
Grab_duration_control = [];
App2_duration_control = [];
Def2_duration_control = [];


for i = GAD2_control
    %
    if ~isempty(S(i).Social)==1
        NovObj = S(i).Social;
        for j=1:length(NovObj)
            if isfield(NovObj{1,j},'Investigation_start')
            %
            idx = NovObj{j}.App1_start>XX;
            NovObj{j}.App1_start = NovObj{j}.App1_start(idx);
            NovObj{j}.App1_end = NovObj{j}.App1_end(idx);
            if ~isempty(NovObj{j}.App1_start) && NovObj{j}.App1_end(1)<XX
                NovObj{j}.App1_end(end) = XX;
            end
            App1_duration_control = [App1_duration_control , sum(NovObj{j}.App1_end - NovObj{j}.App1_start)];
            
           %
            idx = NovObj{j}.Investigation_start>XX;
            NovObj{j}.Investigation_start = NovObj{j}.Investigation_start(idx);
            NovObj{j}.Investigation_end = NovObj{j}.Investigation_end(idx);
            if ~isempty(NovObj{j}.Investigation_start) && NovObj{j}.Investigation_end(1)<XX
                NovObj{j}.Investigation_end(end) = XX;
            end
            Investigation_duration_control = [Investigation_duration_control , sum(NovObj{j}.Investigation_end - NovObj{j}.Investigation_start)];
  
            %
            idx = NovObj{j}.Avoid_start>XX;
            NovObj{j}.Avoid_start = NovObj{j}.Avoid_start(idx);
            NovObj{j}.Avoid_end = NovObj{j}.Avoid_end(idx);
            if ~isempty(NovObj{j}.Avoid_start) && NovObj{j}.Avoid_end(1)<XX
                NovObj{j}.Avoid_end(end) = XX;
            end
            Avoid_duration_control = [Avoid_duration_control , sum(NovObj{j}.Avoid_end - NovObj{j}.Avoid_start)];
            
            %
            idx = NovObj{j}.Def1_start>XX;
            NovObj{j}.Def1_start = NovObj{j}.Def1_start(idx);
            NovObj{j}.Def1_end = NovObj{j}.Def1_end(idx);
            if ~isempty(NovObj{j}.Def1_start) && NovObj{j}.Def1_end(1)<XX
                NovObj{j}.Def1_end(end) = XX;
            end
            Def1_duration_control = [Def1_duration_control , sum(NovObj{j}.Def1_end - NovObj{j}.Def1_start)];
            
            %
            idx = NovObj{j}.Grab_start>XX;
            NovObj{j}.Grab_start = NovObj{j}.Grab_start(idx);
            NovObj{j}.Grab_end = NovObj{j}.Grab_end(idx);
            if ~isempty(NovObj{j}.Grab_start) && NovObj{j}.Grab_end(1)<XX
                NovObj{j}.Grab_end(end) = XX;
            end
            Grab_duration_control = [Grab_duration_control , sum(NovObj{j}.Grab_end - NovObj{j}.Grab_start)];
            
            %
            idx = NovObj{j}.App2_start>XX;
            NovObj{j}.App2_start = NovObj{j}.App2_start(idx);
            NovObj{j}.App2_end = NovObj{j}.App2_end(idx);
            if ~isempty(NovObj{j}.App2_start) && NovObj{j}.App2_end(1)<XX
                NovObj{j}.App2_end(end) = XX;
            end
            App2_duration_control = [App2_duration_control , sum(NovObj{j}.App2_end - NovObj{j}.App2_start)];
            
            %
            idx = NovObj{j}.Def2_start>XX;
            NovObj{j}.Def2_start = NovObj{j}.Def2_start(idx);
            NovObj{j}.Def2_end = NovObj{j}.Def2_end(idx);
            if ~isempty(NovObj{j}.Def2_start) && NovObj{j}.Def2_end(1)<XX
                NovObj{j}.Def2_end(end) = XX;
            end
            Def2_duration_control = [Def2_duration_control , sum(NovObj{j}.Def2_end - NovObj{j}.Def2_start)];
            end
        end
    end
end

% % stacked bargraph

Med_Inh = [mean(App1_duration_Inh),...
    mean(Investigation_duration_Inh),...
    mean(Avoid_duration_Inh),...
    mean(Def1_duration_Inh),...
    mean(Grab_duration_Inh),...
    mean(App2_duration_Inh),...
    mean(Def2_duration_Inh)];


Med_control = [mean(App1_duration_control),...
    mean(Investigation_duration_control),...
    mean(Avoid_duration_control),...
    mean(Def1_duration_control),...
    mean(Grab_duration_control),...
    mean(App2_duration_control),...
    mean(Def2_duration_control)];

figure
bar([1,2],[Med_control;Med_Inh],'stacked')
legend({'App1','Investigation','Avoid','Def1','Grab','App2','Def2'})
box off
ylabel('Duration (s)','FontSize',24)
set(gcf,'color','white')
set(gca,'xticklabels',{'tdTOM','TAC1'},'FontSize',20)

% %% durations
% 
ivt_graph({App1_duration_control,App1_duration_Inh},[],'xticklabels',{'Control','Inh'},'showpoints',1,'errorbars','sem','test','ttest2')
ylabel('App1 Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')


ivt_graph({Investigation_duration_control,Investigation_duration_Inh},[],'xticklabels',{'tdTOM','TAC1'},'showpoints',1,'errorbars','sem')
ylabel('Investigation Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')   

% ivt_graph({Investigation_duration_control,[Investigation_duration_Inh 157 326]},[],'xticklabels',{'Control''Inh'},'showpoints',1,'errorbars','sem','test','ttest2')
% ylabel('Investigation Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
% box off
% set(gcf,'color','white')   % ZI_PAG

% ivt_graph({Investigation_duration_control,[Investigation_duration_Inh 157]},[],'xticklabels',{'Control''Inh'},'showpoints',1,'errorbars','sem','test','ttest2')
% ylabel('Investigation Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
% box off
% set(gcf,'color','white') % ZI_MLR

% ivt_graph({Investigation_duration_control,[Investigation_duration_Inh 70.8]},[],'xticklabels',{'Control''Inh'},'showpoints',1,'errorbars','sem','test','ttest2')
% ylabel('Investigation Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
% box off
% set(gcf,'color','white')  % ZI_PnO

% ivt_graph({Investigation_duration_control,[Investigation_duration_Inh]},[],'xticklabels',{'Control''Inh'},'showpoints',1,'errorbars','sem','test','ttest2')
% ylabel('Investigation Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
% box off
% set(gcf,'color','white')  % ZI_PL

ivt_graph({Avoid_duration_control,Avoid_duration_Inh},[],'xticklabels',{'Control''Inh'},'showpoints',1,'errorbars','sem','test','ttest2')
ylabel('Avoid Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')


ivt_graph({Grab_duration_control,Grab_duration_Inh},[],'xticklabels',{'Control''Inh'},'showpoints',1,'errorbars','sem','test','ttest2')
ylabel('Grab Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')


% For avoid show it in Number


% figure
% bar([1,2],[Med_control;Med_Inh],'stacked')
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
% ivt_graph({Sniff_OLD_duration_control,Sniff_NEW_duration_control,Sniff_OLD_duration_Inh,Sniff_NEW_duration_Inh},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.85 .325 .098])
% ylabel('Sniff Duration (s; 2 min)','FontSize',24) % later do:'correction','Bonferroni'
% box off
% set(gcf,'color','white')
% hold on
% annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% 
% ivt_graph({Bite_OLD_duration_control,Bite_NEW_duration_control,Bite_OLD_duration_Inh,Bite_NEW_duration_Inh},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.929 .694 .125])
% ylabel('Bite Duration (s; 2 min)','FontSize',24)
% box off
% set(gcf,'color','white')
% hold on
% annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% 
% ivt_graph({Grab_OLD_duration_control,Grab_NEW_duration_control,Grab_OLD_duration_Inh,Grab_NEW_duration_Inh},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.494 .184 .556])
% ylabel('Grab Duration (s; 2 min)','FontSize',24)
% box off
% set(gcf,'color','white')
% hold on
% annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% 
% ivt_graph({Carry_OLD_duration_control,Carry_NEW_duration_control,Carry_OLD_duration_Inh,Carry_NEW_duration_Inh},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.466 .674 .188])
% ylabel('Carry Duration (s; 2 min)','FontSize',24)
% box off
% set(gcf,'color','white')
% hold on
% annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% 
% ivt_graph({Avoid_OLD_duration_control,Avoid_NEW_duration_control,Avoid_OLD_duration_Inh,Avoid_NEW_duration_Inh},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.301 .745 .933])
% ylabel('Avoid Duration (s; 2 min)','FontSize',24)
% box off
% set(gcf,'color','white')
% hold on
% annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% 
% ivt_graph({App_OLD_duration_control,App_NEW_duration_control,App_OLD_duration_Inh,App_NEW_duration_Inh},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[0 .447 .741])
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
%             App_NEW_number_control = [App_NEW_number_control , sum(NovObj{j}.ApproachNEW_start>XX)];
%             App_OLD_number_control = [App_OLD_number_control , sum(NovObj{j}.ApproachOLD_start>XX)];
%             
%             Carry_NEW_number_control = [Carry_NEW_number_control , sum(NovObj{j}.CarryNEW_start>XX)];
%             Carry_OLD_number_control = [Carry_OLD_number_control , sum(NovObj{j}.CarryOLD_start>XX)];
%             
%             Avoid_NEW_number_control = [Avoid_NEW_number_control , sum(NovObj{j}.AvoidNEW_start>XX)];
%             Avoid_OLD_number_control = [Avoid_OLD_number_control , sum(NovObj{j}.AvoidOLD_start>XX)];
%         end
%     end
% end
% 
% App_NEW_number_Inh = [];
% App_OLD_number_Inh = [];
% Carry_NEW_number_Inh = [];
% Carry_OLD_number_Inh = [];
% Avoid_NEW_number_Inh = [];
% Avoid_OLD_number_Inh = [];
% 
% for i = GAD2_Inh
%     % novel object
%     if ~isempty(S(i).NovelObject)==1
%         NovObj = S(i).NovelObject.NovOld;
%         for j=1:length(NovObj)
%             App_NEW_number_Inh = [App_NEW_number_Inh , sum(NovObj{j}.ApproachNEW_start>XX)];
%             App_OLD_number_Inh = [App_OLD_number_Inh , sum(NovObj{j}.ApproachOLD_start>XX)];
%             
%             Carry_NEW_number_Inh = [Carry_NEW_number_Inh , sum(NovObj{j}.CarryNEW_start>XX)];
%             Carry_OLD_number_Inh = [Carry_OLD_number_Inh , sum(NovObj{j}.CarryOLD_start>XX)];
%             
%             Avoid_NEW_number_Inh = [Avoid_NEW_number_Inh , sum(NovObj{j}.AvoidNEW_start>XX)];
%             Avoid_OLD_number_Inh = [Avoid_OLD_number_Inh , sum(NovObj{j}.AvoidOLD_start>XX)];
%         end
%     end
% end
% 
% ivt_graph({Carry_OLD_number_control,Carry_NEW_number_control,Carry_OLD_number_Inh,Carry_NEW_number_Inh},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.466 .674 .188])
% ylabel('Carry Events (n)','FontSize',24)
% box off
% set(gcf,'color','white')
% hold on
% annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% 
% ivt_graph({Avoid_OLD_number_control,Avoid_NEW_number_control,Avoid_OLD_number_Inh,Avoid_NEW_number_Inh},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[.301 .745 .933])
% ylabel('Avoid Events (n)','FontSize',24)
% box off
% set(gcf,'color','white')
% hold on
% annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% 
% ivt_graph({App_OLD_number_control,App_NEW_number_control,App_OLD_number_Inh,App_NEW_number_Inh},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',[0 .447 .741])
% ylabel('Approach Events (n)','FontSize',24)
% box off
% set(gcf,'color','white')
% hold on
% annotation('textbox',[.22 .05 .26 .06],'String','tdTom','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
% annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');

% ivt_graph({Inv_tdTOM,Inv_MLR,Inv_PnO,Inv_PAG},[],'xticklabels',{'tdTOM','MLR','PnO','PAG'},'showpoints',1,'errorbars','sem','test','ttest')
% ylabel('Investigation Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
% box off
% set(gcf,'color','white') 