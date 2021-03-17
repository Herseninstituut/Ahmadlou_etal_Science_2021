clear all;
[figname,foldername] = uigetfile('*.fig','Select the Labelgram.');

% Ask for additional information such as mouse number
prompt = {'Mouse Number or Code','Date (DDMMYY)','Video Name (e.g. newobject_blue_1_3)'};
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
E.ApproachNEW_start = [];
E.ApproachNEW_end = [];
E.SniffNEW_start = [];
E.SniffNEW_end = [];
E.BiteNEW_start = [];
E.BiteNEW_end = [];
E.GrabNEW_start = [];
E.GrabNEW_end = [];
E.CarryNEW_start = [];
E.CarryNEW_end = [];
E.AvoidNEW_start = [];
E.AvoidNEW_end = [];
E.ApproachOLD_start = [];
E.ApproachOLD_end = [];
E.SniffOLD_start = [];
E.SniffOLD_end = [];
E.BiteOLD_start = [];
E.BiteOLD_end = [];
E.GrabOLD_start = [];
E.GrabOLD_end = [];
E.CarryOLD_start = [];
E.CarryOLD_end = [];
E.AvoidOLD_start = [];
E.AvoidOLD_end = [];
E.Opto_start = [];
E.Opto_end = [];
E.AdditionalInfo.MouseNumber = Z{1};
E.AdditionalInfo.Date = Z{2};
E.AdditionalInfo.VideoName = Z{3};

% Get New Object and Old Object timestamps
OldTS = [];
NewTS = [];
for q = 1:Nbut
    CurBut = dataObjs(q);
    if ~isempty(CurBut.DisplayName)
        switch CurBut.DisplayName
            case {'Old','old'}
                W = sort(CurBut.XData,1);
                OldTS = [W(1,:)/FR; W(end,:)/FR]; % convert to seconds
            case {'New','new'}
                W = sort(CurBut.XData,1);
                NewTS = [W(1,:)/FR; W(end,:)/FR]; % convert to seconds
            otherwise
        end
    end
end

% Get all other behavior timestamps
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
        if string(CurBut.DisplayName) ~= 'Opto' && string(CurBut.DisplayName) ~= 'opto'... % only opto button is not divided into new and old
                && string(CurBut.DisplayName) ~= 'New' && string(CurBut.DisplayName) ~= 'new'... % and don't include new and old
                && string(CurBut.DisplayName) ~= 'Old' && string(CurBut.DisplayName) ~= 'old'
            Ni = [];
            Oi = [];
            for w = 1:size(Cs,2)
                % For all timestamps of this button, check if it is New or
                % Old object
                mid = (Ce(w)-Cs(w))/2+Cs(w);
                N = prod(NewTS - mid,1);
                O = prod(OldTS - mid,1);
                if any(N<0)
                    % Save index of New and Old events
                    Ni = [Ni w];
                else if any(O<0)
                    Oi = [Oi w];
                    else
                        Ner = Ner+1;
                        prompt = sprintf('For event nr %d of behavior "%s", from frame %6.f to frame %6.f, it was not clear whether the object was old or new. The event was not saved.',w,string(CurBut.DisplayName),Cs(w)*FR,Ce(w)*FR);
                        disp(prompt)
                        E.Errors{Ner,1} = prompt;
                    end
                end
            end
        end
        switch string(CurBut.DisplayName)
            % Store Old and New timestamps of current button in correct
            % section
            case {'Approach','approach'}
                E.ApproachNEW_start = Cs(Ni);
                E.ApproachNEW_end   = Ce(Ni);
                E.ApproachOLD_start = Cs(Oi);
                E.ApproachOLD_end   = Ce(Oi);
            case {'Sniff','sniff'}
                E.SniffNEW_start = Cs(Ni);
                E.SniffNEW_end   = Ce(Ni);
                E.SniffOLD_start = Cs(Oi);
                E.SniffOLD_end   = Ce(Oi);
            case {'Bite','bite'}
                E.BiteNEW_start = Cs(Ni);
                E.BiteNEW_end   = Ce(Ni);
                E.BiteOLD_start = Cs(Oi);
                E.BiteOLD_end   = Ce(Oi);
            case {'Grab','grab'}
                E.GrabNEW_start = Cs(Ni);
                E.GrabNEW_end   = Ce(Ni);
                E.GrabOLD_start = Cs(Oi);
                E.GrabOLD_end   = Ce(Oi);
            case {'Carry','carry'}
                E.CarryNEW_start = Cs(Ni);
                E.CarryNEW_end   = Ce(Ni);
                E.CarryOLD_start = Cs(Oi);
                E.CarryOLD_end   = Ce(Oi);
            case {'Avoid','avoid'}
                E.AvoidNEW_start = Cs(Ni);
                E.AvoidNEW_end   = Ce(Ni);
                E.AvoidOLD_start = Cs(Oi);
                E.AvoidOLD_end   = Ce(Oi);
            case {'Opto','opto'}
                E.Opto_start = Cs;
                E.Opto_end   = Ce;
            case {'Old','old','New','new'}
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