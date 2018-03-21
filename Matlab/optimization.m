%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%函数名称：优化算子
%%入口参数：种群数量  基因数量
%%出口参数：初始种群
%%说明：
    %%初始种群的个点的X轴坐标与Y轴坐标分开存放，分别放在矩阵 x,y中，作为函数返回值返回
    %%初始种群的产生，除去起始点与终止点两点，其他点的x轴、y轴随机产生，并从大到小进行排列
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [newx,newy]=optimization(x,y,po)
[px,py]=size(x);
% maxf=max(fitvalue);
% minf=min(fitvalue);

for k=1:1:px
       if rand<po
        [x(k,:),y(k,:)]=optimization2(x(k,:),y(k,:));
            [~,point,pointx,pointy]=calangle(x(k,:),y(k,:));
            %按照概率分配自由点
            pointerror=max(size(x(k,:)))-max(size(pointx)) ;
            if pointerror>0
                point=180-point;
                pointcount=linspace(0,0,max(size(point)));
                sumpoint=point/sum(point);
                for i=1:1:pointerror
                    sel=rand;
                    sumPs=0;
                    j=1;
                    while sumPs<sel
                        sumPs=sumPs+sumpoint(j);
                        j=j+1;
                    end
                    pointcount(j-1)=pointcount(j-1)+1;    
                end     
            end
            if sum(pointcount)+max(size(pointx))~=py
                error('num<py?');
            end
            %重分配自由点
            q=1;
            newx(k,1)=x(k,1);
            newy(k,1)=y(k,1);
            for i=1:1:max(size(point))
                if pointcount(i)>0
                    P=sqrt((pointx(i+1)-pointx(i)).^2+(pointy(i+1)-pointy(i)).^2)/(sqrt((pointx(i+1)-pointx(i)).^2+(pointy(i+1)-pointy(i)).^2)+sqrt((pointx(i+2)-pointx(i+1)).^2+(pointy(i+2)-pointy(i+1)).^2));
                    n=round(pointcount(i)*P);
                    if n>0
                        mpointx1=(pointx(i+1)+pointx(i))/2;
                        mpointy1=(pointy(i+1)+pointy(i))/2;
                       for p=1:1:n
                            newx(k,q+p)=p*(pointx(i+1)-mpointx1)/(n+1)+mpointx1;
                            newy(k,q+p)=p*(pointy(i+1)-mpointy1)/(n+1)+mpointy1;
                        end
                        q=q+n+1;
                        newx(k,q)=pointx(i+1);
                        newy(k,q)=pointy(i+1);
                    else
                        q=q+1;
                        newx(k,q)=pointx(i+1);
                        newy(k,q)=pointy(i+1);
                    end
                    m=pointcount(i)-n;
                    if m>0
                        mpointx2=(pointx(i+2)+pointx(i+1))/2;
                        mpointy2=(pointy(i+2)+pointy(i+1))/2;
                        for p=1:1:m
                            newx(k,q+p)=p*(mpointx2-pointx(i+1))/(m+1)+pointx(i+1);
                            newy(k,q+p)=p*(mpointy2-pointy(i+1))/(m+1)+pointy(i+1);
                        end
                        q=q+m;
                    end  
                else
                    q=q+1;
                    newx(k,q)=pointx(i+1);
                    newy(k,q)=pointy(i+1);
                end
            end
            newx(k,q+1)=x(k,py);
            newy(k,q+1)=y(k,py);
            %[newx(k,:),newy(k,:)]=optimization2(newx(k,:),newy(k,:));
       else
           newx=x;
           newy=y;
       end 
end
end

% function [newx,newy]=optimization(x,y,fitvalue,pn)
% [px,py]=size(x);
% maxf=max(fitvalue);
% minf=min(fitvalue);
% i=0;
% isok=1;
% ffit=0;
% j=1;
% for k=1:1:px
%      PN=(fitvalue(k)-minf)/(maxf-minf);
%      if PN>=pn
%         while j<py-1
%             while ffit==0
%                 ffit=calfitvalue([x(k,j),x(k,py-i)],[y(k,j),y(k,py-i)]);      
%                 if ffit>1 && isok==1
%                     n=py-i-j-1;
%                     for p=1:1:n
%                        x(k,j+p)=p*(x(k,py-i)-x(k,j))/(n+1)+x(k,j);
%                        y(k,j+p)=p*(y(k,py-i)-y(k,j))/(n+1)+y(k,j);
%                     end
%                 end
%                 if i==py-j+1
%                     ffit=1;
%                     isok=0;
%                 end
%                 i=i+1;
%             end
% %             if isok==0
%                isok=1;
%                j=j+1;
%                ffit=0;
% %             else
% %                 isok=1;
% % %                  j=py-i-1;
% %                 j=j+1;
% %                 ffit=0;
% %             end
%             i=0;
%         end
%         j=1;
%     end
%  end
% newx=x;
% newy=y;
% end