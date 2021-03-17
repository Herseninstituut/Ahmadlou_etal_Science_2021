function F = ShallowVsDeepCalculationOLDCutOffAt2Min(ss)

nvideos = length(ss);
F = [];
F.ratio = zeros(1,nvideos);
F.totaltime = zeros(1,nvideos);


for w = 1:nvideos
    Td = 0;
    Ts = 0;
    CurVid = ss{w};
    for e = 1:length(CurVid.SniffOLD_start)
        CurSniffStart = CurVid.SniffOLD_start(e);
        CurSniffEnd   = CurVid.SniffOLD_end(e);
        if CurSniffStart > 120
            break
        end
        if any(CurVid.BiteOLD_start >= CurSniffStart & CurVid.BiteOLD_start <= (CurSniffEnd + 0.1))
            CurDeepIdx = find(CurVid.BiteOLD_start >= CurSniffStart & CurVid.BiteOLD_start <= (CurSniffEnd + 0.1),1,'first');
            CurDeepStart = CurVid.BiteOLD_start(CurDeepIdx);
            CurDeepEnd = CurVid.BiteOLD_end(CurDeepIdx);
            wl = 0;
            z = 0;
            while z == 0
                wl = wl+1;
                if mod(wl,2) == 1
                    if any(CurVid.CarryOLD_start >= CurDeepStart & CurVid.CarryOLD_start <= (CurDeepEnd + 0.1))
                        CurDeepIdx = find(CurVid.CarryOLD_start >= CurDeepStart & CurVid.CarryOLD_start <= (CurDeepEnd + 0.1),1,'first');
                        CurDeepStart = CurVid.CarryOLD_start(CurDeepIdx);
                        CurDeepEnd = CurVid.CarryOLD_end(CurDeepIdx);
                    else
                        z = 1;
                    end
                elseif mod(wl,2) == 0
                        if any(CurVid.BiteOLD_start >= CurDeepStart & CurVid.BiteOLD_start <= (CurDeepEnd + 0.1))
                        CurDeepIdx = find(CurVid.BiteOLD_start >= CurDeepStart & CurVid.BiteOLD_start <= (CurDeepEnd + 0.1),1,'first');
                        CurDeepStart = CurVid.BiteOLD_start(CurDeepIdx);
                        CurDeepEnd = CurVid.BiteOLD_end(CurDeepIdx);
                        else
                            z = 1;
                        end
                end
            end
            if CurDeepEnd > 120
                CurDeepEnd = 120;
            end
            Td = Td + CurDeepEnd - CurSniffStart;
        else
            if CurSniffEnd > 120
                CurSniffEnd = 120;
            end
            Ts = Ts + CurSniffEnd - CurSniffStart;
        end
    end
    F.ratio(w) = (Td - Ts)/(Td + Ts);
    F.totaltime(w)  = Td + Ts;
end
