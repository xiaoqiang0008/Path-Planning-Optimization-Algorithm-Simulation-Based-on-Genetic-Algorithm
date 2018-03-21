%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%函数名称：变异函数
%%入口参数：初始种群    变异概率
%%出口参数：新种群
%%说明：
    %%通过随机数的方式决定某一种族是否变异。 rand<pm
    %%变异方式，随机产生一个在基因数量范围内的整数，作为变异点，随机产生一个新的点替换原来的点。。
    %%变异完成之后的种群还必须进行从大到小的排序。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [newx,newy]=mutation(x,y,pm)
D=calfitvalue(x,y);
[px,py]=size(x);
newx=x;
newy=y;
lx=x;
ly=y;
loop=0;
c=1;
% D=calfitvalue(x,y);
% [maxd,I]=max(D);
for i=1:1:px-1
    if rand<pm %&& (D(i)<maxd || D(i+1)<maxd )
%     while loop==0
%         c=c+1;
    mpoint=round(rand*py);

    if mpoint<=1
        mpoint=2;
    end
    if mpoint==py
        mpoint=py-1;
    end
%     %变异点择优选取
%     
%     lx(i,mpoint)=2*rand+x(i,mpoint)-1;
%     ly(i,mpoint)=2*rand+y(i,mpoint)-1;
%     lD=calfitvalue(lx(i,:),ly(i,:));
%     if lD>D(i) ||c==50
%         loop=1;
%     end
%     end
    newx(i,mpoint)=round(rand*py);
    newy(i,mpoint)=round(rand*py);
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