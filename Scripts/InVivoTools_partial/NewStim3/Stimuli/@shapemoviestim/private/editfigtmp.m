function fig = editfig(sms)
% This is the machine-generated representation of a Handle Graphics object
% and its children.  Note that handle values may change when these objects
% are re-created. This may cause problems with any callbacks written to
% depend on the value of the handle at the time the object was saved.
% This problem is solved by saving the output as a FIG-file.
%
% To reopen this object, just type the name of the M-file at the MATLAB
% prompt. The M-file and its associated MAT-file must be on your path.
% 
% NOTE: certain newer features in MATLAB may not have been saved in this
% M-file due to limitations of this format, which has been superseded by
% FIG-files.  Figures which have been annotated using the plot editor tools
% are incompatible with the M-file/MAT-file format, and should be saved as
% FIG-files.

load editfig

h0 = figure('Color',[0.8 0.8 0.8], ...
	'Colormap',mat0, ...
	'FileName','/home/vanhoosr/tools/matlab/NewStim/Stimuli/@shapemoviestim/editfig.m', ...
	'PaperPosition',[18 180 576 432], ...
	'PaperUnits','points', ...
	'Position',[627 -807 502 548], ...
	'Tag','Fig1', ...
	'ToolBar','none');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[295 433 155 23], ...
	'String','[128 128 128]', ...
	'Style','edit', ...
	'Tag','BGEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[16 427 270 24], ...
	'String','[1x3] background color [r g b], each in 0..255', ...
	'Style','text', ...
	'Tag','StaticText2');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[295 464.0000000000001 155 23], ...
	'String','[0 0 100 100]', ...
	'Style','edit', ...
	'Tag','RectEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[16 460.0000000000001 270 24], ...
	'String','[1x4] Rect [top_x top_y bottom_x bottom_y]', ...
	'Style','text', ...
	'Tag','StaticText2');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',18, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[58 490.0000000000001 356 31], ...
	'String','New shapemoviestim object...', ...
	'Style','text', ...
	'Tag','StaticText1');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[393 399.0000000000001 64 23], ...
	'String','15', ...
	'Style','edit', ...
	'Tag','FPSEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[235 393 145 24], ...
	'String','[1x1] frames per second', ...
	'Style','text', ...
	'Tag','StaticText2');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[23 393 125 24], ...
	'String','[1x1] N, num frames', ...
	'Style','text', ...
	'Tag','StaticText2');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[158 397 38 23], ...
	'String','1800', ...
	'Style','edit', ...
	'Tag','NEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[393 368 64 23], ...
	'String','15', ...
	'Style','edit', ...
	'Tag','ISIEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[235 362 145 24], ...
	'String','[1x1] frames per second', ...
	'Style','text', ...
	'Tag','StaticText2');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[23 361 125 24], ...
	'String','[1x1] N, num frames', ...
	'Style','text', ...
	'Tag','StaticText2');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[158 366 38 23], ...
	'String','1800', ...
	'Style','edit', ...
	'Tag','ScaleEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[24 317 430 24], ...
	'String','Set any displayprefs options here: example: {''BGpretime'',1}', ...
	'Style','text', ...
	'Tag','StaticText2');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[29 289 429.0000000000001 28], ...
	'String','{}', ...
	'Style','edit', ...
	'Tag','DispPrefsEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.7 0.7 0.7], ...
	'Callback','textbox(''stochasticgridstim help'',help(''stochasticgridstim''));', ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[375 40 89 34], ...
	'String','Help', ...
	'Tag','HelpButt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.7 0.7 0.7], ...
	'Callback','set(gcbo,''userdata'',[1]);uiresume(gcf);', ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[211 39 89 34], ...
	'String','Cancel', ...
	'Tag','CanButt', ...
	'UserData',0);
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.7 0.7 0.7], ...
	'Callback','set(gcbo,''userdata'',[1]);uiresume(gcf);', ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[39 37 89 34], ...
	'String','OK', ...
	'Tag','OKButt', ...
	'UserData',0);
if nargout > 0, fig = h0; end
