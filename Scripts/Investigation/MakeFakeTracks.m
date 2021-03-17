% make fake tracks for prepareJAABAdata

% select folders
prompt = {'AVI folder','Output folder'};
title = 'AVI path';
dims = [1 50];
definput = {'input','output'};
avi_path_info = inputdlg(prompt,title,dims,definput);

% load clips & make fake tracks files
VFs = dir(fullfile(avi_path_info{1},'*.avi'));
for q = 1:length(VFs)
    astrctTrackers = [];
    strMovieFileName = [];
 
    strMovieFileName = [VFs(q).folder '/' VFs(q).name]; 
    cVF = VideoReader(strMovieFileName);
    nF = round(cVF.Duration*cVF.FrameRate);
    
    astrctTrackers.m_afX = single(ones(1,nF));
    astrctTrackers.m_afY = single(ones(1,nF));
    astrctTrackers.m_afA = single(ones(1,nF));
    astrctTrackers.m_afB = single(ones(1,nF));
    astrctTrackers.m_afTheta = single(ones(1,nF));
    
    cd(avi_path_info{2})
    save([VFs(q).name(1:end-4) '_faketracks.mat'],'astrctTrackers','strMovieFileName')
end