Social_Investigation_Behavior_Analysis Database

Data file Session_Social_2020.mat is an structure matlab file consisting 
all the social investigation behavior data including optogenetic and chemogenetic manipulations

The structure fileds:

1. code > mice codes for blinded analysis

2. group > experimental group consisting:

--'GAD2_ZI_Inh' > optogenetic inhibitin of ZI inhibitory neurons (by stGtACR2)
--'GAD2_ZI_Exc' > optogenetic activation of ZI inhibitory neurons (by ChR2)
--'GAD2_ZI_Cont' > optogenetic control for ZI inhibition and excitation
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

3. Social > which includes the JAABA labelings:

--App1_start > start of approach
--App1_end > end of approach
--Investigation_start > start of investigation
--Investigation_end > end of investigation
--Grab_start > satart of grab
--Grab_end > end of grab
--Avoid_start > start of avoidance
--Avoid_end > end of avoidance
--Def1_start > start of defence
--Def1_end > end of defence
--App2_start > start of intruder's approach
--App2_end > end of intruder's approach
--Def2_start > start of intruder's defence
--Def2_end > end of intruder's defence