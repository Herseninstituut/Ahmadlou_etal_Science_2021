%4 videos inmekaar proppen

%before you can use this script, you'll have to download ffmpeg and save it
%to C:/root. After that you'll need to add it to Paths in Windows.

clc;

% select folders and file names
[top_file,top_dir] = uigetfile('*.avi','Select TOP camera video file.');
[side1_file,side1_dir] = uigetfile('*.avi','Select SIDE1 camera video file.');
[side2_file,side2_dir] = uigetfile('*.avi','Select SIDE2 camera video file.');
[mount_file,mount_dir] = uigetfile('*.avi','Select MOUNTED camera video file.');
output_dir = uigetdir('\\vs01\MVP\Shared\InVivo\Experiments','Select OUTPUT video folder.');
output_file = inputdlg('Output video name?','',[1 50]);

% store complete dirs
vidtop = [top_dir,top_file];
vidside1 = [side1_dir,side1_file];
vidside2 = [side2_dir,side2_file];
vidmount = [mount_dir,mount_file];
vidoutput = [output_dir,'\',output_file{1},'.avi'];

% prepare input prompt
vids = [];
vids{1} = vidtop;
vids{2} = vidside1;
vids{3} = vidside2;
vids{4} = vidmount;
vids{5} = vidoutput;
for w = 1:5
    idx = find(vids{w}=='\');
    for q = 1:length(idx)
        vids{w} = [vids{w}(1:idx(q)+q-1),'\',vids{w}(idx(q)+q:end)];
    end
end

% prompt double check
prompt = ['Is this correct? \nTOP video:     ' vids{1} ...
    '\nSIDE 1 video:  ' vids{2} ...
    '\nSIDE 2 video:  ' vids{3} ...
    '\nMOUNTED video: ' vids{4} ...
    '\nOUTPUT video:  ' vids{5} ...
    '\nEnter 1 for YES or 0 for NO. --> '];
correct = input(prompt);

if correct == 1
%prompt = {'top_camera','side_1_camera','side_2_camera','mounted_camera','Output folder'};
%title = 'video_compiler';
%dims = [1 100];
%definput = {'input1','input2','input3','input4','output'};
%video_compiler_info = inputdlg(prompt,title,dims,definput);
wrapcmd = ['ffmpeg.exe -i ' vidtop ' -i ' vidside1 ' -i ' vidside2 ' -i ' vidmount ' -filter_complex "nullsrc=size=1280x960 [base]; [0:v] setpts=PTS-STARTPTS, scale=640x480 [upperleft]; [1:v] setpts=PTS-STARTPTS, scale=640x480 [upperright]; [2:v] setpts=PTS-STARTPTS, scale=640x480 [lowerleft]; [3:v] setpts=PTS-STARTPTS, scale=640x480 [lowerright]; [base][upperleft] overlay=shortest=1 [tmp1]; [tmp1][upperright] overlay=shortest=1:x=640 [tmp2]; [tmp2][lowerleft] overlay=shortest=1:y=480 [tmp3]; [tmp3][lowerright] overlay=shortest=1:x=640:y=480" -c:v libx264 -b:v 3500000 -r 30 ' vidoutput ];
cmd = system(wrapcmd);
else
disp('Run the script again.')
end