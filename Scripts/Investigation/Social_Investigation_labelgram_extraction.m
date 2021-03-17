[figname,foldername] = uigetfile('*.fig','Select the Labelgram.');

% Ask for additional information such as mouse number
prompt = {'Mouse Number or Code','Date (DDMMYY or "unknown")','Video Name (e.g. newobject_blue_1_3)'};
title = 'Additional Info';
dims = [1 50];
Z = inputdlg(prompt,title,dims);

f = openfig([foldername,figname]);

FR = 30; % framerate, to convert from frame number to seconds

s=findobj('type','legend');
delete(s); % first remove the legends
axObjs = f.Children;
dataObjs = axObjs.Children;

Nbut = length(dataObjs); % number of buttons
Ner = 0; % number of errors

% Pre-allocate, and save additional info
% If a button was removed, the section stays empty.
E = [];
E.Approach_start = [];
E.Approach_end = [];
E.Follow_start = [];
E.Follow_end = [];
E.Accept_start = [];
E.Accept_end = [];
E.Avoid_start = [];
E.Avoid_end = [];
E.Defensive_start = [];
E.Defensive_end = [];
E.Anogenital_investigation_start = [];
E.Anogenital_investigation_end = [];
E.Facial_investigation_start = [];
E.Facial_investigation_end = [];
E.Body_investigation_start = [];
E.Body_investigation_end = [];
E.Grab_start = [];
E.Grab_end = [];
E.Opto_start = [];
E.Opto_end = [];
E.Approach_by_other_mouse_start = [];
E.Approach_by_other_mouse_end = [];
E.Defensive_by_other_mouse_start = [];
E.Defensive_by_other_mouse_end = [];
E.AdditionalInfo.MouseNumber = Z{1};
E.AdditionalInfo.Date = Z{2};
E.AdditionalInfo.VideoName = Z{3};

% Get all behavior timestamps
for q = 1:Nbut
    C = [];
    Cs = [];
    Ce = [];
    CurBut = dataObjs(q);
    if ~isempty(CurBut.DisplayName)
        % Take timestamps of current button and convert to seconds
        C = sort(CurBut.XData,1);
        Cs = C(1,:)/FR;
        Ce = C(end,:)/FR;
        switch string(CurBut.DisplayName)
            % Store the timestamps in correct section
            case 'App1'
                E.Approach_start = Cs;
                E.Approach_end   = Ce;
            case 'Follow'
                E.Follow_start = Cs;
                E.Follow_end   = Ce;
            case 'Accept'
                E.Accept_start = Cs;
                E.Accept_end   = Ce;
            case 'Avoid'
                E.Avoid_start = Cs;
                E.Avoid_end   = Ce;
            case 'Def1'
                E.Defensive_start = Cs;
                E.Defensive_end = Ce;
            case 'Anogenital'
                E.Anogenital_investigation_start = Cs;
                E.Anogenital_investigation_end   = Ce;
            case 'Facial'
                E.Facial_investigation_start = Cs;
                E.Facial_investigation_end = Ce;
            case 'Body'
                E.Body_investigation_start = Cs;
                E.Body_investigation_end = Ce;
            case 'Grab'
                E.Grab_start = Cs;
                E.Grab_end = Ce;
            case 'Opto'
                E.Opto_start = Cs;
                E.Opto_end   = Ce;
            case 'App2'
                E.Approach_by_other_mouse_start = Cs;
                E.Approach_by_other_mouse_end   = Ce;
            case 'Def2'
                E.Defensive_by_other_mouse_start = Cs;
                E.Defensive_by_other_mouse_end = Ce;
            otherwise
                Ner = Ner+1;
                prompt = ['Timestamps of behavior "' CurBut.DisplayName '" were not saved. Check the spelling.'];
                disp(prompt)
                E.Errors{Ner,1} = prompt;
        end
    end
end
close(f)
cd(foldername) % save in the same folder
save('LabelgramExtraction','E')