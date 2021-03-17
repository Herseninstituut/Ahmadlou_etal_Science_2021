clear;
close all;

%% INPUTS

prompt = {'AVI folder','AVI name'};
title = 'AVI path';
dims = [1 50];
definput = {'folder','name'};
avi_path_info = inputdlg(prompt,title,dims,definput);
path_data = avi_path_info{1};
name = avi_path_info{2};
%%
cd(path_data)
filename = [name,'.avi'];
A = VideoReader(filename);
numF = A.FrameRate*A.Duration;
% tic
A1 = read(A,50);

% toc
% A.CurrentTime = 50 / A.FrameRate;
% tic
% A1 = readFrame(A);
% toc
happy = 0;
while happy == 0
imshow(A1);
ROI_rect = imrect(gca,[]);
% wait(ROI_rect);
Rect1 = floor(getPosition(ROI_rect));
A2 = A1(Rect1(2):Rect1(2)+Rect1(4),Rect1(1):Rect1(1)+Rect1(3),3);
close;
imshow(A2);pause(1);close
z = questdlg('are you happy with the ROI?', ...
	'HAPPY', ...
    'YES','NO','NO');
switch z
    case 'YES'
        happy = 1;
    case 'NO'
        happy = 0;
    case 'cancel'
        happy = 0;
end
end
h = figure('position',[200 10 800 600]);
% imshow(ff,[])

% converting the avi file to 3D matrix for matlab computations
% if exist([name,'_AA.mat'])~=0
%     load([name,'_AA.mat'])
% else
%     AA=uint8(zeros(Rect1(4)+1,Rect1(3)+1,floor(numF)));
%     f = waitbar(0,'%  Please wait; it is loading ...');
%     for i=1:numF
%         A1 = read(A,i);
%         AA(:,:,i)=A1(Rect1(2):Rect1(2)+Rect1(4),Rect1(1):Rect1(1)+Rect1(3),3);
%         waitbar(i/numF,f,'Please wait...')
%     end
%     close(f)
%     msgbox('please wait; it is saving ...')
%     save([name,'_AA.mat'],'AA','Rect1','-v7.3')
% end

% cmap2=colormap('hsv');
labelStr='tv';
btnPos1=[150 20 200 8];
tv=uicontrol( ...
    'Style','slider', ...
    'Position',btnPos1, ...
    'String',labelStr, ...
    'max',numF,...
    'min',1,...
    'SliderStep',[3/numF 15/numF],...
    'Value',1);

labelStr='FINISHED';
callbackStr='good=1;';
pH=uicontrol( ...
    'Style','pushbutton', ...
    'Units','normalized', ...
    'Position',[0.84 0.04 0.15  0.15], ...
    'String',labelStr, ...
    'Interruptible','on', ...
    'Callback',callbackStr);

labelStr='Opto Start';
callbackStr='ev=1;';
pH=uicontrol( ...
    'Style','pushbutton', ...
    'Units','normalized', ...
    'Position',[0.48 0.03 0.13  0.05], ...
    'String',labelStr, ...
    'Interruptible','on', ...
    'Callback',callbackStr);

labelStr='Opto End';
callbackStr='ev_end=1;';
pH=uicontrol( ...
    'Style','pushbutton', ...
    'Units','normalized', ...
    'Position',[0.62 0.03 0.13  0.05], ...
    'String',labelStr, ...
    'Interruptible','on', ...
    'Callback',callbackStr);

%% Radiobuttons to select behaviors

resp = 0;
labelStr2='Done';
callbackStr4='resp=1;';
r0=uicontrol('Style','pushbutton', ...
    'Position',[30 180 40 40], ...
    'String',labelStr2, ...
    'Interruptible','on', ...
    'Callback',callbackStr4);
% opto = 0;
% callbackStr1 = 'opto = 1';
% r_op = uicontrol('Style',...
%     'radiobutton',...
%     'String','Opto',...
%     'Position',[30 340 90 30],...
%     'HandleVisibility','off','Value',0);
approach = 0;
callbackStr1 = 'approach = 1';
r1 = uicontrol('Style',...
    'radiobutton',...
    'String','Approach',...
    'Position',[30 310 90 30],...
    'HandleVisibility','off','Value',0);
grab = 0;
callbackStr2 = 'grab = 1';
r2 = uicontrol('Style',...
    'radiobutton',...
    'String','Reached',...
    'Position',[30 280 90 30],...
    'HandleVisibility','off','Value',0);
bite = 0;
callbackStr3 = 'bite = 1';
r3 = uicontrol('Style',...
    'radiobutton',...
    'String','Bite',...
    'Position',[30 250 90 30],...
    'HandleVisibility','off','Value',0);
avoid = 0;
callbackStr3 = 'avoid = 1';
r4 = uicontrol('Style',...
    'radiobutton',...
    'String','Avoid',...
    'Position',[30 220 90 30],...
    'HandleVisibility','off','Value',0);
%%

pause(1)

good=0;
ev=0;
ev_end=0;
i=1;

while good==0
    t0=get(tv,'Value');
    %     c0=get(cv,'Value');
    t0=floor(t0);
    %     c0=floor(c0);
        A1 = read(A,t0);
        A2 = A1(Rect1(2):Rect1(2)+Rect1(4),Rect1(1):Rect1(1)+Rect1(3),3);
%     A2 = AA(:,:,t0);
    imshow(A2,[])
    drawnow; pause(0.1)
    if ev==1
        h1 = impoint(gca,[]); p1 = getPosition(h1);
        h2 = impoint(gca,[]); p2 = getPosition(h2);
        EVENT{i}.frame = t0;
        EVENT{i}.position_mouse = p1;
        EVENT{i}.position_ball = p2;
        ev_e=0;
        while ev_e==0;
            t0=get(tv,'Value');
            t0=floor(t0);
                        A1 = read(A,t0);
                        A2 = A1(Rect1(2):Rect1(2)+Rect1(4),Rect1(1):Rect1(1)+Rect1(3),3);
%             A2 = AA(:,:,t0);
            imshow(A2,[]);
            drawnow; pause(0.1)
            if ev_end==1
                e1 = impoint(gca,[]); t1 = getPosition(e1);
                e2 = impoint(gca,[]); t2 = getPosition(e2);
                EVENT{i}.frame_end = t0;
                EVENT{i}.position_mouse_end = t1;
                EVENT{i}.position_ball_end = t2;
                ev_end=0;ev_e=1;
            end
        end
        %         drawnow; pause(0.1)
        resp = 0;
        while resp==0
            imshow(A2,[]);
            drawnow; pause(0.1)
%             EVENT{i}.opto = get(r_op,'Value');
            EVENT{i}.approach = get(r1,'Value');
            EVENT{i}.grab = get(r2,'Value');
            EVENT{i}.bite = get(r3,'Value');
            EVENT{i}.avoid = get(r4,'Value');
        end
%         set(r_op,'Value',0);
        set(r1,'Value',0); set(r2,'Value',0); set(r3,'Value',0); set(r4,'Value',0);
        ev=0;
        i=i+1;
    end
    % p2 = getPosition(h2); c2 = getColor(h2);
    % colormap prism
    %     subplot(2,3,6)
    %     imshow(max(max(Ic(170:-1:1,:,c0)))-Ic(170:-1:1,1:144,c0),[]);
    drawnow; pause(0.1)
end;

close(h)

save([name,'_opto','.mat'],'EVENT','Rect1')