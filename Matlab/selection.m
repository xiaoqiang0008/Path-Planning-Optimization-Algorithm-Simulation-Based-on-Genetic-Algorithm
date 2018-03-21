%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%函数名称：选择函数
%%入口参数：初始种群    种群适应度
%%出口参数：新种群
%%说明：
    %%选择规则以轮盘赌的方式进行。
    %%保证适应度为0的种群，一定不被选中。也就是经过障碍物的路径被选中的概率必须为0。
    %%还需要保证选择之后的种群数量与之前一致。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function [newx,newy]=selection(x,y,fitvalue)

totalfit=sum(fitvalue); %求适应值之和
fitvalue1=fitvalue/totalfit; %单个个体被选择的概率
fitvalue=cumsum(fitvalue1); %如 fitvalue=[1 2 3 4]，则 cumsum(fitvalue)=[1 3 6 10] 
[px,py]=size(fitvalue);
ms=sort(rand(px,1)); %从小到大排列       生成一个 px行 1列 的随机矩阵，然后从小到大排列
fitin=1;
newin=1;
[maxd,I]=max(fitvalue1);
while newin<=px
if  (ms(newin))<fitvalue(fitin) && fitvalue1(fitin)>0  %fitvalue1(fitin)>0 保证适应度为0的个体不被选中
newx(newin,:)=x(fitin,:);
newy(newin,:)=y(fitin,:);
newin=newin+1;
else
fitin=fitin+1;
end
% if newin>1
% newx(newin,:)=newx(newin-1,:);
% newy(newin,:)=newy(newin-1,:);
% newin=newin+1;fitvalue1(fitin)==maxd ||
% end
end

end
