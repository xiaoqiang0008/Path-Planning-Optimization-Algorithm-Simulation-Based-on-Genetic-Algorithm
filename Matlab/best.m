
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%函数名称：最有个体选择函数
%%入口参数：初始种群    种群适应度
%%出口参数：最佳个体  最佳个体适应度
%%说明：
    %%按照适应度大小进行选择最佳个体。适应度最大的个体将被选出，作为函数返回值返回。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [bestx,besty,bestfit]=best(x,y,fitvalue)
    [px,py]=size(x);
    bestx=x(1,:);
    besty=y(1,:);
    bestfit=fitvalue(1);
    for i=2:px
        if fitvalue(i)>bestfit
            bestx=x(i,:);
            besty=y(i,:);
            bestfit=fitvalue(i);
        end
    end
end