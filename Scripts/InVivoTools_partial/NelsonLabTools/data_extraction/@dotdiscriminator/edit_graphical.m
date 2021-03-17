function [ndd] = edit_graphical(thedd,arg2,arg3,fig)

%  EDIT_GRAPHICAL(DD)
%
%  Allows for graphical editing of parameters for DOTDISCRIMINATOR DD.
%
%  NDD = EDIT_GRAPHICAL(DD,'NAME')
%
%  Allows editing of the DOTDISCRIMINATOR object DD with name 'NAME' in the
%  main workspace.
%
%  NDD = EDIT_GRAPHICAL(DD,CKSDIRSTRUCT)
%  Allows editing of DD.  When the user selects "Select Data", the user is
%  prompted to select data from the CKSDIRSTRUCT.
%
%  NDD=EDIT_GRAPHICAL(DD,STRUCT.NAME,STRUCT.CKSDIRSTRUCT)
%  Combines the above two methods of calling.
%
%  See also:  DOTDISCRIMINATOR

name = '';cksds=[];
if nargin<=2,
    isname = 0;
    dd = thedd;
    if nargin==2,
        try,
            isname = 1;
            if ischar(arg2),
                name=arg2;
                dd=evalin('base',name);
                if ~strcmp(class(dd),'dotdiscriminator'),
                    error([name ' is not a dotdiscriminator.']); end;
            elseif isstruct(arg2),
                isname = 1; name = arg2.name; cksds = arg2.cksdirstruct;
                dd = evalin('base',name);
                if ~strcmp(class(dd),'dotdiscriminator'),
                    error([name ' is not a dotdiscriminator.']); end;
            elseif isa(arg2,'cksdirstruct'),
                isname = 0; cksds = arg2;
            end;
        catch, error(lasterr); end;
    end;
    z = geteditor('extracttool');
    params=buildwindow(dd,isname,~isempty(z),name,cksds);
    if ~isname
        if isempty(params), ndd = thedd;
        else, ndd = dotdiscriminator(params); end;
    end;
else, % manage the command (arg3)
    if nargin==4, theFig = fig; else, theFig = gcbf; end;
    estruct = get(theFig,'userdata');
    %disp(['DD processing argument ' arg3 '.']);
    switch(arg3),
        case 'OK',
            p = checkinput(theFig);
            if ~isempty(p),
                ddnew = dotdiscriminator(p);
                assignin('base',estruct.ddname,ddnew);
                if ~isempty(estruct.browsewind)&ishandle(estruct.browsewind),
                    delete(estruct.browsewind);
                end;
                delete(theFig);
            end;
        case 'Apply',
            p = checkinput(theFig);
            if ~isempty(p),
                ddnew = dotdiscriminator(p);
                assignin('base',estruct.ddname,ddnew);
            end;
        case 'Cancel',
            if ~isempty(estruct.browsewind)&ishandle(estruct.browsewind),
                delete(estruct.browsewind);
            end;
            delete(theFig);
        case 'BrowseData',
            if isempty(estruct.browsewind)|~ishandle(estruct.browsewind),
                try, dots=eval(get(estruct.dots,'String')');
                catch, errordlg('Syntax error in dots.'); return; end;
                estruct.browsewind = makebrowsedata(theFig,dots,thedd);
                set(theFig,'userdata',estruct);
            else,   figure(estruct.browsewind); end;
        case 'BDok',
            if ishandle(estruct.browsewind),
                ud = get(estruct.browsewind,'userdata');
                dotstr = get(ud.dotslist,'String');
                dots = [];
                for i=1:length(dotstr),
                    dots(i,[1 2 3])=eval(dotstr{i});
                end;
                set(estruct.dots,'String',mat2str(dots,5));
                delete(estruct.browsewind); %drawnow; removed this line because slow
                estruct.browsewind = [];
                set(theFig,'userdata',estruct);
            end;
        case 'BDcan',
            if ishandle(estruct.browsewind),
                delete(estruct.browsewind); %drawnow; removed this line because slow
                estruct.browsewind = [];
                set(theFig,'userdata',estruct);
            end;
        case 'BDdata',
            if ishandle(estruct.browsewind),
                cont = 1; fname = 0;
                ud=get(estruct.browsewind,'userdata');
                if isa(ud.cksds,'cksdirstruct'),
                    str = getalltests(ud.cksds);
                    [s,v]=listdlg('PromptString','Select a test directory',...
                        'SelectionMode','single','ListString',str);
                    if ~isempty(s),
                        acq = loadStructArray([getpathname(ud.cksds) str{s} filesep 'acqParams_out' ]);
                        %[f,fi,ii] = intersect({acq.type},input_types(ud.dd)),
                        fi=1:size(acq,2),
                        rstr = {acq.name}; rstr = {rstr{fi}};
                        if ~isempty(rstr),
                            [sr,vr]=listdlg('PromptString','Select a record',...
                                'SelectionMode','single','ListString',rstr);
                            if ~isempty(sr)
                                [sn,vn]=listdlg('PromptString','Select a file','SelectionMode','single',...
                                    'ListString',cellstr(int2str((1:acq(sr).reps)')));
                                if ~isempty(sn),
                                    fname = [ getpathname(ud.cksds) str{s} filesep 'r' sprintf('%.3d',sn) ...
                                        '_' acq(fi(sr)).fname];
                                    pathname = '';
                                end;
                            end;
                        else, errordlg('Test contains no records compatible with dotdiscriminators.');
                        end;
                    end;
                else,
                    [fname,pathname]=uigetfile('*','Select data file...');
                end;
                if fname~=0,
                    try,
                        d = loadIgor([pathname fname]);
                        d = dotdiscfilter(thedd,d);
                    catch, cont = 0;
                        errordlg('File could not be read.'); cont = 0;
                    end;
                    if cont,
                        j=findobj(ud.dataax,'Tag','data');
                        if ishandle(j), delete(j); end;
                        j=findobj(ud.dataax,'Tag','points');
                        if ishandle(j), delete(j); end;
                        j=findobj(ud.dataax,'Tag','peaks');
                        if ishandle(j), delete(j); end;
                        axes(ud.dataax); hold off;
                        j = plot(d,'b'); set(j,'Tag','data'); hold on;
                        if get(ud.showpointschk,'value')==1,v='on';else,v='off';end;
                        j=plot(d,'bx');set(j,'Tag','points','Visible',v);
                        a=axis;axis([1 length(d) a(3) a(4)]);
                        zoom on;
                        edit_graphical(dotdiscriminator('default'),...
                            [],'BDupdate',theFig);
                    end;
                end;
            end;
        case 'BDupdate',
            if ishandle(estruct.browsewind),
                ud = get(estruct.browsewind,'userdata');
                j=findobj(ud.dataax,'Tag','data');
                if ishandle(j),
                    % check params
                    d = get(j,'YData');
                    % try,
                    j=findobj(ud.dataax,'Tag','peaks');
                    axes(ud.dataax);
                    if ishandle(j),delete(j);end;
                    j=findobj(ud.dataax,'Tag','thresh');
                    if ishandle(j),delete(j);end;
                    dotstr=get(ud.dotslist,'String');
                    dots = [];
                    for i=1:length(dotstr), dots(i,[1:3]) = eval(dotstr{i}); end;
                    if get(ud.showthreshchk,'value')==1,v='on';else,v='off';end;
                    for i=1:size(dots,1),
                        if dots(i,2)<0,colstr='k';else,colstr='g';end;
                        j=plot([0 length(d)],[dots(i,1) dots(i,1)],colstr);
                        set(j,'Tag','thresh','Visible',v);
                    end;
                    locs=dotdisc(ud.dd,d,dots')'; % dots
                    vals=d(locs);
                    if get(ud.showpeakschk,'value')==1,v='on';else,v='off';end;
                    j=plot(locs,vals,'ro');set(j,'Tag','peaks','Visible',v);
                    hvals=d(1:10:end); l=length(hvals);mult = length(d)/l;
                    axes(ud.histax);cla;hold off;
                    [n,x]=hist(hvals,fix(max([2 20*log(l)])));
                    bar(x,mult*n); a=axis;hold on;
                    if get(ud.showthreshchk,'value')==1,v='on';else,v='off';end;
                    n=histc(vals,x); bar(x,n,'r'); %dx = x(2)-x(1);
                    %plot(x,mult*l*dx*exp(-((x-m).*(x-m))/(2*sd*sd))/sqrt(2*pi*sd*sd),'g');
                    inds=locs(find(locs>40&locs<length(d)-41))'; axes(ud.waveax); cla;
                    if ~isempty(inds),inds = repmat(inds,1,51)+repmat(-25:25,length(inds),1);
                        plot(-25:25,d(inds'));a=axis;axis([-25 25 a(3) a(4)]); end;
                    hold on;
                    for i=1:size(dots,1),
                        if dots(i,2)<0, colstr = 'ko'; else, colstr = 'gx'; end;
                        j=plot(dots(i,3),dots(i,1),colstr);
                        set(j,'Tag','thresh','visible',v);
                    end;
                    %catch, errordlg('Could not update: check parameters.'); end;
                end;
            end;
        case 'BDAddDotUpBt',
            if ishandle(estruct.browsewind),
                ud = get(estruct.browsewind,'userdata');
                disp(['AddDotUpBt']);
                dotstr = get(ud.dotslist,'String');
                axes(ud.waveax);
                x = ginput(1); x(1) = round(x(1));
                dotstr{end+1} = mat2str([x(2) 1 x(1)],3);
                set(ud.dotslist,'String',dotstr);
                edit_graphical(dotdiscriminator('default'),[],'BDupdate',theFig);
            end;
        case 'BDAddDotDownBt',
            if ishandle(estruct.browsewind),
                ud = get(estruct.browsewind,'userdata');
                dotstr = get(ud.dotslist,'String');
                x = ginput(1); x(1) = round(x(1));
                dotstr{end+1} = mat2str([x(2) -1 x(1)],3);
                set(ud.dotslist,'String',dotstr);
                edit_graphical(dotdiscriminator('default'),[],'BDupdate',theFig);
            end;
        case 'BDDelDotBt',
            if ishandle(estruct.browsewind),
                ud = get(estruct.browsewind,'userdata');
                dotstr = get(ud.dotslist,'string');
                dotval = get(ud.dotslist,'value');
                if dotval==1, errordlg('Cannot delete first entry--try editing');
                else, dotstr = dotstr([1:(dotval-1) (dotval+1):length(dotstr)]);
                    set(ud.dotslist,'string',dotstr,'value',1);
                end;
                edit_graphical(dotdiscriminator('default'),...
                    [],'BDupdate',theFig);
            end;
        case 'BDEditDotBt',
            if ishandle(estruct.browsewind),
                ud = get(estruct.browsewind,'userdata');
                dotstr = get(ud.dotslist,'String');
                dotval = get(ud.dotslist,'value');
                x = ginput(1); x = x(2);
                thedot = eval([dotstr{dotval}]);
                thedot(1) = x;
                dotstr{dotval} = mat2str(thedot,5);
                set(ud.dotslist,'String',dotstr);
                edit_graphical(dotdiscriminator('default'),...
                    [],'BDupdate',theFig);
            end;
        case 'BDFlipDotBt',
            if ishandle(estruct.browsewind),
                ud = get(estruct.browsewind,'userdata');
                dotstr = get(ud.dotslist,'String');
                dotval = get(ud.dotslist,'value');
                thedot = eval([dotstr{dotval}]);
                thedot(2) = -thedot(2);
                dotstr{dotval} = mat2str(thedot,5);
                set(ud.dotslist,'String',dotstr);
                edit_graphical(dotdiscriminator('default'),...
                    [],'BDupdate',theFig);
            end;
        case 'BDshowpeaks',
            if ishandle(estruct.browsewind),
                ud = get(estruct.browsewind,'userdata');
                j = findobj(ud.dataax,'Tag','peaks');
                if ishandle(j),
                    v=set(j,'visible');
                    set(j,'visible',v{2-get(ud.showpeakschk,'value')});
                end;
            end;
        case 'BDshowpoints',
            if ishandle(estruct.browsewind),
                ud = get(estruct.browsewind,'userdata');
                j = findobj(ud.dataax,'Tag','points');
                if ishandle(j),
                    v=set(j,'visible');
                    set(j,'visible',v{2-get(ud.showpointschk,'value')});
                end;
            end;
        case 'BDshowthresh',
            if ishandle(estruct.browsewind),
                ud = get(estruct.browsewind,'userdata');
                j = findobj(ud.dataax,'Tag','thresh1');
                if ishandle(j),
                    v=set(j,'visible');
                    set(j,'visible',v{2-get(ud.showthreshchk,'value')});
                end;
                j = findobj(ud.dataax,'Tag','thresh2');
                if ishandle(j),
                    v=set(j,'visible');
                    set(j,'visible',v{2-get(ud.showthreshchk,'value')});
                end;
                j = findobj(ud.histax,'Tag','thresh1');
                if ishandle(j),
                    v=set(j,'visible');
                    set(j,'visible',v{2-get(ud.showthreshchk,'value')});
                end;
                j = findobj(ud.histax,'Tag','thresh2');
                if ishandle(j),
                    v=set(j,'visible');
                    set(j,'visible',v{2-get(ud.showthreshchk,'value')});
                end;
            end;
        case 'BDthresh1set',
            if ishandle(estruct.browsewind),
                ud = get(estruct.browsewind,'userdata');
                j=findobj(ud.dataax,'Tag','data');
                if ishandle(j),
                    threshmeth=get(ud.threshmethodpopup,'value')-1;
                    if threshmeth==0,
                        d = get(j,'YData'); sd = std(d); m=mean(d);
                    end;
                    % check params
                    x=ginput(1);x=x(2);if threshmeth==0,x=(x-m)/sd;end;
                    set(ud.thresh1,'String',sprintf('%f',x));
                    edit_graphical(dotdiscriminator('default'),...
                        [],'BDupdate',theFig);
                end;
            end;
        case 'BDthresh2set',
            if ishandle(estruct.browsewind),
                ud = get(estruct.browsewind,'userdata');
                j=findobj(ud.dataax,'Tag','data');
                if ishandle(j),
                    threshmeth=get(ud.threshmethodpopup,'value')-1;
                    if threshmeth==0,
                        d = get(j,'YData'); sd = std(d); m = mean(d);
                    end;
                    % check params
                    x=ginput(1);x=x(2);if threshmeth==0,x=(x-m)/sd;end;
                    set(ud.thresh2,'String',sprintf('%f',x));
                    edit_graphical(dotdiscriminator('default'),...
                        [],'BDupdate',theFig);
                end;
            end;
        case 'BDthreshmeth',
            if ishandle(estruct.browsewind),
                4,
                ud = get(estruct.browsewind,'userdata');
                j=findobj(ud.dataax,'Tag','data');
                if ishandle(j),
                    ov = get(ud.threshmethodpopup,'userdata');
                    nv = get(ud.threshmethodpopup,'value');
                    if ov~=nv, % must convert & update
                        set(ud.threshmethodpopup,'userdata',nv); % set it right
                        d=get(j,'YData'); sd = std(d); m = mean(d);
                        thresh1=eval(get(ud.thresh1,'String'));
                        thresh2=eval(get(ud.thresh2,'String'));
                        if ov==1, % N std dev convert to Absolute
                            thresh1=thresh1*sd+mean(d);thresh2=thresh2*sd+mean(d);
                        else, % Absolute convert to N std dev
                            thresh1=(thresh1-m)/sd;thresh2=(thresh2-m)/sd;
                        end;
                        set(ud.thresh1,'String',sprintf('%f',thresh1));
                        set(ud.thresh2,'String',sprintf('%f',thresh2));
                        edit_graphical(dotdiscriminator('default'),...
                            [],'BDupdate',theFig);
                    end;
                end;
            end;
    end;
end;


function p = buildwindow(dd,isname,hasdata,thename,cksds)

params = getparameters(dd);

filtmethval = params.filtermethod + 1;
filtargstr = mat2str(params.filterarg);
dotsstr = mat2str(params.dots);

scratchfilestr = params.scratchfile;
event_type_stringstr = params.event_type_string;
output_obj_val = params.output_object + 1;

h0 = figure('Color',[0.8 0.8 0.8], ...
    'PaperPosition',[18 180 576 432], ...
    'PaperUnits','points', ...
    'Position',[184   279   419 319], ...
    'Tag','Fig1', ...
    'Menu','none');
settoolbar(h0,'none');
title = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'FontSize',12, ...
    'FontWeight','bold', ...
    'ListboxTop',0, ...
    'Position',[12 228 176.8 17.6], ...
    'String','dotdiscriminator editor:', ...
    'Style','text', ...
    'Tag','StaticText1');
h1 = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'ListboxTop',0, ...
    'Position',[10.4 156.8 64.8 13.6], ...
    'String','Dots:', ...
    'Style','text', ...
    'Tag','StaticText2');
dots = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[1 1 1], ...
    'ListboxTop',0, ...
    'Position',[84 129 115.2 50], ...
    'Style','edit', 'String',dotsstr,...
    'Tag','EditText1','max',2);
enstr = 'on';% else, enstr = 'off'; end;
browsebt = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'ListboxTop',0, ...
    'Position',[211.2 143.2 68 19.2], ...
    'String','Browse data', ...
    'Tag','Pushbutton1','enable',enstr,'Callback',...
    'edit_graphical(dotdiscriminator(''default''),[],''BrowseData'');');
if ~isname, okcb = 'set(gcbo,''userdata'',[1]);uiresume(gcf);';
else, okcb = 'edit_graphical(dotdiscriminator(''default''),[],''OK'');'; end;
okbt = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'FontWeight','bold', ...
    'ListboxTop',0, ...
    'Position',[12.8 14.4 64 20.8], ...
    'String','OK', ...
    'Tag','Pushbutton2','UserData',0,'Callback',okcb);
if ~isname, cancb = 'set(gcbo,''userdata'',[1]);uiresume(gcf);';
else, cancb = 'edit_graphical(dotdiscriminator(''default''),[],''Cancel'');'; end;
canbt = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'FontWeight','bold', ...
    'ListboxTop',0, ...
    'Position',[146.4 14.4 64 20.8], ...
    'String','Cancel', ...
    'Tag','Pushbutton2','UserData',0,'Callback',cancb);
if isname,enstr = 'on'; else, enstr = 'off'; end;
applybt = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'FontWeight','bold', ...
    'ListboxTop',0, ...
    'Position',[80 14.4 64 20.8], ...
    'String','Apply', ...
    'Tag','Pushbutton2','enable',enstr,...
    'Callback','edit_graphical(dotdiscriminator(''default''),[],''Apply'');');
helpbt = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'FontWeight','bold', ...
    'ListboxTop',0, ...
    'Position',[215.2 14.4 64 20.8], ...
    'String','Help', ...
    'Tag','Pushbutton2','enable','off');
scratchfile = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[1 1 1], ...
    'ListboxTop',0, ...
    'Position',[84 82.4 115.2 20], ...
    'Style','edit', 'String',scratchfilestr,...
    'Tag','EditText1');
h1 = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'ListboxTop',0, ...
    'Position',[10.4 86.4 64.8 13.6], ...
    'String','scratchfile:', ...
    'Style','text', ...
    'Tag','StaticText2');
h1 = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'ListboxTop',0, ...
    'Position',[10.4 62.4 64.8 13.6], ...
    'String','event type:', ...
    'Style','text', ...
    'Tag','StaticText2');
event_type = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[1 1 1], ...
    'ListboxTop',0, ...
    'Position',[84 58.4 115.2 20], ...
    'Style','edit', 'String',event_type_stringstr,...
    'Tag','EditText1');
h1 = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'ListboxTop',0, ...
    'Position',[10.4 40.8 75.2 16], ...
    'String','output type:', ...
    'Style','text', ...
    'Tag','StaticText3');
output_type = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'ListboxTop',0, ...
    'Min',1, ...
    'Position',[92.8 40 88.8 18.4], ...
    'String',{'cksmultiunit', 'ckssingleunit'}, ...
    'Style','popupmenu', ...
    'Tag','PopupMenu1', ...
    'Value',output_obj_val);
filtmethod = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'ListboxTop',0, ...
    'Min',1, ...
    'Position',[88.8 200 85.2 18.4], ...
    'String',{'none', 'convolution', 'Chebyshev I'}, ...
    'Style','popupmenu', ...
    'Tag','PopupMenu1', ...
    'Value',filtmethval);
h1 = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'ListboxTop',0, ...
    'Position',[10.4 200.8 73.6 16], ...
    'String','Filter method:', ...
    'Style','text', ...
    'Tag','StaticText3');
filtargstring = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'ListboxTop',0, ...
    'Position',[178.4 200.8 68 16], ...
    'String','Arg:', ...
    'Style','text','HorizontalAlignment','left', ...
    'Tag','StaticText3');
filtarg = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[1 1 1], ...
    'ListboxTop',0, ...
    'Position',[232.8 200 81.6 18.4], ...
    'Style','edit', 'String',filtargstr,...
    'Tag','EditText2');
set(h0,'userdata',struct('title',title,'dots',dots,...
    'browsebt',browsebt,'okbt',okbt,'canbt',canbt,'applybt',applybt,...
    'helpbt',helpbt,'scratchfile',scratchfile,'event_type',event_type,...
    'output_type',output_type,'filtmethod',filtmethod,...
    'filtargstring',filtargstring,'filtarg',filtarg,'dd',dd,'cksds',cksds,'ddname',thename,...
    'browsewind',[]));

p = [];
if ~isname,
    error_free = 0;
    while(~error_free),
        drawnow;
        uiwait(h0);
        
        if get(canbt,'userdata')==1,
            p = [];
            error_free = 1;
        else, % it was OK
            p = checkinput(h0);
            if isempty(p), set(okbt,'UserData',0); else, error_free = 1; end;
        end;
    end;
    estruct=get(h0,'userdata');
    if ~isempty(estruct.browsewind)&ishandle(estruct.browsewind),
        delete(estruct.browsewind);
    end;
    delete(h0);
end;

function pstruct = checkinput(h0);
ud = get(h0,'UserData');
so = 1; % syntax ok
try,dots=eval(get(ud.dots,'String')');catch,errordlg('Syntax error in dots.');so=0;end;
try,fa=eval(get(ud.filtarg,'String'));catch,errordlg('Syntax error in filter arg.');so=0;end;
try,eval(['a_' get(ud.scratchfile,'String') '_1 = 5;']);
catch,errordlg('Syntax error in scratchfile.');so=0;end;
try,eval(['a_' get(ud.event_type,'String') '_1 = 5;']);
catch,errordlg('Syntax error in event type.');so=0;end;
if so,
    pstruct=struct('filtermethod',get(ud.filtmethod,'value')-1,...
        'filterarg',fa,'dots',dots,...
        'scratchfile',get(ud.scratchfile,'String'),...
        'event_type_string',get(ud.event_type,'String'),...
        'output_object',get(ud.output_type,'value')-1);
    [good,err]=verifydotdiscriminator(pstruct);
    if ~good, errordlg(['Error in parameters: ' err]); pstruct = []; end;
else, pstruct = [];
end;

function h0 = makebrowsedata(parentFig,dots,dd)

dotstr = {};
for i=1:size(dots,1),
    dotstr{i} = mat2str(dots(i,:));
end;

disp(['Building window.']);

co=[0 0 1;0 0.5 0;1 0 0;0 0.75 0.75;0.75 0 0.75;0.75 0.75 0;0.25 0.25 0.25];
h0 = figure('Color',[0.8 0.8 0.8], ...
    'PaperPosition',[18 180 576 432], ...
    'PaperUnits','points', ...
    'Position',[184   110   769   488], ...
    'Tag','BrowseData');
settoolbar(h0,'none');
cb = ['edit_graphical(dotdiscriminator(''default''),[],''BDok'',' ...
    'getfield(get(gcbf,''userdata''),''parentFig''));'];
okbt = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'FontSize',12, ...
    'ListboxTop',0, ...
    'Position',[420 23.2 68.8 22.4], ...
    'String','OK', ...
    'Tag','Pushbutton1','Callback',cb);
cb = ['edit_graphical(dotdiscriminator(''default''),[],''BDcan'',' ...
    'getfield(get(gcbf,''userdata''),''parentFig''));'];
canbt = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'FontSize',12, ...
    'ListboxTop',0, ...
    'Position',[497.6 24.8 68.8 22.4], ...
    'String','Cancel', ...
    'Tag','Pushbutton1','Callback',cb);
cb = ['edit_graphical(dotdiscriminator(''default''),[],''BDAddDotUpBt'',' ...
    'getfield(get(gcbf,''userdata''),''parentFig''));'];
AddDotUpBt= uicontrol('Parent',h0, ...
    'Units','points', ...
    'ListboxTop',0, ...
    'Position',[495.6 342 30 20], ...
    'String','Add+', ...
    'Style','pushbutton', ...
    'Tag','', ...
    'BackgroundColor',[0.8 0.8 0.8],...
    'Callback',cb,'userdata','AddDotUpBt');
cb = ['edit_graphical(dotdiscriminator(''default''),[],''BDAddDotDownBt'',' ...
    'getfield(get(gcbf,''userdata''),''parentFig''));'];
AddDotDownBt= uicontrol('Parent',h0, ...
    'Units','points', ...
    'ListboxTop',0, ...
    'Position',[495.6 322 30 20], ...
    'String','Add-', ...
    'Style','pushbutton', ...
    'Tag','', ...
    'BackgroundColor',[0.8 0.8 0.8],...
    'Callback',cb,'userdata','AddDotDownBt');
cb = ['edit_graphical(dotdiscriminator(''default''),[],''BDEditDotBt'',' ...
    'getfield(get(gcbf,''userdata''),''parentFig''));'];
EditDotBt= uicontrol('Parent',h0, ...
    'Units','points', ...
    'ListboxTop',0, ...
    'Position',[495.6+30 342 25 20], ...
    'String','Edit', ...
    'Style','pushbutton', ...
    'Tag','', ...
    'BackgroundColor',[0.8 0.8 0.8],...
    'Callback',cb,'userdata','EditDotBt');
cb = ['edit_graphical(dotdiscriminator(''default''),[],''BDFlipDotBt'',' ...
    'getfield(get(gcbf,''userdata''),''parentFig''));'];
FlipDotBt= uicontrol('Parent',h0, ...
    'Units','points', ...
    'ListboxTop',0, ...
    'Position',[495.6+30 322 25 20], ...
    'String','Flip', ...
    'Style','pushbutton', ...
    'Tag','', ...
    'BackgroundColor',[0.8 0.8 0.8],...
    'Callback',cb,'userdata','FlipDotBt');
cb = ['edit_graphical(dotdiscriminator(''default''),[],''BDDelDotBt'',' ...
    'getfield(get(gcbf,''userdata''),''parentFig''));'];
DelDotBt= uicontrol('Parent',h0, ...
    'Units','points', ...
    'ListboxTop',0, ...
    'Position',[495.6+60 332 35 20], ...
    'String','Delete', ...
    'Style','pushbutton', ...
    'Tag','', ...
    'BackgroundColor',[0.8 0.8 0.8],...
    'Callback',cb,'userdata','DelDotBt');
cb = ['edit_graphical(dotdiscriminator(''default''),[],''BDupdate'',' ...
    'getfield(get(gcbf,''userdata''),''parentFig''));'];
dataax = axes('Parent',h0, ...
    'Units','pixels', ...
    'CameraUpVector',[0 1 0], ...
    'Color',[1 1 1], ...
    'ColorOrder',co, ...
    'Position',[35 247 459 166], ...
    'Tag','Axes1', ...
    'XColor',[0 0 0], ...
    'YColor',[0 0 0], ...
    'ZColor',[0 0 0]);
histax = axes('Parent',h0, ...
    'Units','pixels', ...
    'CameraUpVector',[0 1 0], ...
    'Color',[1 1 1], ...
    'ColorOrder',co, ...
    'Position',[37 40 164 153], ...
    'Tag','Axes2', ...
    'XColor',[0 0 0], ...
    'YColor',[0 0 0], ...
    'ZColor',[0 0 0]);
waveax = axes('Parent',h0, ...
    'Units','pixels', ...
    'CameraUpVector',[0 1 0], ...
    'Color',[1 1 1], ...
    'ColorOrder',co, ...
    'Position',[256 40 164 153], ...
    'Tag','Axes2', ...
    'XColor',[0 0 0], ...
    'YColor',[0 0 0], ...
    'ZColor',[0 0 0]);
dotslist = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'Position',[495.6 216.8 100 100], ...
    'String',dotstr, 'Style','listbox',...
    'Tag','Pushbutton2');
cb = ['edit_graphical(dotdiscriminator(''default''),[],''BDdata'',' ...
    'getfield(get(gcbf,''userdata''),''parentFig''));'];
selectdatabt = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'ListboxTop',0, ...
    'Position',[430 61.6 100 23.2], ...
    'String','Select Data', ...
    'Tag','Pushbutton3','Callback',cb);
h1 = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'ListboxTop',0, ...
    'Position',[72 197.6 82.4 14.4], ...
    'String','Histogram', ...
    'Style','text', ...
    'Tag','StaticText3');
h1 = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'ListboxTop',0, ...
    'Position',[265.6 196.8 82.4 14.4], ...
    'String','Waveforms:', ...
    'Style','text', ...
    'Tag','StaticText3');
cb = ['edit_graphical(dotdiscriminator(''default''),[],''BDshowpeaks'',' ...
    'getfield(get(gcbf,''userdata''),''parentFig''));'];
showpeakschk = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'ListboxTop',0, ...
    'HorizontalAlignment','left', ...
    'Position',[495.6 166.4 100 21.6], ...
    'String','Show Peaks', ...
    'Style','checkbox', ...
    'Tag','Checkbox1','Callback',cb,'Value',1);
cb = ['edit_graphical(dotdiscriminator(''default''),[],''BDshowpoints'',' ...
    'getfield(get(gcbf,''userdata''),''parentFig''));'];
showpointschk = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'ListboxTop',0, ...
    'Position',[495.6 141.6 100 21.6], ...
    'HorizontalAlignment','left', ...
    'String','Show Points', ...
    'Style','checkbox', ...
    'Tag','Checkbox1','Callback',cb);
cb = ['edit_graphical(dotdiscriminator(''default''),[],''BDshowthresh'',' ...
    'getfield(get(gcbf,''userdata''),''parentFig''));'];
showthreshchk = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'ListboxTop',0, ...
    'Position',[495.6 116.8 100 21.6], ...
    'HorizontalAlignment','left', ...
    'String','Show Threshes', ...
    'Style','checkbox', ...
    'Tag','Checkbox1','Value',1,'Callback',cb);
h1 = uicontrol('Parent',h0, ...
    'Units','points', ...
    'BackgroundColor',[0.8 0.8 0.8], ...
    'FontSize',12, ...
    'FontWeight','bold', ...
    'ListboxTop',0, ...
    'Position',[16.8 400.4 220 20], ...
    'String','dotdiscriminator data browser', ...
    'Style','text', ...
    'Tag','StaticText4');
ud2 = get(parentFig,'userdata');
set(h0,'userdata',struct('okbt',okbt,'canbt',canbt,'dotslist',...
    dotslist,'AddDotUpBt',AddDotUpBt,'AddDotDownBt',AddDotDownBt,'EditDotBt',EditDotBt,'DelDotBt',DelDotBt,'dataax',dataax,...
    'FlipDotBt',FlipDotBt,'histax',histax,'waveax',waveax,'selectdatabt',selectdatabt,'showpeakschk',...
    showpeakschk,'showpointschk',showpointschk,'showthreshchk',showthreshchk,'parentFig',parentFig,...
    'data',[],'dd',dd,'cksds',ud2.cksds));
