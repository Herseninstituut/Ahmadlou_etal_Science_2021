function params = processparams_local(params)
%PROCESSPARAMS_LOCAL temporarily and locally override analysis parameters
%
%  Do not edit processparams_local_org.m but make a copy
%  processparams_local.m and edit this instead.
%
%  Check out specific processparams files for the default settings of
%  all parameters:
%     intrinsic signal imaging: oiprocessparams.m
%     two photon imaging: tpprocessparams.m
%     electrophysiology: ecprocessparams.m
%     behavior imaging: wcprocessparams.m
%     pupil recording: pupilprocessparams.m
%
%  Specific InVivoTools packages can also be deselected for loading in
%  load_invivotools, e.g. to deselect ERG tools for loading add
%       params.load_erg =0;
%
%
% 2014-2017, Alexander Heimel
%

%% UNCOMMENT AND CHANGE AS NECESSARY


% should not go here, but should be on top before params is filled
if (nargin<1 || isempty(params)) && exist('groot','builtin') % called from load_invivotools
    %         logmsg('DefaultFigureWindowStyle','docked');
    %set(groot,'DefaultFigureWindowStyle','normal');
    set(groot,'DefaultFigureWindowStyle','docked');
    set(groot, 'defaultAxesTickDir', 'out');
    set(groot,  'defaultAxesTickDirMode', 'manual');
    set(groot,  'defaultAxesFontSize', 20);
    
end

%params.networkpathbase = '\\vs01\CSF_Data\Shared\InVivo' ;%\Electrophys\Intan
%params.databasepath_localroot = 'C:\';
%params.networkpathbase = '\\vs01\MVP\Shared\InVivo';

%% Two photon analysis
% params.tpdatapath_networkroot= '\\Helero2p\2pdata\InVivo\Microscopy\Helero2p';
% params.tpdatapath_localroot = '\\g2p\2pdata\InVivo\Microscopy\G2p';

%% for paper SC Dopamine
% params.networkpathbase = '\\vs01\CSF_Data\Shared\InVivo';

%% for paper Azadeh
%params.networkpathbase = '\\vs01\CSF_Data\Shared\InVivo';
%params.experimentpath_localroot = '\\vs01\CSF_Data\Shared\InVivo\Extra';
%
% % params.wc_minComponentSize = 6;% pxl, Consider smaller components as noise
%if strcmp(getenv('PROCESSOR_REVISION'),'8e09') % my laptop
%    params.databasepath_localroot = 'C:\Users\heimel\Dropbox (NIN)\Desktop\Azadeh_paper';
%end
% % params.wc_minAreaSize = 200; % pxl, Minimal area for region that is tracked as mouse
% % params.wc_minMouseSize = 50^2; % pxl, Minimal area a mouse could be
% % params.wc_minStimSize = 3; % pxl, Minimal area for region that might be stimulus
% % params.wc_tailWidth = 12; % pxl
% % params.wc_tailToMiddle = 70; % pxl
% % params.wc_dilation = ones(5); % for image dilation
% % params.wc_blackThreshold = 0.2;
% % params.wc_timemultiplier = 1.00058;
% % params.wc_timeshift = -0.5;
% % params.wc_retrack = false; % always retrack the mouse and stimulus
% % params.wc_redraw_arena = true;
% % params.wc_plot_stim_nose_centered_rotated = false;

%% Intan analysis for Laura
% params.networkpathbase = '\\vs01\CSF_Data\Shared\InVivo';
% params.databasepath_localroot = 'V:\Shared\InVivo\Databases\Valentina';
% params.experimentpath_localroot =  '\\vs01\MVP\Shared\InVivo';
% params.ecdatapath_localroot = 'E:\Data\InVivo\Electrophys\Antigua';
% params.ecdatapath_localroot = 'V:\Shared\InVivo\Electrophys\Antigua';
% params.ecdatapath_localroot = 'C:\Data\InVivo\Electrophys\Nori001';
% params.rc_interval = [0.0205 0.4205];
% params.rc_timeres = 0.2; % time resolution
% params.rc_gain = 1; % image gain
% params.ec_rereference = 'remove_first_pc';
%params.ec_rereference = 'subtract_average_channel';
%params.ec_rereference = 'none';
%params.experimentpath_localroot = 'E:\Data\InVivo' ;%\Electrophys\Intan
% params.experimentpath_localroot = '\\Multivac\d\data\InVivo' ;
% params.rc_interactive = false;
% params.spike_sorting_routine = 'wpca' ; %'klustakwik';% 'wpca';
% params.plot_spike_features = false;
% params.plot_spike_shapes = false;
% params.ec_spike_smoothing = 'sgolay';
% params.sort_always_resort = true;
% params.max_spike_clusters = 1;
% params.sort_klustakwik_arguments = [ ...
%     ' -ElecNo 1' ...
%     ' -nStarts 1' ...
%     ' -MinClusters 1' ...   % 20
%     ' -MaxClusters ' num2str(params.max_spike_clusters) ...   % 30
%     ' -MaxPossibleClusters ' num2str(params.max_spike_clusters) ...  % 100
%     ' -UseDistributional 0' ...
%     ' -PriorPoint 1'...
%     ' -FullStepEvery 20'... %
%     ' -UseFeatures  1010100' ... %10101  %10111 11111
%     ' -SplitEvery 40' ...
%     ' -RandomSeed 1' ...
%     ' -MaxIter 500' ...  % 500
%     ' -DistThresh 6.9' ...   % 6.9
%     ' -ChangedThresh 0.05' ... % 0.05
%     ' -PenaltyK 0'... % 0
%     ' -PenaltyKLogN 1' ]; % 1
% params.ec_intan_spikethreshold = -7; % threshold of spike detection
%  params.post_window = [0 1]; % s

%% for Koen optopulse analysis
% params.post_window = [0 0.5]; % s
% params.pre_window = [-0.04 0]; % s
% params.sort_always_resort = true;
% params.max_spike_clusters = 1;
% params.results_show_psth_count_all = true;
% params.ec_temporary_timeshift = -0.017; % s
% params.ec_binwidth = 0.002; % binwidth in s for tuning_curve in analyse_ps
% params.separation_from_prev_stim_off = 0;
% params.minimum_spontaneous_time = 0;
% params.post_window = [0 0.05]; % ignored for tp
% params.mti_timeshift = 0.3;0.5;%0.46;
% params.psth_align_stim_onset = true;

%% for Ninad retinotopy
%params.oidatapath_localroot = 'E:\Dropbox (NIN)\Desktop\Ninad';
%params.wta_equalize_area = false;
%params.wta_max_equalizing_steps = 100;
%params.wta_equalizing_factor = 0.97;
%params.spatial_filter_width = 3; % pixels
%params.wta_show_roi = true;
%params.wta_show_ror = true;
%params.single_condition_clipping = 0;
% params.wta_normalize_each_condition = true;
% params.wta_clipping = []; % standard deviation from median
% params.wta_range = [0.88  1];%

%% for Emma experiment(1920.06); host('jander')
% params.networkpathbase = '\\vs01\MVP\Shared\InVivo';

%% for Danielle 10.24
% params.networkpathbase = '\\vs01\MVP\Shared\InVivo';
% experiment(10.24);
% host('wall-e');

%% for Dani temporal frequency
% params.networkpathbase = 'C:\Users\heimel\Dropbox (NIN)\Desktop\202006XX_Frontiers';
% params.networkpathbase = 'C:\Users\heimel\Dropbox (NIN)\Projects\Dani_Mehran_Contrast_TF\20200706_Frontiers';
% params.networkpathbase = 'C:\Users\heimel.HERSENINSTITUUT\Dropbox (NIN)\Desktop\202006XX_Frontiers';
%  params.networkpathbase = '\\vs01\MVP\Shared\InVivo' ;
%  params.plot_spike_features = false;
%  params.plot_spike_shapes = false;

%% for Dani optogenetics
% params.networkpathbase = '\\vs01\CSF_Data\Shared\InVivo' ;
% params.plot_spike_features = false;
% params.plot_spike_shapes = false;

%% for Dani cell-attached recording 13.29, 13.44
% params.networkpathbase = '\\vs01\CSF_Data\Shared\InVivo' ;
% params.tpdatapath_networkroot= '\\vs01\CSF_Data\Shared\InVivo\TwoPhoton';
% params.tpdatapath_localroot= '\\vs01\CSF_Data\Shared\InVivo\TwoPhoton';
% params.tpdatapath_localroot = '\\g2p\2pdata\InVivo\Microscopy\G2p';

%% for Leonie
% params.networkpathbase = '\\vs01\MVP\Shared\InVivo' ;
% params.databasepath_localroot = '\\vs01\MVP\Shared\InVivo\Databases';
% params.plot_spike_features = false;
% params.plot_spike_shapes = false;
% params.spike_sorting_routine = 'wpca';

%% for Leonie Stxbp1 20.20.02
 params.networkpathbase = '\\vs01\MVP\Shared\InVivo' ;
 params.databasepath_localroot = '\\vs01\MVP\Shared\InVivo\Databases';
%params.databasepath_localroot = 'C:\Users\heimel\Dropbox (NIN)\Desktop\Leonie_Stxbp1';
params.max_spike_clusters = 4;
params.spike_sorting_routine = 'klustakwik';% 'wpca';
params.ec_compute_spikerate_adaptation = true;
%params.sort_always_resort = true;

%params.spike_sorting_routine = 'wpca';
params.plot_spike_features = false;
params.plot_spike_shapes = false;
% params.compute_f1f0 = true; 

%% for Ninad barrel cortex
% params.oidatapath_localroot = 'C:\Users\heimel\Dropbox (NIN)\Desktop\ISOI block files barrel cortex';
% params.databasepath_localroot = 'C:\Users\heimel\Dropbox (NIN)\Desktop\ISOI block files barrel cortex';

%% for creating json files
%params.networkpathbase = '\\vs01\CSF_Data\Shared\InVivo' ;%\Electrophys\Intan

%% for Rogier
% params.networkpathbase  = 'C:\Users\heimel.HERSENINSTITUUT\Dropbox (NIN)\InVivo';
% params.experimentpath_localroot = 'C:\Users\heimel.HERSENINSTITUUT\Dropbox (NIN)\InVivo';

%% for Mehran head cam analysis
% params.networkpathbase = '\\vs01\MVP\Shared\InVivo';
% params.experimentpath_localroot = '\\vs01\MVP\Shared\InVivo';
% params.databasepath_localroot = 'C:\Users\heimel\Dropbox (NIN)\Desktop\Pupil_for_alexander';


%% database appearance
params.db_basefontsize = 8;
params.db_buttonheight = 17;
params.db_buttonwidth = 60;
params.db_figheight = 87;

