


function [angle,point,pointx,pointy]=calangle(x,y)
[px,py]=size(x);
j=1;
pointx(1)=x(1);
pointy(1)=y(1);
if(py<3)
    error('angle:num<3');
end

for i=2:1:py-1
    ang(i-1)=acosd(dot([x(i-1)-x(i),y(i-1)-y(i)],[x(i+1)-x(i),y(i+1)-y(i)])/(norm([x(i-1)-x(i),y(i-1)-y(i)])*norm([x(i+1)-x(i),y(i+1)-y(i)])));
end
angle=ang;
for k=1:1:max(size(ang))
   if ang(k)<178
       point(j)=ang(k);
       pointx(j+1)=x(k+1);
       pointy(j+1)=y(k+1);
       j=j+1;
   end
end
pointx(j+1)=x(py);
pointy(j+1)=y(py);

end