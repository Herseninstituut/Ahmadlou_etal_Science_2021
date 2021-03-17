function [m,mavg,P] = BehaviorHeatMap(ss,IncludeAvoid,CutOffAt2Min)
% ss is {1xn} or {nx1} struct containing labelextractions of n videos.
% IncludeAvoid determines whether Avoid is plotted, 1 or 0 (yes or no, respectively).
% Statistics on Avoid is done regardless of whether it is plotted or not.
% CutOffAt2Min gives the possibility to exclude behavior timestamps that
% exceed 120 s, 1 or 0 (yes or no, respectively).


Beh = {'Approach';'Sniff';'Bite';'Grab';'Carry';'Avoid'};
tn = length(Beh);
nvideos = length(ss);

m.NEW = zeros(tn,tn,nvideos);
m.OLD = zeros(tn,tn,nvideos);
mavg.NEW = zeros(tn,tn);
mavg.OLD = zeros(tn,tn);

for q = 1:nvideos
    CurVid = ss{q};
    for w = 1:tn % for every behavior
        CurBeh = Beh{w};
        NewTS = [CurVid.([CurBeh, 'NEW_start']); CurVid.([CurBeh, 'NEW_end'])];
        OldTS = [CurVid.([CurBeh, 'OLD_start']); CurVid.([CurBeh, 'OLD_end'])];
        if CutOffAt2Min == 1
            NewTS = DeleteTimeStampsOver2Min(NewTS);
            OldTS = DeleteTimeStampsOver2Min(OldTS);
        end
        if ~isempty(NewTS)
            NewCh = CalculateChance(CurVid,NewTS,Beh,'NEW');
        else
            NewCh = NaN(1,tn);
        end
        if ~isempty(OldTS)
            OldCh = CalculateChance(CurVid,OldTS,Beh,'OLD');
        else
            OldCh = NaN(1,tn);
        end
        m.NEW(w,:,q) = NewCh;
        m.OLD(w,:,q) = OldCh;
    end
end

P = zeros(tn,tn);
for q = 1:tn
for w = 1:tn
    CurPairs = [squeeze(m.NEW(q,w,:)),squeeze(m.OLD(q,w,:))];
    if any(isnan(CurPairs(:,2)))
        idx = find(isnan(CurPairs(:,2)));
        CurPairs(idx,:) = [];
    end
    if any(isnan(CurPairs(:,1)))
        idx = find(isnan(CurPairs(:,1)));
        CurPairs(idx,:) = [];
    end
    if size(CurPairs,1) >= 3
        mavg.NEW(q,w) = mean(CurPairs(:,1));
        mavg.OLD(q,w) = mean(CurPairs(:,2));
        [~,p] = ttest(CurPairs(:,1),CurPairs(:,2));
        P(q,w) = p;
    else
        P(q,w) = NaN;
    end
end
end

if any(any(P<.05))
    % Holm-Bonferroni correction
    z = sum(sum(~isnan(P),2));
    pp = zeros(z,3);
    for q = 1:z
        pp(q,1) = 0.05/(z-q+1);
        pp(q,2) = 0.01/(z-q+1);
        pp(q,3) = 0.001/(z-q+1);
    end
    [r1,c1] = find(P<.05);
    sp = zeros(length(r1),1);
    for q = 1:length(r1)
        sp(q) = P(r1(q),c1(q));
    end
    [sp,idx] = sort(sp);
    r1 = r1(idx);
    c1 = c1(idx);
    sl = zeros(length(sp),1);
    for q = 1:length(sp)
        sl(q) = sum(sp(q)<pp(q,:));
    end
else
    sl = [];
    r1 = [];
    c1 = [];
end

if IncludeAvoid == 1
    beh = Beh;
elseif IncludeAvoid == 0
    beh = Beh(1:5);
end

[f0,~] = MakeFigure(mavg.NEW-mavg.OLD,beh,P,sl,r1,c1); title('NEW-OLD');
[f1,~] = MakeFigure(mavg.NEW,beh,P,sl,r1,c1); title('NEW');
[f2,~] = MakeFigure(mavg.OLD,beh,P,sl,r1,c1); title('OLD');
[f3,cb] = MakeFigure(P.*-1,beh,P,sl,r1,c1); title('P-VALUES');
caxis([-.1 0])
cb.Ticks = [-.1 -.05 -.01 0];
cb.TickLabels = [.1 .05 .01 0];





    function TS = DeleteTimeStampsOver2Min(TS)
        
        if ~isempty(TS)
            idx1 = find(TS(1,:)>120);
            if ~isempty(idx1)
                TS(:,idx1) = [];
                if ~isempty(TS)
                    if TS(2,end)>120
                        TS(2,end) = 120;
                    end
                end
            end    
        end
    end


    function Ch = CalculateChance(CurVid,TS,Beh,NoO)
        
        nTS = size(TS,2);
        Ch = NaN(1,length(Beh));
        
        for qq = 1:length(Beh) % for every behavior
            CurBehTs = CurVid.([Beh{qq},NoO,'_start']);
            if ~isempty(CurBehTs)
                count = 0;
                for ww = 1:nTS
                    CurStart = TS(1,ww);
                    CurEnd = TS(2,ww);
                    if any(CurBehTs >= CurStart & CurBehTs <= (CurEnd+0.1)) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        count = count+1;
                    end
                end
                Ch(qq) = count/nTS;
            else
                Ch(qq) = 0;
            end
        end
    end


    function [f,cb] = MakeFigure(mavg,beh,P,sl,r1,c1)
        
        nt = length(beh);
        P = P(1:nt,1:nt);
        f = figure; hold on
        for e = 1:nt
            a = linspace(0,nt-1,nt);
            b = linspace(1,nt,nt);
            c = -1*(zeros(1,nt)+e-1);
            d = -1*(ones(1,nt)+e-1);
            x = [a;b;b;a];
            y = [c;c;d;d];
            c = mavg(e,1:nt);
            patch(x,y,c)
        end
        cb = colorbar;
        set(gcf,'color','w')
        xlabel('TO')
        xticks(linspace(1,nt,nt)-0.5)
        xticklabels(beh)
        set(gca,'XAxisLocation','top','FontSize',14)
        ylabel('FROM')
        yticks(-1*(linspace(nt,1,nt)-0.5))
        yticklabels(flip(beh))
        
        hold on
        [r2,c2] = find(isnan(P)==1);
        c2 = c2-.5;
        r2 = (r2-.5)*-1;
        scatter(c2,r2,'x','k')
        
        if ~isempty(sl) && any(sl)
            for qqq = 1:length(sl)
                switch sl(qqq)
                    case 1
                        scatter(c1(qqq)-.5,(r1(qqq)-.5)*-1,'*','r')
                    case 2
                        scatter([c1(qqq)-.5-.125, c1(qqq)-.5+.125],[(r1(qqq)-.5)*-1, (r1(qqq)-.5)*-1],'*','r')
                    case 3
                        scatter([c1(qqq)-.5-.25, c1(qqq)-.5, c1(qqq)-.5+.25],[(r1(qqq)-.5)*-1, (r1(qqq)-.5)*-1, (r1(qqq)-.5)*-1],'*','r')
                end
            end
        end
    end
end