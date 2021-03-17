function [m,mavg,P] = BehaviorHeatMap_Social_NewJAABA(ss,time)
% ss is {1xn} or {nx1} struct containing labelextractions of n videos.
% time is an integer that determines the length of time in seconds that 
% is compared in early vs late (e.g. time = 2 compares first 2 minutes
% after opto on to the last 2 minutes before opto off).

Beh = {'App1';'Investigation';'Grab';'App2'};
tn = length(Beh);
nvideos = length(ss);

m.EARLY = zeros(tn,tn,nvideos);
m.LATE = zeros(tn,tn,nvideos);
mavg.EARLY = zeros(tn,tn);
mavg.LATE = zeros(tn,tn);

for q = 1:nvideos
    CurVid = ss{q};
    T.startE = 0; % there is no opto time
    T.endE = T.startE + time*60;
    T.endL = 600; % assume the movie is 10 min
    T.startL = T.endL - time*60;
    if T.endE > T.startL, disp('There is overlap between early and late period. Reduce variable time.'); return; end
    for w = 1:tn % for every behavior
        CurBeh = Beh{w};
        CurStarts = CurVid.([CurBeh, '_start']);
        CurEnds = CurVid.([CurBeh, '_end']);
        [TSE,TSL] = GetEarlyAndLateTimestamps(CurStarts,CurEnds,T);
        if ~isempty(TSE)
            EarlyCh = CalculateChance(CurVid,TSE,Beh);
        else
            EarlyCh = NaN(1,tn);
        end
        if ~isempty(TSL)
            LateCh = CalculateChance(CurVid,TSL,Beh);
        else
            LateCh = NaN(1,tn);
        end
        m.EARLY(w,:,q) = EarlyCh;
        m.LATE(w,:,q) = LateCh;
    end
end

P = zeros(tn,tn);
for q = 1:tn
for w = 1:tn
    CurPairs = [squeeze(m.EARLY(q,w,:)),squeeze(m.LATE(q,w,:))];
    if any(isnan(CurPairs(:,2)))
        idx = find(isnan(CurPairs(:,2)));
        CurPairs(idx,:) = [];
    end
    if any(isnan(CurPairs(:,1)))
        idx = find(isnan(CurPairs(:,1)));
        CurPairs(idx,:) = [];
    end
    if size(CurPairs,1) >= 3
        mavg.EARLY(q,w) = mean(CurPairs(:,1));
        mavg.LATE(q,w) = mean(CurPairs(:,2));
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


[f1,~] = MakeFigure(mavg.EARLY,Beh,P,sl,r1,c1); title('EARLY');
[f2,~] = MakeFigure(mavg.LATE,Beh,P,sl,r1,c1); title('LATE');
[f3,cb] = MakeFigure(P.*-1,Beh,P,sl,r1,c1); title('P-VALUES');
caxis([-.1 0])
cb.Ticks = [-.1 -.05 -.01 0];
cb.TickLabels = [.1 .05 .01 0];





    function [TSE,TSL] = GetEarlyAndLateTimestamps(CurStarts,CurEnds,T)
        TSE = [];
        TSL = [];
        if ~isempty(CurStarts)
            idxEs = find(CurStarts >= T.startE & CurStarts < T.endE);
            idxEe = find(CurEnds > T.startE & CurEnds <= T.endE);
            idxLs = find(CurStarts >= T.startL & CurStarts < T.endL);
            idxLe = find(CurEnds > T.startL & CurEnds <= T.endL);
            if ~isempty(idxEs) || ~isempty(idxEe) % early
                idxEt = sort(unique([idxEs;idxEe]));
                TSE = [CurStarts(idxEt); CurEnds(idxEt)];
                if TSE(1,1) < T.startE
                    TSE(1,1) = T.startE;
                end
                if TSE(2,size(TSE,2)) > T.endE
                    TSE(2,size(TSE,2)) = T.endE;
                end
            end
            if ~isempty(idxLs) || ~isempty(idxLe) % late
                idxLt = sort(unique([idxLs;idxLe]));
                TSL = [CurStarts(idxLt); CurEnds(idxLt)];
                if TSL(1,1) < T.startL
                    TSL(1,1) = T.startL;
                end
                if TSL(2,size(TSL,2)) > T.endL
                    TSL(2,size(TSL,2)) = T.endL;
                end
            end
        end
        
    end


    function Ch = CalculateChance(CurVid,TS,Beh)
        
        nTS = size(TS,2);
        Ch = NaN(1,length(Beh));
        
        for qq = 1:length(Beh) % for every behavior
            CurBehTs = CurVid.([Beh{qq},'_start']);
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