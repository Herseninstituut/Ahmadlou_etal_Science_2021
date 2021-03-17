% total investigation and novel/old preference

Investigation_OLD_control = App_OLD_duration_control+Carry_OLD_duration_control+Bite_OLD_duration_control+Sniff_OLD_duration_control;
Investigation_NEW_control = App_NEW_duration_control+Carry_NEW_duration_control+Bite_NEW_duration_control+Sniff_NEW_duration_control;
Investigation_OLD_Exc = App_OLD_duration_Exc+Carry_OLD_duration_Exc+Bite_OLD_duration_Exc+Sniff_OLD_duration_Exc;
Investigation_NEW_Exc = App_NEW_duration_Exc+Carry_NEW_duration_Exc+Bite_NEW_duration_Exc+Sniff_NEW_duration_Exc;

ivt_graph({Investigation_OLD_control,Investigation_NEW_control,Investigation_OLD_Exc,Investigation_NEW_Exc},[],'xticklabels',{'Old Obj','New Obj','Old Obj','New Obj'},'showpoints',1,'errorbars','sem','color',{[1 0 0],[1 0.5 0.5],[0 0 1],[0.5 0.5 1]})
ylabel('Investigation Duration (s; 2 min)','FontSize',24)
box off
set(gcf,'color','white')
hold on
annotation('textbox',[.22 .05 .26 .06],'String','GAD2 ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');
annotation('textbox',[.52 .05 .26 .06],'String','PV ChR2','FontName','Arial','FontSize',14.0,'LineStyle','none','HorizontalAlignment','center','VerticalAlignment','middle');

A = (Investigation_NEW_control-Investigation_OLD_control)./(Investigation_NEW_control+Investigation_OLD_control);
B = (Investigation_NEW_Exc-Investigation_OLD_Exc)./(Investigation_NEW_Exc+Investigation_OLD_Exc);

ivt_graph({A,B},[],'xticklabels',{'tdTOM','ChR2'},'showpoints',1,'errorbars','sem')
ylabel('Novelty Recognition','FontSize',20)
box off
set(gcf,'color','white')
box off
set(gcf,'color','white')