%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%函数名称：交叉函数
%%入口参数：初始种群    交叉概率
%%出口参数：新种群
%%说明：
    %%通过随机数的方式决定某一种族是否交叉。 rand<pc
    %%交叉方式，随机产生一个在基因数量范围内的整数，作为交叉开始点，与下一种群进行单点交叉。
    %%交叉完成之后的种群还必须进行从大到小的排序。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [newx,newy]=crossover(x,y,pc)
[px,py]=size(x);
newx=ones(size(x)); 
newy=ones(size(y)); 
D=calfitvalue(x,y);
[maxd,I]=max(D);
for i=1:1:px-1
if rand<pc% && (D(i)<maxd || D(i+1)<maxd )
cpoint=round(rand*py);
newx(i,:)=[x(i,1:cpoint),x(i+1,cpoint+1:py)];
newx(i+1,:)=[x(i+1,1:cpoint),x(i,cpoint+1:py)];
newy(i,:)=[y(i,1:cpoint),y(i+1,cpoint+1:py)];
newy(i+1,:)=[y(i+1,1:cpoint),y(i,cpoint+1:py)];
else
newx(i,:)=x(i,:);
newx(i+1,:)=x(i+1,:);
newy(i,:)=y(i,:);
newy(i+1,:)=y(i+1,:);
end
end
% if rand<0.5
%     for i=1:1:px
%     x(i,:)=sort(x(i,:));
% %     y(i,:)=sort(y(i,:));
%     end 
% else
%     for i=1:1:px
% %     x(i,:)=sort(x(i,:));
%     y(i,:)=sort(y(i,:));
%     end 
% end
% for i=1:1:px
% newx(i,:)=sort(newx(i,:));
% newy(i,:)=sort(newy(i,:));
% end 
end
