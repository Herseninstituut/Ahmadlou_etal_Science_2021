Object_Investigation_Behavior_Analysis Database

Data file Session_Object_2020.mat is an structure matlab file consisting 
all the object investigation behavior data including optogenetic and chemogenetic manipulations

The structure fileds:

1. code > mice codes for blinded analysis

2. group > experimental group consisting:

--'GAD2_ZI_Inh' > optogenetic inhibitin of ZI inhibitory neurons (by stGtACR2)
--'GAD2_ZI_Exc' > optogenetic activation of ZI inhibitory neurons (by ChR2)
--'GAD2_ZI_Cont' > optogenetic control (2-min) for ZI excitation
--'GAD2_ZI_Cont_10' > optogenetic control (10-min) for ZI inhibition
--'B6' > C57BL/6 (10-min)
--'GAD2_ZI_PAG_Exc' > optogenetic activation of ZI->PAG axons (by ChR2)
--'GAD2_ZI_MLR_Exc' > optogenetic activation of ZI->MLR axons (by ChR2)
--'GAD2_ZI_PnO_Exc' > optogenetic activation of ZI->PnO axons (by ChR2)
--'PV_ZI_Exc' > optogenetic activation of ZI PV+ neurons (by ChR2)
--'SST_ZI_Exc' > optogenetic activation of ZI SST+ neurons (by ChR2)
--'TAC1_ZI_Exc' > optogenetic activation of ZI TAC1+ neurons (by ChR2)
--'TAC1_ZI_Inh' > optogenetic inhibition of ZI TAC1+ neurons (by stGtACR2)
--'ZI_Cont2' > optogenetic control for ZI inhibition and excitation
--'BL6_PLZI_CNO' > chemogenetic silencing of PL->ZI axons (by hM4Di+CNO)
--'GAD2_ZIPAG_CNO' > chemogenetic silencing of ZI->PAG axons (by hM4Di+CNO)
--'ZIPAG_Cont_CNO' > chemogenetic control for silencing ZI->PAG axons (tdTOM+CNO)
--'PLZI_Cont_CNO' > chemogenetic control for silencing PL->ZI axons (tdTOM+CNO)
--'GAD2_ZI_CNO' > chemogenetic silencing of ZI inhibitory neurons (by hM4Di+CNO)
--'GAD2_ZI_Cont_CNO' > chemogenetic control for silencing ZI inhibitory neurons (tdTOM+CNO)


3. NovelObject > which includes some of the following tests

3.1. NovOld > Novel object and Familiar object

3.2. FoodNew > Novel food and Familiar object

3.3. FoodOld > Novel object and Familiar food

3.4. dCricNew > Novel dead cricket and Familiar object

3.5. dCricOld > Novel object and Familiar dead cricket

3.6. aCricNew > Novel alive cricket and Familiar object

3.7. aCricOld > Novel object and Familiar alive cricket

3.8. FourOld > one Novel object and four Familiar objects

3.9. MovStat > Novel static object and Familiar moving object


Each one includes the JAABA labelings:

--ApproachNEW_start > start of approaching novel
--ApproachNEW_end > end of approaching novel
--SniffNEW_start > start of sniffing novel
--SniffNEW_end > end of sniffing novel
--BiteNEW_start > start of biting novel
--BiteNEW_end > end of biting novel
--GrabNEW_start > satart of grabbing novel
--GrabNEW_end > end of grabbing novel
--CarryNEW_start > satart of carrying novel
--CarryNEW_end > end of carrying novel
--AvoidNEW_start > start of avoiding novel
--AvoidNEW_end > end of avoiding novel
--ApproachOLD_start > start of approaching familiar
--ApproachOLD_end > end of approaching familiar
--SniffOLD_start > start of sniffing familiar
--SniffOLD_end > end of sniffing familiar
--BiteOLD_start > start of biting familiar
--BiteOLD_end > end of biting familiar
--GrabOLD_start > satart of grabbing familiar
--GrabOLD_end > end of grabbing familiar
--CarryOLD_start > satart of carrying familiar
--CarryOLD_end > end of carrying familiar
--AvoidOLD_start > start of avoiding familiar
--AvoidOLD_end > end of avoiding familiar
--Opto_start > start of opto-stimulation
--Opto_end > end of opto-stimulation