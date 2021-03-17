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

exist = isfile([name,'_behavior_for_photometry_janou','.mat']);
exist2 = isfile([name,'_environment_during_photometry_janou','.mat']);
if exist == 1
    load([name,'_behavior_for_photometry_janou','.mat'])
    T = Beh{end}.frame_end;
else if exist2 == 1
        load([name,'_environment_during_photometry_janou','.mat'],'Rect1')
        T = 1;
else
T = 1;
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
end
end
h = figure('position',[50 10 1200 800]);
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
    'Value',T);

whattime = annotation('textbox',[0.12 0.04 0.15 0.024],'String',datestr(seconds(T/A.FrameRate),'HH:MM:SS.FFF'));
whatstep = annotation('textbox',[0.3 0.04 0.15 0.033],'String','...');

labelStr='FINISHED';
callbackStr='good=1;';
pH=uicontrol( ...
    'Style','pushbutton', ...
    'Units','normalized', ...
    'Position',[0.84 0.04 0.15  0.15], ...
    'String',labelStr, ...
    'Interruptible','on', ...
    'Callback',callbackStr);

labelStr='BEH START';
callbackStr='ev=1;';
pH=uicontrol( ...
    'Style','pushbutton', ...
    'Units','normalized', ...
    'Position',[0.48 0.03 0.13  0.05], ...
    'String',labelStr, ...
    'Interruptible','on', ...
    'Callback',callbackStr);

labelStr='BEH END';
callbackStr='ev_end=1;';
pH=uicontrol( ...
    'Style','pushbutton', ...
    'Units','normalized', ...
    'Position',[0.62 0.03 0.13  0.05], ...
    'String',labelStr, ...
    'Interruptible','on', ...
    'Callback',callbackStr);

%% Radiobuttons to select behaviors
% jumping
% running
% posture_to_jump
% alert_orient
% grabbing
% biting
% freezing
% avoidance
% food_approach
% object_approach
% TMT_approach
% exploring
% grooming 
% nesting
% chasing
% itching
% tail_rattling
% rearing

xx=740;
yy=150;
r = [];
resp = 0;
labelStr2='Done';
callbackStr4='resp=1;';
r0=uicontrol('Style','pushbutton', ...
    'Position',[30 240 40 40], ...
    'String',labelStr2, ...
    'Interruptible','on', ...
    'Callback',callbackStr4);
jumping = 0;
callbackStr1 = 'jumping = 1';
r(1) = uicontrol('Style',...
    'radiobutton',...
    'String','jumping',...
    'Position',[30 xx yy 30],...
    'HandleVisibility','off','Value',0);
running = 0;
callbackStr1 = 'running = 1';
r(2) = uicontrol('Style',...
    'radiobutton',...
    'String','running',...
    'Position',[30 xx-30 yy 30],...
    'HandleVisibility','off','Value',0);
posture_to_jump = 0;
callbackStr2 = 'posture_to_jump = 1';
r(3) = uicontrol('Style',...
    'radiobutton',...
    'String','posture_to_jump',...
    'Position',[30 xx-2*30 yy 30],...
    'HandleVisibility','off','Value',0);
alert_orient = 0;
callbackStr3 = 'alert_orient = 1';
r(4) = uicontrol('Style',...
    'radiobutton',...
    'String','alert_orient',...
    'Position',[30 xx-3*30 yy 30],...
    'HandleVisibility','off','Value',0);
grabbing = 0;
callbackStr3 = 'grabbing = 1';
r(5) = uicontrol('Style',...
    'radiobutton',...
    'String','grabbing',...
    'Position',[30 xx-4*30 yy 30],...
    'HandleVisibility','off','Value',0);
%
biting = 0;
callbackStr1 = 'biting = 1';
r(6) = uicontrol('Style',...
    'radiobutton',...
    'String','biting',...
    'Position',[30 xx-5*30 yy 30],...
    'HandleVisibility','off','Value',0);
freezing = 0;
callbackStr1 = 'freezing = 1';
r(7) = uicontrol('Style',...
    'radiobutton',...
    'String','freezing',...
    'Position',[30 xx-6*30 yy 30],...
    'HandleVisibility','off','Value',0);
avoidance = 0;
callbackStr2 = 'avoidance = 1';
r(8) = uicontrol('Style',...
    'radiobutton',...
    'String','avoidance',...
    'Position',[30 xx-7*30 yy 30],...
    'HandleVisibility','off','Value',0);
food_approach = 0;
callbackStr3 = 'food_approach = 1';
r(9) = uicontrol('Style',...
    'radiobutton',...
    'String','food_approach',...
    'Position',[30 xx-8*30 yy 30],...
    'HandleVisibility','off','Value',0);
object_approach = 0;
callbackStr3 = 'object_approach = 1';
r(10) = uicontrol('Style',...
    'radiobutton',...
    'String','object_approach',...
    'Position',[30 xx-9*30 yy 30],...
    'HandleVisibility','off','Value',0);
%
TMT_approach = 0;
callbackStr1 = 'TMT_approach = 1';
r(11) = uicontrol('Style',...
    'radiobutton',...
    'String','TMT_approach',...
    'Position',[30 xx-10*30 yy 30],...
    'HandleVisibility','off','Value',0);
exploring = 0;
callbackStr1 = 'exploring = 1';
r(12) = uicontrol('Style',...
    'radiobutton',...
    'String','exploring',...
    'Position',[30 xx-11*30 yy 30],...
    'HandleVisibility','off','Value',0);
grooming = 0;
callbackStr2 = 'grooming = 1';
r(13) = uicontrol('Style',...
    'radiobutton',...
    'String','grooming',...
    'Position',[30 xx-12*30 yy 30],...
    'HandleVisibility','off','Value',0);
nesting = 0;
callbackStr3 = 'nesting = 1';
r(14) = uicontrol('Style',...
    'radiobutton',...
    'String','nesting',...
    'Position',[30 xx-13*30 yy 30],...
    'HandleVisibility','off','Value',0);
chasing = 0;
callbackStr3 = 'chasing = 1';
r(15) = uicontrol('Style',...
    'radiobutton',...
    'String','chasing',...
    'Position',[30 xx-14*30 yy 30],...
    'HandleVisibility','off','Value',0);
itching = 0;
callbackStr3 = 'itching = 1';
r(16) = uicontrol('Style',...
    'radiobutton',...
    'String','itching',...
    'Position',[30 xx-15*30 yy 30],...
    'HandleVisibility','off','Value',0);
tail_rattling = 0;
callbackStr3 = 'tail_rattling = 1';
r(17) = uicontrol('Style',...
    'radiobutton',...
    'String','tail_rattling',...
    'Position',[30 xx-15*30 yy 30],...
    'HandleVisibility','off','Value',0);
rearing = 0;
callbackStr3 = 'rearing = 1';
r(18) = uicontrol('Style',...
    'radiobutton',...
    'String','rearing',...
    'Position',[30 xx-15*30 yy 30],...
    'HandleVisibility','off','Value',0);

%%

pause(1)

good=0;
ev=0;
ev_end=0;

if exist == 1
i = length(Beh)+1;
else
i=1;
end

while good==0
    t0=get(tv,'Value');
    t0=floor(t0);
        A1 = read(A,t0);
        A2 = A1(Rect1(2):Rect1(2)+Rect1(4),Rect1(1):Rect1(1)+Rect1(3),3);
    imshow(A2,[]);
    whattime.String = datestr(seconds(t0/A.FrameRate),'HH:MM:SS.FFF');
    whatstep.String = 'Beh start?';
    drawnow; pause(0.1)
    if ev==1
        whatstep.String = 'Mouse position?';
        h1 = impoint(gca,[]); p1 = getPosition(h1);
%         h2 = impoint(gca,[]); p2 = getPosition(h2);
        Beh{i}.frame = t0;
        Beh{i}.position_mouse = p1;
%         Beh{i}.position_ball = p2;
        ev_e=0;
        while ev_e==0;
            t0=get(tv,'Value');
            t0=floor(t0);
                        A1 = read(A,t0);
                        A2 = A1(Rect1(2):Rect1(2)+Rect1(4),Rect1(1):Rect1(1)+Rect1(3),3);
%             A2 = AA(:,:,t0);
            imshow(A2,[]);
            whattime.String = datestr(seconds(t0/A.FrameRate),'HH:MM:SS.FFF');
            whatstep.String = 'Beh end?';
            drawnow; pause(0.1)
            if ev_end==1
                whatstep.String = 'Mouse position?';
                e1 = impoint(gca,[]); t1 = getPosition(e1);
%                 e2 = impoint(gca,[]); t2 = getPosition(e2);
                Beh{i}.frame_end = t0;
                Beh{i}.position_mouse_end = t1;
%                 Beh{i}.position_ball_end = t2;
                ev_end=0;ev_e=1;
            end
        end
        %         drawnow; pause(0.1)
        resp = 0;
        whatstep.String = 'Which behavior?';
        while resp==0
            imshow(A2,[]);
            drawnow; pause(0.1)
            Beh{i}.jumping = get(r(1),'Value');
            Beh{i}.running = get(r(2),'Value');
            Beh{i}.posture_to_jump = get(r(3),'Value');
            Beh{i}.alert_orient = get(r(4),'Value');
            Beh{i}.grabbing = get(r(5),'Value');
            Beh{i}.biting = get(r(6),'Value');
            Beh{i}.freezing = get(r(7),'Value');
            Beh{i}.avoidance = get(r(8),'Value');
            Beh{i}.food_approach = get(r(9),'Value');
            Beh{i}.object_approach = get(r(10),'Value');
            Beh{i}.TMT_approach = get(r(11),'Value');
            Beh{i}.exploring = get(r(12),'Value');
            Beh{i}.grooming  = get(r(13),'Value');
            Beh{i}.nesting = get(r(14),'Value');
            Beh{i}.chasing = get(r(15),'Value');
            Beh{i}.itching = get(r(16),'Value');
            Beh{i}.tail_rattling = get(r(17),'Value');
            Beh{i}.rearing = get(r(18),'Value');
        end
        for k =1:18
        set(r(k),'Value',0);
        end
        ev=0;
        i=i+1;
    end
    % p2 = getPosition(h2); c2 = getColor(h2);
    % colormap prism
    %     subplot(2,3,6)
    %     imshow(max(max(Ic(170:-1:1,:,c0)))-Ic(170:-1:1,1:144,c0),[]);
    drawnow; pause(0.1)
end

close(h)

save([name,'_behavior_for_photometry_janou','.mat'],'Beh','Rect1')