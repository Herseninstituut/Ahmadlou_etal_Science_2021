%4 videos inmekaar proppen

% select folders
prompt = {'top_camera','side_1_camera','side_2_camera','mounted_camera','Output folder'};
title = 'video_compiler';
dims = [1 100];
definput = {'input1','input2','input3','input4','output'};
video_compiler_info = inputdlg(prompt,title,dims,definput);
wrapcmd = ['ffmpeg.exe -i ' video_compiler_info{1} ' -i ' video_compiler_info{2} ' -i ' video_compiler_info{3} ' -i ' video_compiler_info{4} ' -filter_complex "nullsrc=size=1280x960 [base]; [0:v] setpts=PTS-STARTPTS, scale=640x480 [upperleft]; [1:v] setpts=PTS-STARTPTS, scale=640x480 [upperright]; [2:v] setpts=PTS-STARTPTS, scale=640x480 [lowerleft]; [3:v] setpts=PTS-STARTPTS, scale=640x480 [lowerright]; [base][upperleft] overlay=shortest=1 [tmp1]; [tmp1][upperright] overlay=shortest=1:x=640 [tmp2]; [tmp2][lowerleft] overlay=shortest=1:y=480 [tmp3]; [tmp3][lowerright] overlay=shortest=1:x=640:y=480" -c:v libx264 -b:v 3500000 -r 30 ' video_compiler_info{5} ];
cmd = system(wrapcmd);
