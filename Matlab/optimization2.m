

function [newx,newy]=optimization2(x,y)

[~,py]=size(x);
ffit=0;
j=1;
isok=1;
i=0;
while j<py-1
    while ffit==0
        ffit=calfitvalue([x(j),x(py-i)],[y(j),y(py-i)]);      
        if ffit>1 && isok==1
            n=py-i-j-1;
            for p=1:1:n
               x(j+p)=p*(x(py-i)-x(j))/(n+1)+x(j);
               y(j+p)=p*(y(py-i)-y(j))/(n+1)+y(j);
            end
        end
        i=i+1;
        if i==py-j+1
            ffit=1;
            isok=0;
    %         j=j+1;
        end
        
    end
    isok=1;
    j=j+1;
    ffit=0;
    i=0;
end
newx=x;
newy=y;
end