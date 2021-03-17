srcfolder = '\\vs01\MVP\Shared\InVivo\Experiments\Pupil_Whisker_FreelyMoving\TOPCAMERA';
dstfolder = srcfolder;
wrapcmd = 'C:\GPAC\mp4box.exe -fps 30 -add ' ;


d = dir(fullfile(srcfolder,'*.h264'));
c = dir(fullfile(srcfolder,'*.avi'));
if length(c) == length(d)
    msgbox('avi already exists');
else
    for i=1:length(d)
        filename = d(i).name;
        disp(['Converting ' num2str(i) ' of ' num2str(length(d)) ' : ' filename]);
        cmd = [wrapcmd fullfile(srcfolder,filename) ' ' fullfile(dstfolder,[filename(1:end-5),'.avi'])];
        [status,result] = system(cmd);
        if status
            msgbox('Failed');
        else
            disp('Succesfull');
        end
    end
end