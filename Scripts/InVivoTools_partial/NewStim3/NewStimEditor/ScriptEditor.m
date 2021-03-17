function ScriptEditor(figNum,soefig)

%  NewStim package
%
%  SCRIPTEDITOR
%
%  ScriptEditor brings up an editor for NewStim stimulus objects.  It allows
%  one to graphically browse stimulus objects in memory and perform several
%  operations on them.  These operations are the following:
%
%  Update             - Update the editor's list of stimuli.  This is useful if
%                       a non-graphical script creates a stimulus that the
%                       editor is not aware of.
%  Help               - Display this file.
%  New                - Create a new, empty script.
%  Open File          - Load a file into matlab; if scripts are in this file
%                       they will show up in the editor.
%  Save               - Save the currently selected scripts to a file.
%  Save All           - Save the entire list of scripts to a file.
%  Load               - Tell the script to load its stimuli into memory.
%  Edit               - Edit the script
%  Delete             - Remove the currently selected scripts from memory.
%  Delete all         - Remove the entire list of scripts from memory.
%
%  One may also use
%
%  SCRIPTEDITOR(FIGNUM)
%
%  to tell the ScriptEditor to open in a particular figure.  The figure will be
%  cleared.
%
%                                         Questions to vanhoosr@brandeis.edu

if nargin==0 	
    fig = figure('WindowStyle','Normal','MenuBar','none','NumberTitle','off','Name','ScriptEditor');
    drawScriptEditor(fig);
    ScriptEditor('Update',fig);
elseif ~ischar(figNum)  % is the call described above
    fig = figNum; 
    figure(fig); 
    clf; 
    set(fig,'MenuBar','none');
    drawScriptEditor(fig); 
    ScriptEditor('Update',fig);
else % it is a callback
    command = figNum;
    theFig = gcbf;
    if isempty(theFig) && nargin~=2
        theFig = gcf;
    elseif nargin==2
        theFig = soefig; 
    end   
    scriptedstruct = get(theFig,'UserData');
    lb = scriptedstruct.lb;
    switch command
        case 'Update'
            g = listofvars('stimscript');
            set(lb,'String',g,'value',[]);
            z=geteditor('RemoteScriptEditor');
            if z
                RemoteScriptEditor('UpdateLoc',z);
            end
            ScriptEditor('EnableDisable',theFig);
        case 'Help'
            g = help('ScriptEditor');
            textbox('ScriptEditor help',g);
        case 'New'
            makeNewFig(gcbf);
        case 'NewOK'
            newstr = get(gcbf,'UserData');
            str = get(newstr.name,'String');
            ty = char(lb_getselected(newstr.lb));
            str = newscriptname(str,ty);
            if isempty(str)
                return
            end
            evalin('base',[str '=' ty  '(''graphical'');']);
            close(newstr.thisfig);
            z=geteditor('ScriptEditor');
            if z
                ScriptEditor('Update',z); 
            end
        case 'OpenFile'
            [fname,pathn] = uigetfile('*','Open file...');
            if fname(1)~=0
                evalin('base',['load ' pathn fname]);
            end
            ScriptEditor Update;
            z = geteditor('StimEditor');
            if z
                StimEditor('Update',z);
            end
        case 'Save'
            strs = lb_getselected(lb);
            if ~isempty(strs)
                varnames = catCellStr(strs);
                [fname,pathn]=uiputfile('*.mat','Save scripts as...');
                if fname(1)~=0
                    evalin('base',['save ''' pathn fname '''' varnames]);
                end
            end
        case 'SaveAll'
            strs = get(lb,'String');
            if ~isempty(strs)
                varnames = catCellStr(strs);
                [fname,pathn]=uiputfile('*.mat','Save scripts as...');
                if fname(1)~=0
                    evalin('base',['save ' pathn fname ' ' varnames]);
                end
            end
        case 'Load'
            strs = lb_getselected(lb);
            if ~isempty(strs)
                for i=1:length(strs)
                    g = char(strs(i));
                    evalin('base',[g '=loadStimScript(' g ');']);
                end
            end
        case 'Unload'
            % should only happen if psychtoolbox available
            strs = lb_getselected(lb);
            if ~isempty(strs)
                for i=1:length(strs)
                    g = char(strs(i));
                    evalin('base',[g '=unloadStimScript(' g ');']);
                end
            end
        case 'Strip'
            % should only happen if psychtoolbox available
            strs = lb_getselected(lb);
            if ~isempty(strs)
                for i=1:length(strs)
                    g = char(strs(i));
                    evalin('base',[g '=strip(' g ');']);
                end
            end
        case 'Edit' % should only occur when 1 script is selected
            strs = char(lb_getselected(lb));
            evalin('base',['ScriptObjEditor(''' strs ''');']);
        case 'Duplicate'
            % should only occur when 1 stimulus is selected
            namenotfound=1;
            prompt={'Name of new script:'}; def = {''};
            dlgTitle = 'New script name...';lineNo=1;
            while (namenotfound)
                answ=inputdlg(prompt,dlgTitle,lineNo,def);
                an = char(answ);
                if isempty(answ)
                    namenotfound = 0; %cancelled
                elseif isempty(an)
                    uiwait(errordlg('Syntax error in name'));
                elseif ~isvarname(an) % syntax err
                    uiwait(errordlg('Syntax error in name'));
                else % okay, make the stim
                    namenotfound = 0;
                    g = lb_getselected(lb); g = char(g);
                    evalin('base',[char(answ) '=' g ';']);
                end
            end
            ScriptEditor Update
        case 'Replace'
            ud = get(gcbf,'UserData');
            %            oldscriptname = char(lb_getselected(ud.lb));
            % should only occur when 1 stimulus is selected
            namenotfound = 1;
            prompt = {'Name of new script:'}; 
            def = {''};
            dlgTitle = 'New script name...';
            lineNo=1;
            while (namenotfound)
                answ = inputdlg(prompt,dlgTitle,lineNo,def);
                an = char(answ);
                g = lb_getselected(lb); 
                g = char(g);
                ty = evalin('base',['class(' g ')']);
                an = newscriptname(an,ty);
                if isempty(answ) 
                    namenotfound = 0; %cancelled
                elseif isempty(an)
                    uiwait(errordlg('Syntax error in name'));
                elseif ~isvarname(an) % syntax err
                    uiwait(errordlg('Name is in use as variable'));
                elseif exist(an,'file') % syntax err
                    uiwait(errordlg('Name is in use as function'));
                else % okay, make the stim
                    namenotfound = 0;
                    g = lb_getselected(lb); g=char(g);
                    ty = evalin('base',['class(' g ')']);
                    script = evalin('base',g);
                    eval(['nS=' ty '(''graphical'',script);']);
                    if ~isempty(nS)
                        assignin('base',an,nS);
                    end
                end
            end
            ScriptEditor Update
        case 'Delete'
            strs = lb_getselected(lb);
            if ~isempty(strs)
                varnames = catCellStr(strs);
                evalin('base',['clear ' varnames]);
            end
            set(lb,'value',[]);
            ScriptEditor Update;
        case 'DeleteAll'
            strs = get(lb,'String');
            if ~isempty(strs)
                varnames = catCellStr(strs);
                evalin('base',['clear ' varnames]);
            end
            set(lb,'value',[]);
            ScriptEditor Update;
        case 'Close'
            close(gcbf);
        case 'Movie'
            strs = lb_getselected(lb);
            for i = 1:length(strs)
                evalin('base',['NSCaptureMovie(' strs{i} ');']);
            end
        case 'Show'
            strs = lb_getselected(lb);
            for i = 1:length(strs)
                evalin('base',['NSLoadAndRunTest(' strs{i} ',false);']);
            end
        case 'EnableDisable'
            strs = get(lb,'String');
            if ~isempty(strs)
                set(scriptedstruct.saveall,'enable','on');
                set(scriptedstruct.deleteall,'enable','on');
            else
                set(scriptedstruct.saveall,'enable','off');
                set(scriptedstruct.deleteall,'enable','off');
            end
            strs = lb_getselected(lb);
            if ~isempty(strs)
                set(scriptedstruct.save,'enable','on');
                set(scriptedstruct.delete,'enable','on');
                if length(strs)==1
                    set(scriptedstruct.edit,'enable','on');
                    set(scriptedstruct.replace,'enable','on');
                    set(scriptedstruct.duplicate,'enable','on');
                    set(scriptedstruct.movie,'enable','on');
                    set(scriptedstruct.show,'enable','on');
                else
                    set(scriptedstruct.edit,'enable','off');
                    set(scriptedstruct.duplicate,'enable','off');
                    set(scriptedstruct.replace,'enable','off');
                    set(scriptedstruct.movie,'enable','off');
                    set(scriptedstruct.show,'enable','off');
                end
                if haspsychtbox
                    set(scriptedstruct.load,'enable','on');
                    set(scriptedstruct.unload,'enable','on');
                    set(scriptedstruct.strip,'enable','on');
                else
                    set(scriptedstruct.load,'enable','off');
                    set(scriptedstruct.unload,'enable','off');
                    set(scriptedstruct.strip,'enable','off');
                    set(scriptedstruct.movie,'enable','off');
                    set(scriptedstruct.show,'enable','off');
                end
            else
                set(scriptedstruct.save,'enable','off');
                set(scriptedstruct.delete,'enable','off');
                set(scriptedstruct.edit,'enable','off');
                set(scriptedstruct.load,'enable','off');
                set(scriptedstruct.unload,'enable','off');
                set(scriptedstruct.strip,'enable','off');
                set(scriptedstruct.duplicate,'enable','off');
                set(scriptedstruct.replace,'enable','off');
                set(scriptedstruct.movie,'enable','off');
                set(scriptedstruct.show,'enable','off');
            end
            if ~haspsychtbox
                set(scriptedstruct.load,'enable','off');
                set(scriptedstruct.unload,'enable','off');
                set(scriptedstruct.strip,'enable','off');
                set(scriptedstruct.movie,'enable','off');
                set(scriptedstruct.show,'enable','off');
            end
    end
end

function drawScriptEditor(h0)
set(h0,'Units','points','Color',[0.8 0.8 0.8],'Position',[145. 261. 503. 261.]);

lb = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[1 1 1], ...
    'Position',[270.88 10.566 211.325 232.457], ...
    'String',' ', ...
    'Style','listbox', ...
    'Tag','Listbox1', ...
    'Value',1,'Max',2,'Callback','ScriptEditor EnableDisable');

moviebt = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'FontWeight','bold', ...
    'ListboxTop',0, ...
    'Position',[16.329 210 112.386 22.093], ...
    'String','Create movie', ...
    'Tag','Pushbutton1','Callback','ScriptEditor Movie');
showbt = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'FontWeight','bold', ...
    'ListboxTop',0, ...
    'Position',[133.5190 210 112.386 22.093], ...
    'String','Show locally', ...
    'Tag','Pushbutton1','Callback','ScriptEditor Show');
updatebt = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'FontWeight','bold', ...
    'ListboxTop',0, ...
    'Position',[16.329 183.4685 112.386 22.093], ...
    'String','Update', ...
    'Tag','Pushbutton1','Callback','ScriptEditor Update');
helpbt = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'FontWeight','bold', ...
    'ListboxTop',0, ...
    'Position',[133.5190  183.4686  112.3865   22.0931], ...
    'String','Help', ...
    'Tag','Pushbutton1','Callback','ScriptEditor Help');
newbt = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'FontWeight','bold', ...
    'ListboxTop',0, ...
    'Position',[16.329 156.57265 112.3865 21.1325 ], ...
    'String','New', ...
    'Tag','Pushbutton1','Callback','ScriptEditor New');
openbt = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'FontWeight','bold', ...
    'ListboxTop',0, ...
    'Position',[16.329 130.63 112.3865 21.1325], ...
    'String','Open File', ...
    'Tag','Pushbutton1','Callback', 'ScriptEditor OpenFile');
savebt = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'FontWeight','bold', ...
    'ListboxTop',0, ...
    'Position',[16.3296 36.5015994 112.3865 22.093], ...
    'String','Save', ...
    'Tag','Pushbutton1','Callback','ScriptEditor Save');
saveallbt = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'FontWeight','bold', ...
    'ListboxTop',0, ...
    'Position',[ 133.5190   37.4622  112.3865   21.1325], ...
    'String','Save All', ...
    'Tag','Pushbutton1','Callback','ScriptEditor SaveAll');
loadbt = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'FontWeight','bold', ...
    'ListboxTop',0, ...
    'Position',[133.5190  130.6373  112.3865   21.1325], ...
    'String','Load', ...
    'Tag','Pushbutton1','Callback','ScriptEditor Load');
unloadbt = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'Callback','ScriptEditor Unload', ...
    'Enable','off', ...
    'FontWeight','bold', ...
    'ListboxTop',0, ...
    'Position',[16.3297 97.0174 112.3865 22.093 ], ...
    'String','Unload', ...
    'Tag','Pushbutton1');
stripbt = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'Callback','ScriptEditor Strip', ...
    'Enable','off', ...
    'FontWeight','bold', ...
    'ListboxTop',0, ...
    'Position',[133.5190   97.0174  112.3865   21.1325], ...
    'String','Strip', ...
    'Tag','Pushbutton1');
duplicatebt = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'Callback','ScriptEditor Duplicate', ...
    'FontWeight','bold', ...
    'ListboxTop',0, ...
    'Position',[133.5190  156.5727  112.3865   21.1325], ...
    'String','Duplicate', ...
    'Tag','Pushbutton1');
editbt = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'FontWeight','bold', ...
    'ListboxTop',0, ...
    'Position',[16.3297 64.358 112.3865 21.1325 ], ...
    'String','Edit', ...
    'Tag','Pushbutton1','Callback','ScriptEditor Edit');
replacebt = uicontrol('Parent',h0, ... % should really be newbasedon
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'FontWeight','bold', ...
    'ListboxTop',0, ...
    'Position',[133.5190 64.358 112.3865 21.1325 ], ...
    'String','New based on...', ...
    'Tag','Pushbutton1','Callback','ScriptEditor Replace');
deletebt = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'FontWeight','bold', ...
    'ListboxTop',0, ...
    'Position',[16.3297   13.4480  112.3865   21.1325], ...
    'String','Delete', ...
    'Tag','Pushbutton1','Callback','ScriptEditor Delete');
deleteallbt = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'FontWeight','bold', ...
    'ListboxTop',0, ...
    'Position',[133.5190   12.4874  112.3865   22.0931], ...
    'String','Delete All', ...
    'Tag','Pushbutton1','Callback','ScriptEditor DeleteAll');
set(h0,'UserData',struct('lb',lb,'update',updatebt,'help',helpbt,'new',newbt,...
    'openfile',openbt,'save',savebt,'saveall',saveallbt,'load',loadbt,...
    'edit',editbt,'delete',deletebt,'deleteall',deleteallbt, ...
    'unload',unloadbt,'strip',stripbt,'duplicate',duplicatebt,'tag',...
    'ScriptEditor','replace',replacebt,'movie',moviebt,'show',showbt));

function makeNewFig(figNum)
h0 = figure('WindowStyle','normal','Color',[0.8 0.8 0.8], ...
    'PaperPosition',[18 180 576 432], ...
    'PaperUnits','points', ...
    'Position',[402 204 350 239], ...
    'Tag','Fig2', ...
    'MenuBar','none');
settoolbar(h0,'none');
uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'ListboxTop',0, ...
    'Position',[71.2 9.6 63.2 24.8], ...
    'String','OK', ...
    'Tag','Pushbutton1','Callback','ScriptEditor NewOK');
uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'FontSize',14, ...
    'FontWeight','bold', ...
    'HorizontalAlignment','left', ...
    'ListboxTop',0, ...
    'Position',[14.4 40 50.4 19.2], ...
    'String','Name:', ...
    'Style','text', ...
    'Tag','StaticText1');
namectl = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[1 1 1], ...
    'ListboxTop',0, ...
    'Position',[68.8 37.6 197.6 24.8], ...
    'Style','edit', ...,
    'HorizontalAlignment','left',...
    'Tag','EditText1');
lb = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[1 1 1], ...
    'Position',[19.2 80 244 77.6], ...
    'String',NewStimScriptList, ...
    'Style','listbox', ...
    'Tag','Listbox1', ...
    'Value',1);
uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'FontSize',14, ...
    'FontWeight','bold', ...
    'ListboxTop',0, ...
    'Position',[10.4 163.2 100.8 17.6], ...
    'String','stimscript Type:', ...
    'Style','text', ...
    'Tag','StaticText2');
uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'ListboxTop',0, ...
    'Position',[152.8 9.6 63.2 24.8], ...
    'String','Cancel', ...
    'Tag','Pushbutton1','Callback','close(gcbf);');
set(h0,'UserData',struct('lb',lb,'name',namectl,'parentFig',figNum,'thisfig',h0));


function str = newscriptname(str,ty)
if isempty(str)
    str = [ty(1:min(10,end)) '_' datestr(now,30)]; % truncating, because matlab 5 has variable length restrictions
end
 if exist(str)>1 %#ok<EXIST>
     errordlg(['Script name ''' str ''' already used by matlab.'],'ScriptEditor');
     str = '';
     return
 end
if ~isvarname(str)
    errordlg(['Script name ''' str ''' is not a valid variable name.'],'ScriptEditor');
    str = '';
    return
end