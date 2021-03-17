load('\\vs01\csf_data\Shared\InVivo\Experiments\JAABA_analysis\SessionUpdates\Session_Object_Social_26032020.mat')

GAD2_Exc = [];
for i=1:length(S)
    if strcmp(S(i).group,'GAD2_ZI_Exc')==1 % 'GAD2_ZI_Exc_PLCNO'
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

for i = GAD2_Exc
    % push bedding
    if ~isempty(S(i).NovelObject)==1 && isfield(S(i).NovelObject,'aCricNew')==1
    NovObj = S(i).NovelObject.aCricNew;
    for j=1:length(NovObj)
            App_NEW_duration_Exc = [App_NEW_duration_Exc , sum(NovObj{j}.Approach_end - NovObj{j}.Approach_start)];
            Sniff_NEW_duration_Exc = [Sniff_NEW_duration_Exc , sum(NovObj{j}.Sniff_end - NovObj{j}.Sniff_start)];
            Bite_NEW_duration_Exc = [Bite_NEW_duration_Exc , sum(NovObj{j}.Bite_end - NovObj{j}.Bite_start)];
            Grab_NEW_duration_Exc = [Grab_NEW_duration_Exc , sum(NovObj{j}.Grab_end - NovObj{j}.Grab_start)];
            Carry_NEW_duration_Exc = [Carry_NEW_duration_Exc , sum(NovObj{j}.Carry_end - NovObj{j}.Carry_start)];
            Avoid_NEW_duration_Exc = [Avoid_NEW_duration_Exc , sum(NovObj{j}.Avoid_end - NovObj{j}.Avoid_start)];
        end
    end
end

% % stacked bargraph

Med_NEW_Exc = [mean(App_NEW_duration_Exc),...
    mean(Sniff_NEW_duration_Exc),...
    mean(Bite_NEW_duration_Exc),...
    mean(Grab_NEW_duration_Exc),...
    mean(Carry_NEW_duration_Exc),...
    mean(Avoid_NEW_duration_Exc)];


% cd \\vs01\MVP\Shared\InVivo\Experiments\Investigation_Figures\PL_ZI\hM4Di

%% Colors

C_approach=[0 114 189]/255;
C_sniff=[217 83 25]/255;
C_bite=[237 177 32]/255;
C_grab=[126 47 142]/255;
C_carry=[119 172 48]/255;
C_avoid=[77 190 238]/255;
%% Durations

Invest_Exc = Sniff_NEW_duration_Exc+Bite_NEW_duration_Exc+Carry_NEW_duration_Exc;
%% Number of events

App_NEW_number_Exc = [];
App_OLD_number_Exc = [];
Carry_NEW_number_Exc = [];
Carry_OLD_number_Exc = [];
Avoid_NEW_number_Exc = [];
Avoid_OLD_number_Exc = [];

for i = GAD2_Exc
    % novel object
    if ~isempty(S(i).NovelObject)==1 && isfield(S(i).NovelObject,'aCricNew')==1
    NovObj = S(i).NovelObject.aCricNew;
        for j=1:length(NovObj)
            App_NEW_number_Exc = [App_NEW_number_Exc , length(NovObj{j}.Approach_end - NovObj{j}.Approach_start)];
            Carry_NEW_number_Exc = [Carry_NEW_number_Exc , length(NovObj{j}.Carry_end - NovObj{j}.Carry_start)];
            Avoid_NEW_number_Exc = [Avoid_NEW_number_Exc , length(NovObj{j}.Avoid_end - NovObj{j}.Avoid_start)];

        end
    end
end
