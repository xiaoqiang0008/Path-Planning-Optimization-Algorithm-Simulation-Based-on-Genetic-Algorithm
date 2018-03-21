%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%函数名称：主函数
%%入口参数：无
%%出口参数：无
%%说明：无
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear 
pc=0.6;   %交叉概率
pm=0.01; %变异概率
c=1.5;
w=0;
[x,y]=popinit(10,25,0,0,20,20)   %产生初始种群
[x,y]=optimization2(x,y);
% D=calfitvalue(x,y);
for i=1:1:30             %设置进化代数
   w=w+1
% [newx,newy]=selection(x,y,D);              %选择
[newx,newy]=crossover(x,y,pc);       %交叉
[newx,newy]=mutation(newx,newy,pm);        %变异
D=calfitvalue(newx,newy);                  %重新计算适应度
[newx,newy]=selection(newx,newy,D);        %选择     保证交叉变异后的种群都不经过障碍物
% D=calfitvalue(newx,newy);                  %重新计算适应度    选择之后的种群适应度也已经发生变化。所以必须重新计算
if rand<0.0
    [newx,newy]=optimization(newx,newy,1);
%     D=calfitvalue(newx,newy);
end
D=calfitvalue(newx,newy);
 errorx(i)=i;
    if min(D)==0
        error(i)=max(D)-16;
    else
        erroraver(i)=max(D)-min(D);
    end
    errormax(i)=max(D);
    sumd(i)=sum(D)/max(size(D));
%      D=D*sumd(i)*(c-1)/(max(D)-sumd(i))+sumd(i)*(max(D)-c*sumd(i))/(max(D)-sumd(i));
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

figure(1)
%根据适应度函数中建立的环境模型，填充障碍物
%不规则形状
fill([8,12,12,8,8],[8,8,12,12,8],[0,0,0])
hold on
fill([2,6,6],[2,2,4],[0,0,0])
hold on
fill([4,7,2],[6,15,15],[0,0,0])
hold on
fill([9,16,16],[16,10,18],[0,0,0])
hold on
fill([18,7,12],[1,6,2],[0,0,0])
hold on
fill([8,9,9,8,8],[14,14,18,18,14],[0,0,0])
hold on
% %%画出最有路径的路线
% plot(bbbestx,bbbesty,'r-')
% hold on
% plot(bbbestx,bbbesty,'b.','MarkerSize',15)
% hold on
% 

%%迷宫环境
% fill([1 1 5 5 14 14 15 15 10 10 15 15 14 14 9 9 4 4 1],[39 40 40 35 35 40 40 34 34 25 25 19 19 24 24 34 34 39 39],[0,0,0])
% hold on
% fill([9 9 10 10 9],[39 45 45 39 39],[0,0,0])
% hold on
% fill([19 19 20 20 39 39 40 40 20 20 19],[43 35 35 39 39 29 29 40 40 43 43],[0,0,0])
% hold on
% fill([19 20 20 19 19 14 14 19 19],[32 32 24 24 29 29 30 30 32],[0,0,0])
% hold on
% fill([4 4 5 5 9 9 14 14 10 10 5 5 4 ],[30 4 4 19 19 14 14 15 15 20 20 30 30 ],[0,0,0])
% hold on
% fill([17 17 19 19 20 20 22 22 17 ],[14 15 15 20 20 15 15 14 14 ],[0,0,0])
% hold on
% fill([24 24 25 25 24],[19 30 30 19 19],[0,0,0])
% hold on
% fill([25 25 29 29 30 30 25 ],[14 15 15 20 20 14 14 ],[0,0,0])
% hold on
% fill([9 9 20 20 10 10 9 ],[2 10 10 9 9 2 2 ],[0,0,0])
% hold on
% fill([24 25 25 14 14 24 24 25 ],[10 10 4 4 5 5 10 10 ],[0,0,0])
% hold on
% fill([29 29 35 35 30 30 29 ],[4 10 10 9 9 4 4 ],[0,0,0])
% hold on
% fill([24 24 35 35 34 34 30 30 29 29 24 ],[34 35 35 29 29 34 34 25 25 34 34 ],[0,0,0])
% hold on
% fill([34 34 35 35 39 39 40 40 34 ],[25 19 19 24 24 19 19 25 25 ],[0,0,0])
% hold on
% fill([34 34 40 40 39 39 34 ],[14 15 15 0 0 14 14 ],[0,0,0])
% hold on
% fill([34 35 35 34 34 ],[7 7 0 0 7 ],[0,0,0])
% hold on
% fill([29 29 30 30 29 ],[10 14 14 10 10 ],[0,0,0])
% hold on

%只有一条路径的环境
% fill([0 0 20 20 0 ],[2 4 4 2 2 ],[0,0,0])
% hold on
% fill([10 10 30 30 10 ],[6 8 8 6 6 ],[0,0,0])
% hold on
% fill([0 0 20 20 0 ],[10 12 12 10 10 ],[0,0,0])
% hold on
% fill([10 10 30 30 10 ],[15 17 17 15 15 ],[0,0,0])
% hold on
% fill([15 15 17 19 19 15 ],[30 25 23 25 30 30 ],[0,0,0])
% hold on
% fill([15 17 19 19 15 15 ],[22 20 22 17 17 22 ],[0,0,0])
% hold on


% t=plot(bbestx(I,:),bbesty(I,:),'b-');hold on
[xa,ya]=optimization2(bbestx(I,:),bbesty(I,:));
% xa=bbestx(I,:);
% ya=bbesty(I,:);
for i=1:1:max(size(xa))-1
    lujing1(i)=sqrt((xa(i+1)-xa(i)).^2+(ya(i+1)-ya(i)).^2);     %如果不经过障碍物，则求取该个体的路径长度，最为适应度计算依据
end
lulu1=sum(lujing1)
[~,point1,~,~]=calangle(xa,ya);
point1=180-point1;
jiao1=sum(point1)
for i=1:1:max(size(bbbestx))-1
    lujing2(i)=sqrt((bbbestx(i+1)-bbbestx(i)).^2+(bbbesty(i+1)-bbbesty(i)).^2);     %如果不经过障碍物，则求取该个体的路径长度，最为适应度计算依据
end
lulu2=sum(lujing2)
[~,point2,~,~]=calangle(bbbestx,bbbesty);
point2=180-point2;
jiao2=sum(point2)

f=plot(xa,ya,'b-');hold on
h=plot(bbbestx,bbbesty,'r-');hold on
plot(bbbestx,bbbesty,'b.','MarkerSize',15)
hold on
% plot(pointx,pointy,'b.','MarkerSize',15)
% hold on
legend([h,f])
%  figure('Name','适应度差值')
%  plot(errorx,erroraver)
%  hold on
%  figure('Name','适应度平均值最大值')
%  plot(errorx,sumd)
%  hold on
%  %figure('Name','适应度最大值')
%  plot(errorx,errormax)
%  hold on
 

