function  lfeet_plot(t,x_p,y_p,z_p)
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
x_picture(29,:,:) =[x_p(9,t) ,x_p(10,t)];
y_picture(29,:,:) =[y_p(9,t) ,y_p(10,t)];
z_picture(29,:,:) =[z_p(9,t) ,z_p(10,t)];
x_picture(30,:,:) =[x_p(10,t) ,x_p(11,t)];
y_picture(30,:,:) =[y_p(10,t) ,y_p(11,t)];
z_picture(30,:,:) =[z_p(10,t) ,z_p(11,t)];
x_picture(31,:,:) =[x_p(11,t) ,x_p(9,t)];
y_picture(31,:,:) =[y_p(11,t) ,y_p(9,t)];
z_picture(31,:,:) =[z_p(11,t) ,z_p(9,t)];

for i=1:size(x_picture)
x2(:,:)=x_picture(i,:,:);
xlabel('x axis');
y2(:,:)=y_picture(i,:,:);
ylabel('y axis');
z2(:,:)=z_picture(i,:,:);
zlabel('z axis');
line(x2,y2,z2,'color','r');
hold on;
view(60,i);
end


pause(0);
delete(line);