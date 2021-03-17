load('\\vs01\csf_data\Shared\InVivo\Experiments\JAABA_analysis\SessionUpdates\Session_Social_20042020.mat')
S = T;

GAD2_control = [];
GAD2_Exc = [];
for i=1:length(S)
%     if strcmp(S(i).group,'GAD2_ZI_Cont')==1 || strcmp(S(i).group,'B6')==1
      if strcmp(S(i).group,'GAD2_ZI_Exc')==1
        GAD2_control = [GAD2_control,i];
    end
end
GAD2_Exc = GAD2_control;

App1_duration_Exc = [];
Investigation_duration_Exc = [];
Accept_duration_Exc = [];
Avoid_duration_Exc = [];
Def1_duration_Exc = [];
Anogenital_duration_Exc = [];
Facial_duration_Exc = [];
Body_duration_Exc = [];
Grab_duration_Exc = [];
App2_duration_Exc = [];
Def2_duration_Exc = [];

XX = 200; % including only the first XXs
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
            idx = NovObj{j}.Investigation_start<XX;
            NovObj{j}.Investigation_start = NovObj{j}.Investigation_start(idx);
            NovObj{j}.Investigation_end = NovObj{j}.Investigation_end(idx);
            if ~isempty(NovObj{j}.Investigation_end) && NovObj{j}.Investigation_end(end)>XX
                NovObj{j}.Investigation_end(end) = XX;
            end
            Investigation_duration_Exc = [Investigation_duration_Exc , sum(NovObj{j}.Investigation_end - NovObj{j}.Investigation_start)];
            
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
Avoid_duration_control = [];
Def1_duration_control = [];
Investigation_duration_control = [];
Grab_duration_control = [];
App2_duration_control = [];
Def2_duration_control = [];

XX = 400;
for i = GAD2_control(1:end)
    %
    if ~isempty(S(i).Social)==1
        NovObj = S(i).Social;
        for j=1:length(NovObj)
            %
            idx = NovObj{j}.App1_start>XX;
            NovObj{j}.App1_start = NovObj{j}.App1_start(idx);
            NovObj{j}.App1_end = NovObj{j}.App1_end(idx);
            App1_duration_control = [App1_duration_control , sum(NovObj{j}.App1_end - NovObj{j}.App1_start)];
            
            
            %
            idx = NovObj{j}.Investigation_start>XX;
            NovObj{j}.Investigation_start = NovObj{j}.Investigation_start(idx);
            NovObj{j}.Investigation_end = NovObj{j}.Investigation_end(idx);
            Investigation_duration_control = [Investigation_duration_control , sum(NovObj{j}.Investigation_end - NovObj{j}.Investigation_start)];
            
            %
            idx = NovObj{j}.Avoid_start>XX;
            NovObj{j}.Avoid_start = NovObj{j}.Avoid_start(idx);
            NovObj{j}.Avoid_end = NovObj{j}.Avoid_end(idx);
            Avoid_duration_control = [Avoid_duration_control , sum(NovObj{j}.Avoid_end - NovObj{j}.Avoid_start)];
            
            %
            idx = NovObj{j}.Def1_start>XX;
            NovObj{j}.Def1_start = NovObj{j}.Def1_start(idx);
            NovObj{j}.Def1_end = NovObj{j}.Def1_end(idx);
            Def1_duration_control = [Def1_duration_control , sum(NovObj{j}.Def1_end - NovObj{j}.Def1_start)];

            %
            idx = NovObj{j}.Grab_start>XX;
            NovObj{j}.Grab_start = NovObj{j}.Grab_start(idx);
            NovObj{j}.Grab_end = NovObj{j}.Grab_end(idx);
            Grab_duration_control = [Grab_duration_control , sum(NovObj{j}.Grab_end - NovObj{j}.Grab_start)];
            
            %
            idx = NovObj{j}.App2_start>XX;
            NovObj{j}.App2_start = NovObj{j}.App2_start(idx);
            NovObj{j}.App2_end = NovObj{j}.App2_end(idx);
            App2_duration_control = [App2_duration_control , sum(NovObj{j}.App2_end - NovObj{j}.App2_start)];
            
            %
            idx = NovObj{j}.Def2_start>XX;
            NovObj{j}.Def2_start = NovObj{j}.Def2_start(idx);
            NovObj{j}.Def2_end = NovObj{j}.Def2_end(idx);
            Def2_duration_control = [Def2_duration_control , sum(NovObj{j}.Def2_end - NovObj{j}.Def2_start)];
            
        end
    end
end

% % stacked bargraph

Med_Exc = [mean(App1_duration_Exc),...
    mean(Investigation_duration_Exc),...
    mean(Avoid_duration_Exc),...
    mean(Def1_duration_Exc),...
    mean(Grab_duration_Exc),...
    mean(App2_duration_Exc),...
    mean(Def2_duration_Exc)];


Med_control = [mean(App1_duration_control),...
    mean(Investigation_duration_control),...
    mean(Avoid_duration_control),...
    mean(Def1_duration_control),...
    mean(Grab_duration_control),...
    mean(App2_duration_control),...
    mean(Def2_duration_control)];

figure
bar([1,2],[Med_Exc;Med_control],'stacked')
legend({'Approach','Investigation','Avoid','Defense','Grab','Intruders approach','Intruders defense'})
box off
ylabel('Duration (s)','FontSize',24)
set(gcf,'color','white')
set(gca,'xticklabels',{'Control','Exc'},'FontSize',20)

% %% durations
% 
ivt_graph({App1_duration_Exc,App1_duration_control},[],'xticklabels',{'Control','Exc'},'showpoints',1,'errorbars','sem')
ylabel('App1 Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')

ivt_graph({Investigation_duration_Exc,Investigation_duration_control},[],'xticklabels',{'Control','Exc'},'showpoints',1,'errorbars','sem','showpairing',true)
ylabel('Investigation Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')


ivt_graph({Avoid_duration_Exc,Avoid_duration_control},[],'xticklabels',{'Control','Exc'},'showpoints',1,'errorbars','sem')
ylabel('Avoid Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')


ivt_graph({Grab_duration_Exc,Grab_duration_control},[],'xticklabels',{'Control','Exc'},'showpoints',1,'errorbars','sem')
ylabel('Grab Duration (s)','FontSize',24) % later do:'correction','Bonferroni'
box off
set(gcf,'color','white')


