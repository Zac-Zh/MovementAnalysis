function [x_p,y_p,z_p]=cleanpoint(x,y,z)
   for i=1:32
       x1=x(i,:);
       y1=y(i,:);
       z1=z(i,:);
       x1(x1 == 0) = [meanx(i)];
       y1(y1 == 0)=[ meany(i)];
       z1(z1 == 0)=[ meanz(i)];
       x_p(i,:)=x1;
       y_p(i,:)=y1;
       z_p(i,:)=z1;
%        z2=length(x1);
%        z_p(i,1:z2)=z(i,6279-z2:6278);
%       plot3(x1,y1,z(i,:));
%       xlabel('x');
%       ylabel('y');
%       zlabel('z');
%       hold on;
   end
end