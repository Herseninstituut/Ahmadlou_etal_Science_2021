clfunction Extract_Labels_from_Jabfile()
% This function extracts the manual labels from a jab file, stores them
% in a standardized struct, and saves this struct as "LabelExtraction.mat" 
% in the same directory as the jab file that was selected. For this script
% to run, you need to have JAABA in your path (or at the very least, the 
% JAABA script called "extractLabels.m"). This function currently supports
% extraction of labels from these projects:
%   Novel Object (1 old, 1 new)
%   Jumping
%   Push Bedding
%   Social Investigation
%   Aggression
%   One Novel Object
% 
% Janou Houba, Nov 2019
% Last update: 10-01-2020

% Check if JAABA script needed to run this script is in path
if exist('extractLabels.m','file')==0
    disp('JAABA may not be in your path. Check, then run the script again.')
    return
end

% Ask user for JAABA analysis file
[jabfile,jabfolder] = uigetfile('*.*','Select JAABA analysis file.','\\vs01\CSF_DATA\Shared\InVivo\Experiments\JAABA_analysis');
cd(jabfolder)

% Get additional information (mouse number, date of experiment, and name of experiment video) 
% and ask for double check
slashes = find(jabfolder=='\');
[~,s] = regexp(jabfolder,'JAABA_analysis');
[~,idx] = min(abs(slashes-s));
definput{1} = jabfolder(slashes(idx+2)+1:slashes(idx+3)-1);
if ~isempty(regexp(definput{1},'\d{5}[-_]\d+','once'))
    definput{2} = definput{1}(7:end);
    definput{1} = definput{1}(1:5);
else
    definput{2} = 'unknown';
end
definput{3} = jabfolder(slashes(end-1)+1:slashes(end)-1);
prompt = {'Mouse Number or Code',...
          'Date',...
          'Video Name (e.g. newobject_blue_1_3)'};
title = 'Additional Info... Correct?';
dims = [1 50];
Z = inputdlg(prompt,title,dims,definput);

% Get FrameRate
if isfile([jabfolder,'movie.avi'])
    VidInfo = VideoReader('movie.avi');
    FR = VidInfo.FrameRate;
else
    prompt = 'Was unable to determine the frame rate of the video. Please make sure "movie.avi" is in the same folder as your selected jab file.';
    disp(prompt)
    return
end

% Run JAABA function for extracting labels (saves it as a .txt file)
extractLabels(jabfile,'JAABA_extractLabels_Output.txt');

% Load the JAABA output as a table and discard irrelevant columns
LabelTable = readtable('JAABA_extractLabels_Output.txt','Delimiter','space');
LabelTable = LabelTable(:,end-2:end);
LabelTable.Properties.VariableNames = {'Start','End','Button'};
LabelTable.Start = LabelTable.Start - 1; % JAABA labels events of e.g. duration = 1 frame like this: start = x; end = x. 
% This creates a problem when you calculate the duration of this event by substraction of start from end (duration = 0).
% Substracting 1 from every start timestamp solves this. (This way, an event starting on the first frame will have 
% start = 0 instead of start = 1. Which makes sense: time always starts at t = 0, not t = 1.)

% Determine which project this jabfile belongs to
ProjectKlikkers = {'New', 'Alert', 'Push_Bedding', 'App1', 'Agression'};
w = 0;
match = 0;
while match == 0
    w = w+1;
    if w == 6 && match == 0 % If the project can't be determined this way, ask user to select the project name
        w = listdlg('ListString',{'Novel Object','Jumping','Push Bedding','Social Investigation','Aggression','One Novel Object'},...
                            'PromptString',{'It was not clear which project you are working on.', 'Please choose.'},...
                            'SelectionMode','single','ListSize',[300 90]);
        match = 1;
    else
        match = any(strcmp(LabelTable.Button,ProjectKlikkers{w}));
    end
end

switch w
    case 1 % Project = Novel Object
        E = MakeEforNovObj(LabelTable,FR,Z);
    case 2 % Project = Jumping
        ButtonNames = {'Alert','Run','Posture','Jump','Freeze','Avoid','Grooming','Opto'};
        E = MakeEforOtherProj(LabelTable,ButtonNames,FR,Z);
    case 3 % Project = Push Bedding
        ButtonNames = {'Push_Bedding','Run','Dig','Freeze','Self_groom','Jump','Rearing','Tail_Rattling','Opto'};
        E = MakeEforOtherProj(LabelTable,ButtonNames,FR,Z);
    case 4 % Project = Social Investigation
        ButtonNames = {'App1','Follow','Accept','Avoid','Def1','Anogenital','Facial','Body','Grab','Opto','App2','Def2'};
        E = MakeEforOtherProj(LabelTable,ButtonNames,FR,Z);
    case 5 % Project = Aggression
        ButtonNames = {'Agression','Avoidance','Passive','Active','Acceptance'};
        E = MakeEforOtherProj(LabelTable,ButtonNames,FR,Z);
    case 6 % Project = One Novel Object
        ButtonNames = {'approach','Sniff','Bite','Grab','Carry','Avoid','Opto'};
        E = MakeEforOtherProj(LabelTable,ButtonNames,FR,Z);
end

save('LabelExtraction','E')
disp('Extraction successful!')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Subfunctions to make the data struct "LabelExtraction.mat" with the
% LabelTable. Novel Object uses a different function because of the New/Old
% seperation of events. 

    function E = MakeEforOtherProj(LabelTable,ButtonNames,FR,Z)
    E = [];
    Ner = 0; % Number of errors (event is not Old or New)
    Errors = [];

    % Check for unrecognized label names
    if any(~ismember(LabelTable.Button,ButtonNames) & ~startsWith(LabelTable.Button,'No_'))
        unreclabels = unique(LabelTable.Button(~ismember(LabelTable.Button,ButtonNames) & ~startsWith(LabelTable.Button,'No_')));
        for q = 1:length(unreclabels)
            % Print and store error if unrecognized label was found
            Ner = Ner+1;
            prompt = ['Label "',unreclabels{q},'" is not recognized. Events with this name were not saved.'];
            disp(prompt)
            Errors{Ner,1} = prompt;
        end
    end
    
    % Store labels in stuct "E"
    for q = 1:length(ButtonNames)
        CurBut = ButtonNames{q};
        E.([CurBut,'_start']) = [];
        E.([CurBut,'_end'])   = [];
        if any(strcmp(LabelTable.Button,CurBut))
            E.([CurBut,'_start']) = LabelTable.Start(strcmp(LabelTable.Button,CurBut))/FR';
            E.([CurBut,'_end'])   = LabelTable.End(strcmp(LabelTable.Button,CurBut))/FR';
        end
    end
    
    % Fix "Agression" typo (should be: "Aggression")
    if isfield(E,'Agression')
        E.Aggression_start = E.Agression_start;
        E.Aggression_end = E.Agression_end;
        E = rmfield(E,{'Agression_start','Agression_end'});
        E = orderfields(E,[7,8,1:6]);
    end
    
    % Fix capital problem of button "approach". (Should be "Approach".)
    if isfield(E,'approach')
        E.Approach_start = E.approach_start;
        E.Approach_end = E.approach_end;
        E = rmfield(E,{'approach_start','approach_end'});
        E = orderfields(E,[11,12,1:10]);
    end
    
    E.AdditionalInfo.MouseNumber = Z{1};
    E.AdditionalInfo.Date = Z{2};
    E.AdditionalInfo.VideoName = Z{3};
    
    if ~isempty(Errors) % Store errors if any.
        E.Errors = Errors;
    end
    
    end



    function E = MakeEforNovObj(LabelTable,FR,Z)
    ButtonNames = {'approach','Sniff','Bite','Grab','Carry','Avoid'};
    Ner = 0; % Number of errors (event is not Old or New)
    Errors = [];

    % Check for unrecognized label names
    if any(~ismember(LabelTable.Button,[ButtonNames, 'Old','New','Opto']) & ~startsWith(LabelTable.Button,'No_'))
        unreclabels = unique(LabelTable.Button(~ismember(LabelTable.Button,[ButtonNames, 'Old','New','Opto']) & ~startsWith(LabelTable.Button,'No_')));
        for q = 1:length(unreclabels)
            % Print and store error if unrecognized label was found
            Ner = Ner+1;
            prompt = ['Label "',unreclabels{q},'" is not recognized. Events with this name will not be saved.'];
            disp(prompt)
            Errors{Ner,1} = prompt;
        end
    end
    
    E = struct('ApproachNEW_start',[],'ApproachNEW_end',[],'SniffNEW_start',[],'SniffNEW_end',[],'BiteNEW_start',[],'BiteNEW_end',[],...
               'GrabNEW_start',[],'GrabNEW_end',[],'CarryNEW_start',[],'CarryNEW_end',[],'AvoidNEW_start',[],'AvoidNEW_end',[],...
               'ApproachOLD_start',[],'ApproachOLD_end',[],'SniffOLD_start',[],'SniffOLD_end',[],'BiteOLD_start',[],'BiteOLD_end',[],...
               'GrabOLD_start',[],'GrabOLD_end',[],'CarryOLD_start',[],'CarryOLD_end',[],'AvoidOLD_start',[],'AvoidOLD_end',[],...
               'Opto_start',[],'Opto_end',[]);

    NewTS = [sort(LabelTable.Start(strcmp(LabelTable.Button,'New')))'; sort(LabelTable.End(strcmp(LabelTable.Button,'New')))'];
    OldTS = [sort(LabelTable.Start(strcmp(LabelTable.Button,'Old')))'; sort(LabelTable.End(strcmp(LabelTable.Button,'Old')))'];

    % For every event of every button/label, determine if Old or New and
    % store accordingly.
    for q = 1:length(ButtonNames)
        CurBut = ButtonNames{q};
        E.([CurBut,'NEW_start']) = [];
        E.([CurBut,'NEW_end'])   = [];
        E.([CurBut,'OLD_start']) = [];
        E.([CurBut,'OLD_end'])   = [];
        CurTS = [LabelTable.Start(strcmp(LabelTable.Button,CurBut))'; LabelTable.End(strcmp(LabelTable.Button,CurBut))'];
        for w = 1:size(CurTS,2)
            % For every event, take the timestamp in the middle (between
            % start and end). This timestamp should be between the start
            % and end of either an "Old" event or "New" event. So, when
            % substracting this middle point from the list of start and end
            % timestamps of both Old and New, there should be only 1 event where
            % the start is a negative digid AND the end is a positive
            % digid. When multiplying all starts with their respective
            % ends, this event should be the only negative value.
            mid = (CurTS(2,w)-CurTS(1,w))/2+CurTS(1,w);
            N = prod(NewTS - mid,1);
            O = prod(OldTS - mid,1);
            if any(N<0) && any(O<0) % Check if an event is labeled as both "Old" AND "New", and convey an error if so.
                Ner = Ner+1;
                prompt = sprintf('The behavior %s from frame %d to %d was labeled as BOTH Old AND New. The event was not saved.',...
                         CurBut,CurTS(1,w),CurTS(2,w));
                disp(prompt)
                Errors{Ner,1} = prompt;
            else
                if any(N<0)
                    % Save index of New and Old events
                    E.([CurBut,'NEW_start']) = [E.([CurBut,'NEW_start']), CurTS(1,w)/FR];
                    E.([CurBut,'NEW_end'])   = [E.([CurBut,'NEW_end']), CurTS(2,w)/FR];
                else
                    if any(O<0)
                        E.([CurBut,'OLD_start']) = [E.([CurBut,'OLD_start']), CurTS(1,w)/FR];
                        E.([CurBut,'OLD_end'])   = [E.([CurBut,'OLD_end']), CurTS(2,w)/FR];
                    else
                        % Print and store errors occurring when an event has
                        % not been labeled as either Old or New.
                        Ner = Ner+1;
                        prompt = sprintf('The behavior %s from frame %d to %d was NOT labeled as Old OR New. The event was not saved.',...
                                 CurBut,CurTS(1,w),CurTS(2,w));
                        disp(prompt)
                        Errors{Ner,1} = prompt;
                    end
                end
            end
        end
    end

    % Fix capital problem of button "approach". (Should be "Approach".)
    E.ApproachNEW_start = E.approachNEW_start;
    E.ApproachNEW_end   = E.approachNEW_end;
    E.ApproachOLD_start = E.approachOLD_start;
    E.ApproachOLD_end   = E.approachOLD_end;
    E = rmfield(E,{'approachNEW_start','approachNEW_end','approachOLD_start','approachOLD_end'});

    E.Opto_start = LabelTable.Start(strcmp(LabelTable.Button,'Opto'))/FR';
    E.Opto_end   = LabelTable.End(strcmp(LabelTable.Button,'Opto'))/FR';

    % Store additional info.
    E.AdditionalInfo.MouseNumber = Z{1};
    E.AdditionalInfo.Date = Z{2};
    E.AdditionalInfo.VideoName = Z{3};

    if ~isempty(Errors) % Store errors if any.
        E.Errors = Errors;
    end
    
    end
end