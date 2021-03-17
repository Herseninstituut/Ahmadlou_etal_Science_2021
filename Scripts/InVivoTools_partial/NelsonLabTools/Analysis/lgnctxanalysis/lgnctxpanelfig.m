function fig = lgnctxpanelfig()
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

load lgnctxpanelfig

h0 = figure('Color',[0.8 0.8 0.8], ...
	'Colormap',mat0, ...
	'PaperPosition',[18 180 576 432], ...
	'PaperUnits','points', ...
	'Position',[414 41 724 900], ...
	'Tag','lgnctxexperpanel', ...
	'ToolBar','none');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[8 520 86 22], ...
	'String','SGS coarse', ...
	'Style','text', ...
	'Tag','StaticText2');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[484 522 83 20], ...
	'Style','edit', ...
	'Tag','RC2TestEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[571 526 58 20], ...
	'String','Analyze', ...
	'Tag','AnalyzeRC2Bt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[190 503 66 16], ...
	'String','Center loc:', ...
	'Style','text', ...
	'Tag','StaticText3');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[270 501 97 20], ...
	'Style','edit', ...
	'Tag','RCCenterLocEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[380 500 48 20], ...
	'String','Set', ...
	'Tag','SetCenterBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[87 526 37 19], ...
	'String','Edit', ...
	'Tag','SG1EditBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[441 526 40 18], ...
	'String','Run', ...
	'Tag','RC2RunBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[406 460 47 18], ...
	'String','Run', ...
	'Tag','SusTransLGNRunBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[105 463 41 19], ...
	'String','Edit', ...
	'Tag','SusTransLGNEditBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[563 461 76 20], ...
	'String','Analyze', ...
	'Tag','AnalyzeSusTransLGNBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[457 459 97 20], ...
	'Style','edit', ...
	'Tag','SusTransLGNTestEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'FontWeight','bold', ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[13 462 86 16], ...
	'String','Sus/Trans LGN', ...
	'Style','text', ...
	'Tag','StaticText2');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[255 459 36 17], ...
	'String','Reps:', ...
	'Style','text', ...
	'Tag','StaticText6');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[335 459 23 17], ...
	'String','ISI:', ...
	'Style','text', ...
	'Tag','StaticText6');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[295 458 35 20], ...
	'Style','edit', ...
	'Tag','SusTransLGNRepsEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[361 458 38 20], ...
	'Style','edit', ...
	'Tag','SusTransLGNISIEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[487 541 74 14], ...
	'String','test', ...
	'Style','text', ...
	'Tag','StaticText7');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[669 461 16 17], ...
	'Style','checkbox', ...
	'Tag','SusTransLGNCB');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[28 405 134 20], ...
	'String','Grating stimuli', ...
	'Style','text', ...
	'Tag','StaticText10');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[372 408 38 20], ...
	'Style','edit', ...
	'Tag','GratingISIEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[311 407 35 20], ...
	'Style','edit', ...
	'Tag','GratingRepsEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[347 409 23 17], ...
	'String','ISI:', ...
	'Style','text', ...
	'Tag','StaticText6');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[272 408 36 17], ...
	'String','Reps:', ...
	'Style','text', ...
	'Tag','StaticText6');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[18 317 114 19], ...
	'String','Spatial frequency (opt)', ...
	'Style','text', ...
	'Tag','StaticText11');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[183 407 53 18], ...
	'String','Edit Base', ...
	'Tag','GratingEditBaseBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[143 318 166 20], ...
	'Style','edit', ...
	'Tag','SFRangeEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[563 319 76 20], ...
	'String','Analyze', ...
	'Tag','AnalyzeSFBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[386 320 62 18], ...
	'String','Run', ...
	'Tag','SFRunBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[668 319 16 17], ...
	'Style','checkbox', ...
	'Tag','SFCB');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[64 294 67 18], ...
	'String','optimal:', ...
	'Style','text', ...
	'Tag','StaticText12');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[151 293 55 20], ...
	'Style','edit', ...
	'Tag','SFPrefEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[667 219 16 17], ...
	'Style','checkbox', ...
	'Tag','ContrastCB');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[383 215 62 18], ...
	'String','Run', ...
	'Tag','ContrastRunBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[560 215 76 20], ...
	'String','Analyze', ...
	'Tag','AnalyzeContrastBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[451 213 97 20], ...
	'Style','edit', ...
	'Tag','ContrastTestEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[140 211 166 20], ...
	'Style','edit', ...
	'Tag','ContrastRangeEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[24 212 105 19], ...
	'String','Contrast', ...
	'Style','text', ...
	'Tag','StaticText11');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[18 182 105 19], ...
	'String','Phase', ...
	'Style','text', ...
	'Tag','StaticText11');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[136 181 137 20], ...
	'Style','edit', ...
	'Tag','PhaseRangeEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[447 181 97 20], ...
	'Style','edit', ...
	'Tag','Phase1TestEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[556 181 76 20], ...
	'String','Analyze', ...
	'Tag','AnalyzePhase1Bt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[379 183 62 18], ...
	'String','Run', ...
	'Tag','Phase1RunBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[665.0000000000001 184 16 17], ...
	'Style','checkbox', ...
	'Tag','Phase1CB');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[665.0000000000001 153 16 17], ...
	'Style','checkbox', ...
	'Tag','Phase3CB');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[454 152 36 18], ...
	'String','Run', ...
	'Tag','Phase3RunBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[576 150 56 20], ...
	'String','Analyze', ...
	'Tag','AnalyzePhase3Bt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[495 150 76 20], ...
	'Style','edit', ...
	'Tag','Phase3TestEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[199 150 79 20], ...
	'Style','edit', ...
	'Tag','Phase2TestEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[281 150 56 20], ...
	'String','Analyze', ...
	'Tag','AnalyzePhase2Bt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[129 152 62 18], ...
	'String','Run', ...
	'Tag','Phase2RunBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[340 153 16 17], ...
	'Style','checkbox', ...
	'Tag','Phase2CB');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[288 184 34 17], ...
	'String','@SF', ...
	'Style','text', ...
	'Tag','StaticText13');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[327 181 46 20], ...
	'Style','edit', ...
	'Tag','PhaseSF1Edit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[71 150 46 20], ...
	'Style','edit', ...
	'Tag','PhaseSF2Edit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[30 153 34 17], ...
	'String','@SF', ...
	'Style','text', ...
	'Tag','StaticText13');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[408 150 46 20], ...
	'Style','edit', ...
	'Tag','PhaseSF3Edit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[371 153 34 17], ...
	'String','@SF', ...
	'Style','text', ...
	'Tag','StaticText13');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[579 82 115 18], ...
	'String','Export to log', ...
	'Tag','ExportLogBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[223 296 16 17], ...
	'Style','checkbox', ...
	'Tag','SFPrefCB');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[149 463 62 17], ...
	'String','Center size:', ...
	'Style','text', ...
	'Tag','StaticText6');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[209 459 45 20], ...
	'Style','edit', ...
	'Tag','CenterSizeEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[134 347 55 20], ...
	'Style','edit', ...
	'Tag','OTPrefEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[65 349 67 18], ...
	'String','prefers:', ...
	'Style','text', ...
	'Tag','StaticText12');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[668 384 16 17], ...
	'Style','checkbox', ...
	'Tag','OTCB');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[385 380 62 18], ...
	'String','Run', ...
	'Tag','OTRunBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[562 382 76 20], ...
	'String','Analyze', ...
	'Tag','AnalyzeOTBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[453 378 97 20], ...
	'Style','edit', ...
	'Tag','OTTestEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[141 376 169 20], ...
	'Style','edit', ...
	'Tag','OTRangeEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[27 374 105 19], ...
	'String','Orientation tuning', ...
	'Style','text', ...
	'Tag','StaticText11');
h1 = uicontrol('Parent',h0,'style','checkbox',...
	'BackgroundColor',[0.8 0.8 0.8],...
	'Fontsize',9,...
	'Tag','CurrStepsCB',...
	'Position',[668 415 18 18],...
	'value',0,...
	'string','');
h1=uicontrol('Parent',h0,'style','edit',...
	'BackgroundColor',[1 1 1],...
	'FontSize',9,...
	'Tag','CurrStepsEdit',...
	'Position',[520 415 120 18],...
	'string','');
h1=uicontrol('Parent',h0,'style','text',...
	'BackgroundColor',0.8*[1 1 1],...
	'Fontsize',9,...
	'Position',[415 415 105 18],...
	'string','IC current steps(pA):');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[468 478 74 14], ...
	'String','test', ...
	'Style','text', ...
	'Tag','StaticText7');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[466 399 74 14], ...
	'String','test', ...
	'Style','text', ...
	'Tag','StaticText7');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[463 233 74 14], ...
	'String','test', ...
	'Style','text', ...
	'Tag','StaticText7');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[459 201 74 14], ...
	'String','test', ...
	'Style','text', ...
	'Tag','StaticText7');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[495 169 74 14], ...
	'String','test', ...
	'Style','text', ...
	'Tag','StaticText7');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[204 169 74 14], ...
	'String','test', ...
	'Style','text', ...
	'Tag','StaticText7');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[578 58 116 24], ...
	'String','Add to database', ...
	'Tag','AddDB');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[580 39 115 16], ...
	'String','Help', ...
	'Tag','HelpBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Max',3, ...
	'Min',1, ...
	'Position',[313 128 104 17], ...
	'Style','popupmenu', ...
	'Tag','LinearityPopup', ...
	'Value',1);
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[241 127 47 15], ...
	'String','Linearity', ...
	'Style','text', ...
	'Tag','StaticText20');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[666 130 16 17], ...
	'Style','checkbox', ...
	'Tag','LinearityCB');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[425 129 198 15], ...
	'String','Linearity index:  ', ...
	'Style','text', ...
	'Tag','LinearityIndexText');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[668 273 16 17], ...
	'Style','checkbox', ...
	'Tag','TFCB');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[386 269 62 18], ...
	'String','Run', ...
	'Tag','TFRunBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[563 271 76 20], ...
	'String','Analyze', ...
	'Tag','AnalyzeTFBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[454 267 97 20], ...
	'Style','edit', ...
	'Tag','TFTestEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[143 264 166 20], ...
	'Style','edit', ...
	'Tag','TFRangeEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[27 263 105 19], ...
	'String','Temporal frequency', ...
	'Style','text', ...
	'Tag','StaticText11');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[464 289 74 14], ...
	'String','test', ...
	'Style','text', ...
	'Tag','StaticText7');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[117 503 62 19], ...
	'String','Grab results', ...
	'Tag','RCGrabResultsBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[477 335 74 14], ...
	'String','test', ...
	'Style','text', ...
	'Tag','StaticText7');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[454 317 97 20], ...
	'Style','edit', ...
	'Tag','SFTestEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[225 240 16 18], ...
	'Style','checkbox', ...
	'Tag','TFPrefCB');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[151 239 63 20], ...
	'Style','edit', ...
	'Tag','TFPrefEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[65 239 67 18], ...
	'String','prefers:', ...
	'Style','text', ...
	'Tag','StaticText12');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[89 127 98 18], ...
	'String','Compute linearity', ...
	'Tag','ComputeLinearityBt');
h1 = axes('Parent',h0, ...
	'CameraUpVector',[0 1 0], ...
	'CameraUpVectorMode','manual', ...
	'Color','none', ...
	'ColorOrder',mat1, ...
	'HandleVisibility','off', ...
	'HitTest','off', ...
	'Position',mat2, ...
	'Tag','ScribeOverlayAxesActive', ...
	'Visible','off', ...
	'XColor',[0.8 0.8 0.8], ...
	'XLimMode','manual', ...
	'XTickMode','manual', ...
	'YColor',[0.8 0.8 0.8], ...
	'YLimMode','manual', ...
	'YTickMode','manual', ...
	'ZColor',[0 0 0]);
h2 = text('Parent',h1, ...
	'Color',[0.8 0.8 0.8], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[0.4993084370677732 -0.008898776418242578 9.160254037844386], ...
	'VerticalAlignment','cap', ...
	'Visible','off');
set(get(h2,'Parent'),'XLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0.8 0.8 0.8], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[-0.009681881051175657 0.4983314794215795 9.160254037844386], ...
	'Rotation',90, ...
	'VerticalAlignment','baseline', ...
	'Visible','off');
set(get(h2,'Parent'),'YLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','right', ...
	'Position',mat3, ...
	'Visible','off');
set(get(h2,'Parent'),'ZLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[0.4993084370677732 1.006674082313682 9.160254037844386], ...
	'VerticalAlignment','bottom', ...
	'Visible','off');
set(get(h2,'Parent'),'Title',h2);
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[395 525 35 19], ...
	'String','Edit', ...
	'Tag','SG2EditBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[125 526 35 18], ...
	'String','Run', ...
	'Tag','RC1RunBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[162 524 87 20], ...
	'Style','edit', ...
	'Tag','RC1TestEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[247 524 55 20], ...
	'String','Analyze', ...
	'Tag','AnalyzeRC1Bt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[309 525 16 17], ...
	'Style','checkbox', ...
	'Tag','RC1CB');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[169 544 74 14], ...
	'String','test', ...
	'Style','text', ...
	'Tag','StaticText7');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[328 526 61 15], ...
	'String','SGS fine', ...
	'Style','text', ...
	'Tag','StaticText2');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[670 530 16 17], ...
	'Style','checkbox', ...
	'Tag','RC2CB');
h1 = axes('Parent',h0, ...
	'Units','pixels', ...
	'CameraUpVector',[0 1 0], ...
	'CameraUpVectorMode','manual', ...
	'Color',[1 1 1], ...
	'ColorOrder',mat4, ...
	'Position',[479 673 201 186], ...
	'Tag','ScreenAxes', ...
	'XColor',[0 0 0], ...
	'YColor',[0 0 0], ...
	'ZColor',[0 0 0]);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[0.495 -0.1243243243243243 9.160254037844386], ...
	'Tag','Axes1Text4', ...
	'VerticalAlignment','cap');
set(get(h2,'Parent'),'XLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[-0.14 0.491891891891892 9.160254037844386], ...
	'Rotation',90, ...
	'Tag','Axes1Text3', ...
	'VerticalAlignment','baseline');
set(get(h2,'Parent'),'YLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','right', ...
	'Position',[-2.395 1.221621621621622 9.160254037844386], ...
	'Tag','Axes1Text2', ...
	'Visible','off');
set(get(h2,'Parent'),'ZLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',mat5, ...
	'Tag','Axes1Text1', ...
	'VerticalAlignment','bottom');
set(get(h2,'Parent'),'Title',h2);
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'ListboxTop',0, ...
	'Position',[542 864.0000000000001 82.00000000000001 13], ...
	'String','screen', ...
	'Style','text', ...
	'Tag','StaticText1');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[207 349 16 17], ...
	'Style','checkbox', ...
	'Tag','OTPrefCB');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[626 634 58 20], ...
	'String','Clear', ...
	'Tag','ScreenClearBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[558 634 58 20], ...
	'String','Plot CTX', ...
	'Tag','PlotCTXScreenBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[491 634 58 20], ...
	'String','Plot LGN', ...
	'Tag','PlotLGNScreenBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'Position',[273 786 143 71], ...
	'String',' ', ...
	'Style','listbox', ...
	'Tag','LGNElectrodeList', ...
	'Value',1,'callback','genercallback');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[272 863 137 17], ...
	'String','LGN electrodes to include', ...
	'Style','text', ...
	'Tag','StaticText1');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[280 761 128 20], ...
	'String','increment electrode refs', ...
	'Tag','IncLGNBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[30 859 89 20], ...
	'String','update', ...
	'Tag','UpdateBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[28 832.0000000000001 52 13], ...
	'String','CTX cell:', ...
	'Style','text', ...
	'Tag','StaticText1');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Max',3, ...
	'Min',1, ...
	'Position',[105 833 113 17], ...
	'Style','popupmenu', ...
	'Tag','CTXCellsPopup', ...
	'Value',1);
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[76 796 124 20], ...
	'String','increment electrode ref', ...
	'Tag','IncCTXBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[76 767 111 20], ...
	'String','Edit cell info', ...
	'Tag','EditCTXInfoBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[28 714 111 20], ...
	'String','Correlation', ...
	'Tag','CorrelationBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Max',3, ...
	'Min',1, ...
	'Position',[140 714 70 20], ...
	'Style','popupmenu', ...
	'Tag','CorrelationPopup', ...
	'String',{'spikes','membrane'},...
	'Value',1);
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[306 107 74 14], ...
	'String','test', ...
	'Style','text', ...
	'Tag','StaticText7');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[27 88 79 19], ...
	'String','Spontaneous', ...
	'Style','text', ...
	'Tag','StaticText11');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[172 90 57 20], ...
	'Style','edit', ...
	'Tag','SpontaneousEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[400 88 76 20], ...
	'String','Analyze', ...
	'Tag','AnalyzeSpontaneousBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[233 91 62 18], ...
	'String','Run', ...
	'Tag','SpontaneousRunBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[483 90 16 17], ...
	'Style','checkbox', ...
	'Tag','SpontaneousCB');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[114 90 62 17], ...
	'String','Seconds', ...
	'Style','text', ...
	'Tag','StaticText6');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[298 89 97 20], ...
	'Style','edit', ...
	'Tag','SpontaneousTestEdit');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[40 606 90 17], ...
	'String','Analyze CTX', ...
	'Style','checkbox', ...
	'Tag','AnalyzeCTXCB');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[130 606 90 17], ...
	'String','Analyze membrane', ...
	'Style','checkbox', ...
	'Tag','AnalyzeCTXINTCB');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[39 582 90 17], ...
	'String','Analyze LGN', ...
	'Style','checkbox', ...
	'Tag','AnalyzeLGNCB');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[39 560 90 17], ...
	'String','Restore test info', ...
	'Tag','RestoreTestInfo');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','genercallback', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[289 606 111 20], ...
	'String','Edit cell info', ...
	'Tag','EditLGNInfoBt');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'Position',[273 630 143 92.00000000000001], ...
	'String',' ', ...
	'Style','listbox', ...
	'Tag','LGNCellList', ...
	'Value',1);
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[275 723 137 17], ...
	'String','LGN cells to include', ...
	'Style','text', ...
	'Tag','StaticText1');
if nargout > 0, fig = h0; end
