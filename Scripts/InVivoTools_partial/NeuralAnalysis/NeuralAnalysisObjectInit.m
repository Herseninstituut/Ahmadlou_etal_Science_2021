function NeuralAnalysisObjectInit

pwd = which('NeuralAnalysisObjectInit');

pi = find(pwd==filesep); pwd = [pwd(1:pi(end)-1) filesep];

addpath(pwd,...
    fullfile(pwd,'MeasuredData'),...
    fullfile(pwd,'Analyses_objects'),...
    fullfile(pwd,'Analyses_routines'),...
    fullfile(pwd,'Analyses_routines' , 'periodicstim_continuous'),...
    fullfile(pwd,'general'),...
    fullfile(pwd,'UtilityProcs'),...
    fullfile(pwd,'DataManagement'))

g = measureddata([1 2],'','');
g = spikedata([1 2],'','');
