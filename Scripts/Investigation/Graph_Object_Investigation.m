function [] = Graph_Object_Investigation(N,O,Thresh)
% to plot a graph for new and old object investigation
% N: m.New    ,   O: m.Old    ,   Thresh: threshold to show the graph edges
% m_new = nanmean(N,3);
% m_old = nanmean(O,3);

% i should fixate the node positions later XData and YData

m_new = N;
m_old = O;

N=repmat([1 2 3 4 5],[5,1]);
N=N(:)'; % start nodes
M=repmat([1 2 3 4 5]',[1,5]);
M=M(:)'; % end nodes

m_new = m_new(1:5,1:5);
for i=1:5
m_new(i,i)=0;
end
m_new = m_new'; % weights for new
m_new = m_new(:);

m_old = m_old(1:5,1:5);
for i=1:5
m_old(i,i)=0;
end
m_old = m_old'; % weights for old
m_old = m_old(:);

aaa=digraph(N(m_new>Thresh),M(m_new>Thresh),m_new((m_new>Thresh)));

bbb=digraph(N(m_old>Thresh),M(m_old>Thresh),m_old((m_old>Thresh)));

c = colormap;
colors_new = c(round(63*m_old(m_new>Thresh)'+1),:);
subplot(1,2,1);plot(aaa,'EdgeColor',colors_new,'LineWidth',1.5);
box off;set(gcf,'color','white');title('Novel Object','FontSize',24)
colors_old = c(round(63*m_old(m_old>Thresh)'+1),:);
subplot(1,2,2);plot(bbb,'EdgeColor',colors_old,'LineWidth',1.5);
box off;set(gcf,'color','white');title('Familiar Object','FontSize',24)
colormap parula