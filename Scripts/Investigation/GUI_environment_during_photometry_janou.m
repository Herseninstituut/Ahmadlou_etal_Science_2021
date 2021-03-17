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
A1 = read(A,50);


exist = isfile([name,'_environment_during_photometry_janou','.mat']);
exist2 = isfile([name,'_behavior_for_photometry_janou','.mat']);
if exist == 1
    load([name,'_environment_during_photometry_janou','.mat'])
    T = Env{end}.frame_end;
else if exist2 == 1
        load([name,'_behavior_for_photometry_janou','.mat'],'Rect1')
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
    'SliderStep',[3/numF 50/numF],...
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

labelStr='ENV START';
callbackStr='ev=1;';
pH=uicontrol( ...
    'Style','pushbutton', ...
    'Units','normalized', ...
    'Position',[0.48 0.03 0.13  0.05], ...
    'String',labelStr, ...
    'Interruptible','on', ...
    'Callback',callbackStr);

labelStr='ENV END';
callbackStr='ev_end=1;';
pH=uicontrol( ...
    'Style','pushbutton', ...
    'Units','normalized', ...
    'Position',[0.62 0.03 0.13  0.05], ...
    'String',labelStr, ...
    'Interruptible','on', ...
    'Callback',callbackStr);

%% Radiobuttons to select change in environment
% ball_s2_in
% ball_s2_out
% ball_s10_in
% ball_s10_out
% novel_object_in
% novel_object_out
% TMT_in
% TMT_out
% normal_food_in
% normal_food_out
% peanut_food_in
% peanut_food_out
% perfume_in
% perfume_out
% nesting_in
% nesting_out
% hand_inside
% door_open
% light_flashing
% other

xx=740;
yy=150;
r = [];
resp = 0;
labelStr2='Done';
callbackStr1='resp=1;';
r0=uicontrol('Style','pushbutton', ...
    'Position',[30 120 40 40], ...
    'String',labelStr2, ...
    'Interruptible','on', ...
    'Callback',callbackStr1);
ball_s2_in = 0;
%callbackStr2 = 'ball_s2_in = 1';
r(1) = uicontrol('Style',...
    'radiobutton',...
    'String','ball_s2_in',...
    'Position',[30 xx yy 30],...
    'HandleVisibility','off','Value',0);
ball_s2_out = 0;
%callbackStr1 = 'ball_s2_out = 1';
r(2) = uicontrol('Style',...
    'radiobutton',...
    'String','ball_s2_out',...
    'Position',[30 xx-1*30 yy 30],...
    'HandleVisibility','off','Value',0);
ball_s10_in = 0;
%callbackStr1 = 'ball_s10_in = 1';
r(3) = uicontrol('Style',...
    'radiobutton',...
    'String','ball_s10_in',...
    'Position',[30 xx-2*30 yy 30],...
    'HandleVisibility','off','Value',0);
ball_s10_out = 0;
%callbackStr1 = 'ball_s10_in = 1';
r(4) = uicontrol('Style',...
    'radiobutton',...
    'String','ball_s10_out',...
    'Position',[30 xx-3*30 yy 30],...
    'HandleVisibility','off','Value',0);
novel_object_in = 0;
%callbackStr1 = 'ball_s10_in = 1';
r(5) = uicontrol('Style',...
    'radiobutton',...
    'String','novel_object_in',...
    'Position',[30 xx-4*30 yy 30],...
    'HandleVisibility','off','Value',0);
novel_object_out = 0;
%callbackStr1 = 'ball_s10_in = 1';
r(6) = uicontrol('Style',...
    'radiobutton',...
    'String','novel_object_out',...
    'Position',[30 xx-5*30 yy 30],...
    'HandleVisibility','off','Value',0);
TMT_in = 0;
%callbackStr1 = 'ball_s10_in = 1';
r(7) = uicontrol('Style',...
    'radiobutton',...
    'String','TMT_in',...
    'Position',[30 xx-6*30 yy 30],...
    'HandleVisibility','off','Value',0);
TMT_out = 0;
%callbackStr1 = 'ball_s10_in = 1';
r(8) = uicontrol('Style',...
    'radiobutton',...
    'String','TMT_out',...
    'Position',[30 xx-7*30 yy 30],...
    'HandleVisibility','off','Value',0);
normal_food_in = 0;
%callbackStr1 = 'ball_s10_in = 1';
r(9) = uicontrol('Style',...
    'radiobutton',...
    'String','normal_food_in',...
    'Position',[30 xx-8*30 yy 30],...
    'HandleVisibility','off','Value',0);
normal_food_out = 0;
%callbackStr1 = 'ball_s10_in = 1';
r(10) = uicontrol('Style',...
    'radiobutton',...
    'String','normal_food_out',...
    'Position',[30 xx-9*30 yy 30],...
    'HandleVisibility','off','Value',0);
peanut_food_in = 0;
%callbackStr1 = 'ball_s10_in = 1';
r(11) = uicontrol('Style',...
    'radiobutton',...
    'String','peanut_food_in',...
    'Position',[30 xx-10*30 yy 30],...
    'HandleVisibility','off','Value',0);
peanut_food_out = 0;
%callbackStr1 = 'ball_s10_in = 1';
r(12) = uicontrol('Style',...
    'radiobutton',...
    'String','peanut_food_out',...
    'Position',[30 xx-11*30 yy 30],...
    'HandleVisibility','off','Value',0);
perfume_in = 0;
%callbackStr1 = 'ball_s10_in = 1';
r(13) = uicontrol('Style',...
    'radiobutton',...
    'String','perfume_in',...
    'Position',[30 xx-12*30 yy 30],...
    'HandleVisibility','off','Value',0);
perfume_out = 0;
%callbackStr1 = 'ball_s10_in = 1';
r(14) = uicontrol('Style',...
    'radiobutton',...
    'String','perfume_out',...
    'Position',[30 xx-13*30 yy 30],...
    'HandleVisibility','off','Value',0);
nesting_in = 0;
%callbackStr1 = 'ball_s10_in = 1';
r(15) = uicontrol('Style',...
    'radiobutton',...
    'String','nesting_in',...
    'Position',[30 xx-14*30 yy 30],...
    'HandleVisibility','off','Value',0);
nesting_out = 0;
%callbackStr1 = 'ball_s10_in = 1';
r(16) = uicontrol('Style',...
    'radiobutton',...
    'String','nesting_out',...
    'Position',[30 xx-15*30 yy 30],...
    'HandleVisibility','off','Value',0);
hand_inside = 0;
%callbackStr1 = 'ball_s10_in = 1';
r(17) = uicontrol('Style',...
    'radiobutton',...
    'String','hand_inside',...
    'Position',[30 xx-16*30 yy 30],...
    'HandleVisibility','off','Value',0);
door_open = 0;
%callbackStr1 = 'ball_s10_in = 1';
r(18) = uicontrol('Style',...
    'radiobutton',...
    'String','door_open',...
    'Position',[30 xx-17*30 yy 30],...
    'HandleVisibility','off','Value',0);
light_flashing = 0;
%callbackStr1 = 'ball_s10_in = 1';
r(19) = uicontrol('Style',...
    'radiobutton',...
    'String','light_flashing',...
    'Position',[30 xx-18*30 yy 30],...
    'HandleVisibility','off','Value',0);
other = 0;
%callbackStr1 = 'ball_s10_in = 1';
r(20) = uicontrol('Style',...
    'radiobutton',...
    'String','other',...
    'Position',[30 xx-19*30 yy 30],...
    'HandleVisibility','off','Value',0);

%%

pause(1)

good=0;
ev=0;
ev_end=0;

if exist == 1
i = length(Env)+1;
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
    whatstep.String = 'Env start?';
    drawnow; pause(0.1)
    if ev==1
        whatstep.String = 'Object position?';
        h1 = impoint(gca,[]); p1 = getPosition(h1);
%         h2 = impoint(gca,[]); p2 = getPosition(h2);
        Env{i}.frame = t0;
        Env{i}.position_object = p1;
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
            whatstep.String = 'Env end?';
            drawnow; pause(0.1)
            if ev_end==1
                whatstep.String = 'Object position?';
                e1 = impoint(gca,[]); t1 = getPosition(e1);
%                 e2 = impoint(gca,[]); t2 = getPosition(e2);
                Env{i}.frame_end = t0;
                Env{i}.position_object_end = t1;
%                 Beh{i}.position_ball_end = t2;
                ev_end=0;ev_e=1;
            end
        end
        %         drawnow; pause(0.1)
        resp = 0;
        whatstep.String = 'Which event?';
        while resp==0
            imshow(A2,[]);
            drawnow; pause(0.1)
            Env{i}.ball_s2_in = get(r(1),'Value');
            Env{i}.ball_s2_out = get(r(2),'Value');
            Env{i}.ball_s10_in = get(r(3),'Value');
            Env{i}.ball_s10_out = get(r(4),'Value');
            Env{i}.novel_object_in = get(r(5),'Value');
            Env{i}.novel_object_out = get(r(6),'Value');
            Env{i}.TMT_in = get(r(7),'Value');
            Env{i}.TMT_out = get(r(8),'Value');
            Env{i}.normal_food_in = get(r(9),'Value');
            Env{i}.normal_food_out = get(r(10),'Value');
            Env{i}.peanut_food_in = get(r(11),'Value');
            Env{i}.peanut_food_out = get(r(12),'Value');
            Env{i}.perfume_in  = get(r(13),'Value');
            Env{i}.perfume_out = get(r(14),'Value');
            Env{i}.nesting_in = get(r(15),'Value');
            Env{i}.nesting_out = get(r(16),'Value');
            Env{i}.hand_inside = get(r(17),'Value');
            Env{i}.door_open = get(r(18),'Value');
            Env{i}.light_flashing = get(r(19),'Value');
            Env{i}.other = get(r(20),'Value');
        end
        if Env{i}.other == 1
            Env{i}.other = inputdlg('You selected "other". Describe the event.');
        end
        for k =1:20
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

save([name,'_environment_during_photometry_janou','.mat'],'Env','Rect1')