%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%函数名称：边界相角检测函数
%%入口参数：两条线段的顶点。例如 判断线段PQ 与 XY 是否相交，其中 P（x1,y1）、Q(x2,y2)、X(x3,y3)、Y(x4,y4)
                            %%则函数参数设置为：chack(x1,y1,x2,y2,x3,y3,x4,y4)
%%出口参数：　是否相交 0：不相交  1：相交
%%说明：
    %%该函数可以检测两条线断是否相交，当入口参数是向量的时候，可以同时检测多条线段是否相交。
    %%该函数入口参数可以为向量，向量可以是列向量也可以是行向量，但必须保证所有入口参数的维度相同。
    %%检测方式采用相互跨立实验实现。当两条线段相互跨立时，则两线段在二维平面中相交。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [pop]=chack(x1,y1,x2,y2,x3,y3,x4,y4)
    [px,py]=size(x1);
    p=max(px,py);      %实现行向量列向量都可以进行检测
    [px,py]=size(x3);
    q=max(px,py);
    for j=1:1:q    %检测线段相交的次数
    for i=1:1:p    %检测所有种群相邻点连成的线段是否与当前障碍物边界相交
        pabx=x4(j)-x3(j);
        paby=y4(j)-y3(j);
        pacx=x2(i)-x3(j);
        pacy=y2(i)-y3(j);
        padx=x1(i)-x3(j);
        pady=y1(i)-y3(j);
        m=pabx*pacy-paby*pacx;
        n=pabx*pady-paby*padx;
        
        pcdx=x1(i)-x2(i);
        pcdy=y1(i)-y2(i);
        pcax=x3(j)-x2(i);
        pcay=y3(j)-y2(i);
        pcbx=x4(j)-x2(i);
        pcby=y4(j)-y2(i);
        mm=pcdx*pcay-pcdy*pcax;
        nn=pcdx*pcby-pcdy*pcbx;
        if m*n<=0 && mm*nn<=0     %相交
            pop(j,i)=1;           %将结果存到矩阵[pop]中。
        else                      %显然矩阵[pop]是一个q行p列的矩阵。
            pop(j,i)=0;
        end
    end
    end
end
