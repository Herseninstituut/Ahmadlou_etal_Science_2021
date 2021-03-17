% ffmpeg is needed for this script to run

 folder = uigetdir('\\vs01\MVP\Shared\InVivo\Experiments','Select folder containing video files.');
 files = dir(folder);

%% Convert to avi if necessary

if isempty(fullfile(folder,'*.avi')) % Check if .h264 videos have been converted to .avi yet
    wrapcmd = 'C:\GPAC\mp4box.exe -fps 30 -add ';
    d = dir(fullfile(folder,'*.h264'));
    for i=1:length(d) % Copied from h264_to_avi.m
        fn = d(i).name;
        disp(['Converting ' num2str(i) ' of ' num2str(length(d)) ' : ' fn]);
        cmd = [wrapcmd fullfile(folder,fn) ' ' fullfile(folder,[fn(1:end-5),'.avi'])];
        [status,result] = system(cmd);
        if status
            msgbox('Failed');
        else
            disp('Succesful');
        end
    end
end

%% Synchronize videos

N = find(endsWith({files.name},'info.mat')); % Get position of _info.mat files in dir list
if isempty(N)
    disp('There are no _info.mat files in this folder.') 
    return
end

ss = zeros(1,length(N));
for q = 1:length(N) % Get stimstart from every _info.mat file and store in vector ss
    load([files(N(q)).folder,'\',files(N(q)).name],'stimstart');
    ss(q) = stimstart;
end
ss = ss-min(ss); % Convert to relative start delays (in seconds)

for q = 1:length(ss)
    if ss(q)~=0 % Don't change video that started last (only trim videos that started earlier)
        load([files(N(q)).folder,'\',files(N(q)).name],'filename');
        aviname = [filename(1:end-4),'avi']; % Change suffix in filename to .avi (from .h264)
        if aviname(1)=='/' % Filename is usually stored with "/" instead of "\". Correct this.
            idx = find(aviname=='/');
            aviname(idx) = '\';
        end
        if string(aviname(1:2)) ~= string("\\") % Filename is usually stored with one slash at the beginning instead of two. Correct this.
            aviname = ['\',aviname];
        end
        wrapcmd = ['ffmpeg -ss ' num2str(ss(q)) ' -i ' aviname ' -c:v libx264 -c:a aac -b:v 3500000 -r 30 ' aviname(1:end-4) '_synchronized.avi'];
        cmd = system(wrapcmd);
    end
end

%% Combine videos

if ~isempty(dir(fullfile(folder,'*photopi*synchronized.avi')))
    d = dir(fullfile(folder,'*photopi*synchronized.avi'));
    topvid = fullfile(folder,d.name);
else
    d = dir(fullfile(folder,'*photopi*.avi'));
    topvid = fullfile(folder,d.name);
end

if ~isempty(dir(fullfile(folder,'*cameraside1*synchronized.avi')))
    d = dir(fullfile(folder,'*cameraside1*synchronized.avi'));
    side1vid = fullfile(folder,d.name);
else
    d = dir(fullfile(folder,'*cameraside1*.avi'));
    side1vid = fullfile(folder,d.name);
end


if ~isempty(dir(fullfile(folder,'*cameraside2*synchronized.avi')))
    d = dir(fullfile(folder,'*cameraside2*synchronized.avi'));
    side2vid = fullfile(folder,d.name);
else
    d = dir(fullfile(folder,'*cameraside2*.avi'));
    side2vid = fullfile(folder,d.name);
end


if ~isempty(dir(fullfile(folder,'*mounted*synchronized.avi'))) % Maybe needs correction later when mounted camera footage is added
    if ~isempty(dir(fullfile(folder,'*mounted*synchronized.avi')))
        d = dir(fullfile(folder,'*mounted*synchronized.avi'));
        mountvid = fullfile(folder,d.name);
    else
        d = dir(fullfile(folder,'*mounted*.avi'));
        mountvid = fullfile(folder,d.name);
    end
else
    mountvid = topvid;
end

[a,b] = regexp(topvid,'(\d+)-(\d+)-(\d+)_(\d+)_(\d+)_(\d+)');
datetime = topvid(a:b);
outputvid = fullfile(folder,['webcams_combined_',datetime,'.avi']);

wrapcmd = ['ffmpeg.exe -i ' topvid ' -i ' mountvid ' -i ' side1vid ' -i ' side2vid ' -filter_complex "nullsrc=size=1280x960 [base]; [0:v] setpts=PTS-STARTPTS, scale=640x480 [upperleft]; [1:v] setpts=PTS-STARTPTS, scale=640x480 [upperright]; [2:v] setpts=PTS-STARTPTS, scale=640x480 [lowerleft]; [3:v] setpts=PTS-STARTPTS, scale=640x480 [lowerright]; [base][upperleft] overlay=shortest=1 [tmp1]; [tmp1][upperright] overlay=shortest=1:x=640 [tmp2]; [tmp2][lowerleft] overlay=shortest=1:y=480 [tmp3]; [tmp3][lowerright] overlay=shortest=1:x=640:y=480" -c:v libx264 -b:v 3500000 -r 30 ' outputvid ];
cmd = system(wrapcmd);