[filenames,foldername] = uigetfile('*.avi','Select 3 or 4 videos to combine.','MultiSelect','on');
cd(foldername)
switch length(filenames)
    case 3
        vid1 = VideoReader(filenames{1});
        vid2 = VideoReader(filenames{2});
        vid3 = VideoReader(filenames{3});
        
        numberofframes = min([vid1.Duration*vid1.FrameRate, vid2.Duration*vid2.FrameRate, vid3.Duration*vid3.FrameRate]);
        
        % new video
        outputVideo = VideoWriter([vid1.Name(1:end-4) '_combined.avi']);
        outputVideo.FrameRate = vid1.FrameRate;
        open(outputVideo);
        
        f4 = ones(vid1.Height,vid1.Width,3)*100; % fake frame
        
        for q = 1:numberofframes
            f1 = read(vid1,q);
            f2 = read(vid2,q);
            f3 = read(vid3,q);
            F1 = cat(2,f1,f2);
            F2 = cat(2,f3,f4);
            F  = cat(1,F1,F2);
            writeVideo(outputVideo,F);
    
                if q == floor(numberofframes/100*10) || q == floor(numberofframes/100*20)...
                    || q == floor(numberofframes/100*30) || q == floor(numberofframes/100*40)...
                    || q == floor(numberofframes/100*50) || q == floor(numberofframes/100*60)...
                    || q == floor(numberofframes/100*70) || q == floor(numberofframes/100*80)...
                    || q == floor(numberofframes/100*90)
                disp(['Combining... ' num2str(ceil(q/numberofframes*100)) '% done.'])
                end
            
        end
        disp('100% done.')

        close(outputVideo)
        
    case 4
        vid1 = VideoReader(filenames{1});
        vid2 = VideoReader(filenames{2});
        vid3 = VideoReader(filenames{3});
        vid4 = VideoReader(filenames{4});

        numberofframes = min([vid1.Duration*vid1.FrameRate, vid2.Duration*vid2.FrameRate, vid3.Duration*vid3.FrameRate, vid4.Duration*vid4.FrameRate]);

        % new video
        outputVideo = VideoWriter([vid1.Name(1:end-4) '_combined.avi']);
        outputVideo.FrameRate = vid1.FrameRate;
        open(outputVideo);
    
        for q = 1:numberofframes
            f1 = read(vid1,q);
            f2 = read(vid2,q);
            f3 = read(vid3,q);
            f4 = read(vid4,q);
            F1 = cat(2,f1,f2);
            F2 = cat(2,f3,f4);
            F  = cat(1,F1,F2);
            writeVideo(outputVideo,F);
    
                if q == floor(numberofframes/100*10) || q == floor(numberofframes/100*20)...
                    || q == floor(numberofframes/100*30) || q == floor(numberofframes/100*40)...
                    || q == floor(numberofframes/100*50) || q == floor(numberofframes/100*60)...
                    || q == floor(numberofframes/100*70) || q == floor(numberofframes/100*80)...
                    || q == floor(numberofframes/100*90)
                disp(['Combining... ' num2str(ceil(q/numberofframes*100)) '% done.'])
                end
            
        end
        disp('100% done.')

        close(outputVideo)
end