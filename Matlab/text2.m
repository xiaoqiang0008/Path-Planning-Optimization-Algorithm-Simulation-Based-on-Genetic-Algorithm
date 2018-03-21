%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%函数名称：主函数
%%入口参数：无
%%出口参数：无
%%说明：无
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear 
pc=0.7;   %交叉概率
pm=1; %变异概率
po=0;
c=1.2;
[x,y]=popinit(100,15,0,0,20,20)   %产生初始种群
D=calfitvalue(x,y);
for i=1:1:60             %设置进化代数
% [newx,newy]=selection(x,y,D);              %选择
[newx,newy]=crossover(x,y,pc);       %交叉
[newx,newy]=mutation(newx,newy,pm);        %变异
D=calfitvalue(newx,newy);                  %重新计算适应度
[newx,newy]=selection(newx,newy,D);        %选择     保证交叉变异后的种群都不经过障碍物
D=calfitvalue(newx,newy); 
% [newx,newy]=optimization(newx,newy,po);
D=calfitvalue(newx,newy);                  %重新计算适应度    选择之后的种群适应度也已经发生变化。所以必须重新计算
 errorx(i)=i; 
%     if max(D)-min(D)>0
%     D=D*15/(max(D)-min(D));
%     end
    sumd(i)=sum(D)/max(size(D));
    if max(D)-sumd(i)>0
%     D=D*sumd(i)*(c-1)/(max(D)-sumd(i))+sumd(i)*(max(D)-c*sumd(i))/(max(D)-sumd(i));
    end
    if min(D)==0
        erroraver(i)=max(D)-16;
    else
        erroraver(i)=max(D)-min(D);
    end
    errormax(i)=max(D);

[bestx,besty,bestfit]=best(newx,newy,D);   %选择最佳个体
bbestx(i,:)=bestx;                         %保存最佳个体
bbesty(i,:)=besty;
bbestfit(i)=bestfit;
x=newx;
y=newy;
end
[bbbestfit,I]=max(bbestfit)                %计算选择出来的最佳个体中 适应度最大的个体，作为最优值输出
bbbestx=bbestx(I,:);
bbbesty=bbesty(I,:);
for i=1:1:10
    [bbbestx,bbbesty]=optimization(bbbestx,bbbesty,1);
end
% 根据适应度函数中建立的环境模型，填充障碍物
fill([0,0,8,8,0],[2,4,4,2,2],[0,0,0])
hold on
fill([10,10,13,13,10],[1,4,4,1,1],[0,0,0])
hold on
fill([9,9,16,16,9],[11,13,13,11,11],[0,0,0])
hold on
fill([2,2,6,6,2],[12,15,15,12,12],[0,0,0])
hold on
fill([14,14,15,15,14],[5,9,9,5,5],[0,0,0])
hold on
fill([6,6,10,10,6],[7,9,9,7,7],[0,0,0])
hold on
fill([0,0,3,3,0],[8,9,9,8,8],[0,0,0])
hold on
fill([17,20,20,17,17],[13,13,11,11,13],[0,0,0])
hold on
% grid on
%%画出最有路径的路线
plot(bbbestx,bbbesty,'r-')
hold on
plot(bbbestx,bbbesty,'b.','MarkerSize',15)
hold on
figure('Name','适应度差值')
plot(errorx,erroraver)
hold on
figure('Name','适应度平均值')
plot(errorx,sumd)
hold on
figure('Name','适应度最大值')
plot(errorx,errormax)
hold on
