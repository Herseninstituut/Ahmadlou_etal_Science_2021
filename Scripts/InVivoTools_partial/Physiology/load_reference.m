function [ block_number, data_dir] = load_reference
%load_reference gives acquisition trigger parameter and save directory to parameter function.
%
%   This function loads the number of acquisition blocks triggerd by an
%   extrnal TTL pulse. The function retreives this data as well as the
%   reference to the save directory of the session data, from the
%   Stimulus-PC.
%
%   The data collected in the function is given by [block_number,
%   data_dir] the data is already converted into machine specific
%   convention.
%
%   Timing is obtained by reading a timer file, or by extracting the total
%   number of blocks/timeslots of each measuring session. The latter is
%   multiplied by 10 sec and an additional 10 seconds are added to the total
%   acquisition time per session.
%
%   Timing between sessions is less critical in terms of speed. This will not
%   exceed the time it takes to load the parameters and Analog Input Object
%   and should be at least more than a minute.
%
%
%   2016, Simon Lansbergen.
%   2017, Alexander Heimel

% get global variables
remotecommglobals;
acqready = fullfile(Remote_Comm_dir,'acqReady');

% import data
delimiterIn = '	';
path_data = importdata(acqready,delimiterIn);

% convert cell to string
temp = cell2mat(path_data(2));

% convert string for proper path convention on multiple platforms
% directory used for both reading the trigger parameter as storing the
% session data.

if strcmpi(host,'lansbergen')
    logmsg('Temporarily removing mnt');
    temp = strrep(temp,'mnt','');
end

data_dir_file = fullfile(temp,'acqParams_in');
data_dir = fullfile(temp);

% retrieve total amount of blocks to time each acquisition session. the
% loop is needed because there is a short delay between the systems

logmsg(['wait for ' data_dir_file ' to be ready']);
c = 0;
dotted = false;
while exist(data_dir_file,'file') == 0
    pause(0.1);
    if mod(c,40)==0
        fprintf('\n');
        logmsg(['wait for ' data_dir_file ' to be ready']);
        c = 0;
    end
    if mod(c,10)==0
        dotted = true;
        fprintf('.');
    end
    c = c + 1;
end
if dotted
    fprintf('\n');
end

% import block and stimulus duration information.
% fixed settings
stimulus_data = importdata(data_dir_file);
block_number = stimulus_data.data(2);
logmsg(['Loaded reference data from ' data_dir_file]);

end