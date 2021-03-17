% Shallow vs Deep
load('\\vs01\csf_data\Shared\InVivo\Experiments\JAABA_analysis\SessionUpdates\Session_Object_Social_26032020.mat')

% GAD2 ChR2 NovOld
ss = [S(16).NovelObject.NovOld S(17).NovelObject.NovOld S(18).NovelObject.NovOld S(19).NovelObject.NovOld S(20).NovelObject.NovOld S(21).NovelObject.NovOld S(22).NovelObject.NovOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% B6 NovOld
ss = [S(1).NovelObject.NovOld S(2).NovelObject.NovOld S(3).NovelObject.NovOld S(4).NovelObject.NovOld S(5).NovelObject.NovOld S(6).NovelObject.NovOld S(7).NovelObject.NovOld S(8).NovelObject.NovOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% GAD2 Control NovOld
ss = [S(9).NovelObject.NovOld S(10).NovelObject.NovOld S(11).NovelObject.NovOld S(12).NovelObject.NovOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% GAD2 stACR2 NovOld 2 min
ss = [S(23).NovelObject.NovOld S(24).NovelObject.NovOld S(25).NovelObject.NovOld S(26).NovelObject.NovOld];
Fnew = ShallowVsDeepCalculationNEWCutOffAt2Min(ss);
Fold = ShallowVsDeepCalculationOLDCutOffAt2Min(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% GAD2 ChR2 NovOld 2 min ZI-PAG
ss = [S(38).NovelObject.NovOld S(39).NovelObject.NovOld S(40).NovelObject.NovOld  S(89).NovelObject.NovOld S(90).NovelObject.NovOld];
Fnew = ShallowVsDeepCalculationNEWCutOffAt2Min(ss);
Fold = ShallowVsDeepCalculationOLDCutOffAt2Min(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% GAD2 ChR2 NovOld 2 min ZI-MLR
ss = [S(44).NovelObject.NovOld S(45).NovelObject.NovOld S(46).NovelObject.NovOld];
Fnew = ShallowVsDeepCalculationNEWCutOffAt2Min(ss);
Fold = ShallowVsDeepCalculationOLDCutOffAt2Min(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% GAD2 stACR2 NovOld 10 min
ss = [S(23).NovelObject.NovOld S(24).NovelObject.NovOld S(25).NovelObject.NovOld S(26).NovelObject.NovOld ...
     S(97).NovelObject.NovOld S(98).NovelObject.NovOld S(99).NovelObject.NovOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% GAD2 ChR2 FoodOld
ss = [S(16).NovelObject.FoodOld S(17).NovelObject.FoodOld S(18).NovelObject.FoodOld S(19).NovelObject.FoodOld S(20).NovelObject.FoodOld S(21).NovelObject.FoodOld S(22).NovelObject.FoodOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% GAD2 ChR2 dCricOld
ss = [S(13).NovelObject.dCricOld S(14).NovelObject.dCricOld S(15).NovelObject.dCricOld S(16).NovelObject.dCricOld S(17).NovelObject.dCricOld S(18).NovelObject.dCricOld S(19).NovelObject.dCricOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% GAD2 ChR2 aCricOld
ss = [S(16).NovelObject.aCricOld S(17).NovelObject.aCricOld S(19).NovelObject.aCricOld S(20).NovelObject.aCricOld S(21).NovelObject.aCricOld S(22).NovelObject.aCricOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% GAD2 ChR2 FourOld
ss = [S(13).NovelObject.FourOld S(14).NovelObject.FourOld S(16).NovelObject.FourOld S(17).NovelObject.FourOld S(18).NovelObject.FourOld S(19).NovelObject.FourOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% GAD2 ChR2 MovStat
ss = [S(13).NovelObject.MovStat S(14).NovelObject.MovStat S(16).NovelObject.MovStat S(17).NovelObject.MovStat S(18).NovelObject.MovStat S(19).NovelObject.MovStat];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% GAD2 Control FoodOld
ss = [S(9).NovelObject.FoodOld S(10).NovelObject.FoodOld S(11).NovelObject.FoodOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% GAD2 Control dCricOld
ss = [S(9).NovelObject.dCricOld S(10).NovelObject.dCricOld S(11).NovelObject.dCricOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% TAC1 ChR2 NovOld
ss = [S(27).NovelObject.NovOld S(28).NovelObject.NovOld S(29).NovelObject.NovOld S(91).NovelObject.NovOld S(92).NovelObject.NovOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% PV ChR2 NovOld
ss = [S(27).NovelObject.NovOld S(28).NovelObject.NovOld S(29).NovelObject.NovOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% SST ChR2 NovOld
ss = [S(30).NovelObject.NovOld S(31).NovelObject.NovOld S(32).NovelObject.NovOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% ZI PAG ChR2 NovOld
ss = [S(38).NovelObject.NovOld S(39).NovelObject.NovOld S(40).NovelObject.NovOld S(89).NovelObject.NovOld S(90).NovelObject.NovOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% GAD2 Control NovOld 10 min
ss = [S(13).NovelObject.NovOld S(14).NovelObject.NovOld S(15).NovelObject.NovOld ...
     S(102).NovelObject.NovOld S(103).NovelObject.NovOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% TAC1 stACR2 NovOld
ss = [S(30).NovelObject.NovOld S(55).NovelObject.NovOld S(56).NovelObject.NovOld S(93).NovelObject.NovOld S(94).NovelObject.NovOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;



% PL-ZI ChR2 NovOld
ss = [S(70).NovelObject.NovOld S(71).NovelObject.NovOld S(72).NovelObject.NovOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;



% GAD2 ZI-PAG hM4Di saline NovOld 
ss = [S(64).NovelObject.NovOld S(65).NovelObject.NovOld S(66).NovelObject.NovOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% GAD2 ZI-PAG control CNO NovOld 
ss = [S(73).NovelObject.NovOld S(77).NovelObject.NovOld S(79).NovelObject.NovOld S(81).NovelObject.NovOld S(83).NovelObject.NovOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% GAD2 ZI-PAG hM4Di CNO NovOld 
ss = [S(67).NovelObject.NovOld S(68).NovelObject.NovOld S(69).NovelObject.NovOld S(85).NovelObject.NovOld S(86).NovelObject.NovOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% BL6 PL-ZI hM4Di saline NovOld 
ss = [S(61).NovelObject.NovOld S(62).NovelObject.NovOld S(63).NovelObject.NovOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% BL6 PL-ZI hM4Di Control CNO NovOld 74 76 78 82 84
ss = [S(74).NovelObject.NovOld S(76).NovelObject.NovOld S(78).NovelObject.NovOld S(82).NovelObject.NovOld S(84).NovelObject.NovOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% BL6 PL-ZI hM4Di CNO NovOld 58 59 60 95 96
ss = [S(58).NovelObject.NovOld S(59).NovelObject.NovOld S(60).NovelObject.NovOld S(95).NovelObject.NovOld S(96).NovelObject.NovOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% GAD2 ZI hM4Di Control CNO NovOld 75 80 104
ss = [S(75).NovelObject.NovOld S(80).NovelObject.NovOld S(104).NovelObject.NovOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;

% GAD2 ZI hM4Di CNO NovOld 87 88 100 101
ss = [S(87).NovelObject.NovOld S(88).NovelObject.NovOld S(100).NovelObject.NovOld S(101).NovelObject.NovOld];
Fnew = ShallowVsDeepCalculationNEW(ss);
Fold = ShallowVsDeepCalculationOLD(ss);
F = [];
F.NEW = Fnew;
F.OLD = Fold;