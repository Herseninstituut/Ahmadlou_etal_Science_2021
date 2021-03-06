function F = ShallowVsDeepCalculationNEW(ss)

nvideos = length(ss);
F = [];
F.ratio = zeros(1,nvideos);
F.totaltime = zeros(1,nvideos);


for w = 1:nvideos
    Td = 0;
    Ts = 0;
    CurVid = ss{w};
    Sd = 0;
    Ss = 0;
    for e = 1:length(CurVid.SniffNEW_start)
        CurSniffStart = CurVid.SniffNEW_start(e);
        CurSniffEnd   = CurVid.SniffNEW_end(e);
        if any(CurVid.BiteNEW_start >= CurSniffStart & CurVid.BiteNEW_start <= (CurSniffEnd + 0.1))
            CurDeepIdx = find(CurVid.BiteNEW_start >= CurSniffStart & CurVid.BiteNEW_start <= (CurSniffEnd + 0.1),1,'first');
            CurDeepStart = CurVid.BiteNEW_start(CurDeepIdx);
            CurDeepEnd = CurVid.BiteNEW_end(CurDeepIdx);
            wl = 0;
            z = 0;
            while z == 0
                wl = wl+1;
                if mod(wl,2) == 1
                    if any(CurVid.CarryNEW_start >= CurDeepStart & CurVid.CarryNEW_start <= (CurDeepEnd + 0.1))
                        CurDeepIdx = find(CurVid.CarryNEW_start >= CurDeepStart & CurVid.CarryNEW_start <= (CurDeepEnd + 0.1),1,'first');
                        CurDeepStart = CurVid.CarryNEW_start(CurDeepIdx);
                        CurDeepEnd = CurVid.CarryNEW_end(CurDeepIdx);
                    else
                        z = 1;
                    end
                elseif mod(wl,2) == 0
                        if any(CurVid.BiteNEW_start >= CurDeepStart & CurVid.BiteNEW_start <= (CurDeepEnd + 0.1))
                        CurDeepIdx = find(CurVid.BiteNEW_start >= CurDeepStart & CurVid.BiteNEW_start <= (CurDeepEnd + 0.1),1,'first');
                        CurDeepStart = CurVid.BiteNEW_start(CurDeepIdx);
                        CurDeepEnd = CurVid.BiteNEW_end(CurDeepIdx);
                        else
                            z = 1;
                        end
                end
            end
            Td = Td + CurDeepEnd - CurSniffStart;
            Sd = Sd +1;
        else
            Ts = Ts + CurSniffEnd - CurSniffStart;
            Ss = Ss +1;
        end
    end
    F.ratio(w) = (Td - Ts)/(Td + Ts);
    F.totaltime(w)  = Td + Ts;
    F.num(w)  = Sd + Ss;
end
