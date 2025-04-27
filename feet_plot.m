function  feet_plot(t,x_p,y_p,z_p)
      for i=1:32
       x1=x_p(i,:);
       y1=y_p(i,:);
       z1=z_p(i,:);     
       x1(x1 == 0) =  mean(x_p(i,:));
       y1(y1 == 0) =  mean(y_p(i,:));
       z1(z1 == 0) =  mean(z_p(i,:));
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
rfeet_x_picture(23,:,:) =[x_p(15,t) ,x_p(14,t)];
rfeet_y_picture(23,:,:) =[y_p(15,t) ,y_p(14,t)];
rfeet_z_picture(23,:,:) =[z_p(15,t) ,z_p(14,t)];
rfeet_x_picture(32,:,:) =[x_p(13,t) ,x_p(14,t)];
rfeet_y_picture(32,:,:) =[y_p(13,t) ,y_p(14,t)];
rfeet_z_picture(32,:,:) =[z_p(13,t) ,z_p(14,t)];
rfeet_x_picture(33,:,:) =[x_p(14,t) ,x_p(15,t)];
rfeet_y_picture(33,:,:) =[y_p(14,t) ,y_p(15,t)];
rfeet_z_picture(33,:,:) =[z_p(14,t) ,z_p(15,t)];
rfeet_x_picture(34,:,:) =[x_p(15,t) ,x_p(13,t)];
rfeet_y_picture(34,:,:) =[y_p(15,t) ,y_p(13,t)];
rfeet_z_picture(34,:,:) =[z_p(15,t) ,z_p(13,t)];



lfeet_x_picture(29,:,:) =[x_p(9,t) ,x_p(10,t)];
lfeet_y_picture(29,:,:) =[y_p(9,t) ,y_p(10,t)];
lfeet_z_picture(29,:,:) =[z_p(9,t) ,z_p(10,t)];
lfeet_x_picture(30,:,:) =[x_p(10,t) ,x_p(11,t)];
lfeet_y_picture(30,:,:) =[y_p(10,t) ,y_p(11,t)];
lfeet_z_picture(30,:,:) =[z_p(10,t) ,z_p(11,t)];
lfeet_x_picture(31,:,:) =[x_p(11,t) ,x_p(9,t)];
lfeet_y_picture(31,:,:) =[y_p(11,t) ,y_p(9,t)];
lfeet_z_picture(31,:,:) =[z_p(11,t) ,z_p(9,t)];

for i=1:size(rfeet_x_picture)+size(lfeet_x_picture)
    lfeet_x(:,:)=lfeet_x_picture(i,:,:);
    xlabel('x axis');
    lfeet_y(:,:)=lfeet_y_picture(i,:,:);
    ylabel('y axis');
    lfeet_z(:,:)=lfeet_z_picture(i,:,:);
    zlabel('z axis');
    line(lfeet_x,lfeet_y,lfeet_z,'color','r');
    hold on;
    rfeet_x(:,:)=rfeet_x_picture(i,:,:);
    xlabel('x axis');
    rfeet_y(:,:)=rfeet_y_picture(i,:,:);
    ylabel('y axis');
    rfeet_z(:,:)=rfeet_z_picture(i,:,:);
    zlabel('z axis');
    line(rfeet_x,rfeet_y,rfeet_z,'color','b');
    view(60,i);
end

pause(0);
delete(line);