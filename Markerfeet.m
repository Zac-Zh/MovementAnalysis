function Markerfeet(x,y,z,ltibia,lsoleus,rtibia,rsoleus)

% Initialize time interval
time_interval = 0.01;
% 
% % Create empty matrices to store data history
% x_data_history = zeros(7, 6278);
% y_data_history = zeros(7, 6278);
% z_data_history = zeros(7, 6278);

% Initialize variables for min and max values
Mxmin = inf;
Mxmax = -inf;
Mymin = inf;
Mymax = -inf;
Mzmin = inf;
Mzmax = -inf;
 %load the emg  
 j=1;
 for i=1:10:62781
     ltibia_data_synchronized(1,j)=ltibia(i);
     lsoleus_data_synchronized(1,j)=lsoleus(i);
     rtibia_data_synchronized(1,j)=rtibia(i);
     rsoleus_data_synchronized(1,j)=rsoleus(i);
     j=j+1;
 end
 
% minY = min([ltibia_data_synchronized,lsoleus_data_synchronized,rtibia_data_synchronized,rsoleus_data_synchronized]);
% maxY = max([ltibia_data_synchronized,lsoleus_data_synchronized,rtibia_data_synchronized,rsoleus_data_synchronized]);
t_synchronized = 1:6278;



% Loop through the data
% for i = 1 : 6278
%     x_data = x(i);
%     y_data = y(i);
%     z_data = z(i);
%     
%     % Update min and max values

% end

% Loop through the data for real-time visualization
j=1;
for i = 1 : 6278
    for j = 1:7
    x_data(j,i) = x(j,i);
    y_data(j,i) = y(j,i);
    z_data(j,i) = z(j,i);
    
    %     Mxmin = min(Mxmin, x_data);
%     Mxmax = max(Mxmax, x_data(j,i));
%     Mymin = min(Mymin, y_data(j,i));
%     Mymax = max(Mymax, y_data(j,i));
%     Mzmin = min(Mzmin, z_data(j,i));
%     Mzmax = max(Mzmax, z_data(j,i));
    end
     % Clear the previous plot
     clf;
    % Use logical index to plot 3D scatter plot
    % subplot(2, 2, 1);
    % plot3(x_data(1,i), y_data(1,i), z_data(1,i), 'o', 'MarkerSize', 4, 'MarkerFaceColor', 'b');
    % hold on;
    % plot3(x_data(2,i), y_data(2,i), z_data(2,i), 'o', 'MarkerSize', 4, 'MarkerFaceColor', 'b');
    % hold on;
    % plot3(x_data(3,i), y_data(3,i), z_data(3,i), 'o', 'MarkerSize', 4, 'MarkerFaceColor', 'b');
    % hold on;
    % plot3(x_data(5,i), y_data(5,i), z_data(5,i), 'o', 'MarkerSize', 4, 'MarkerFaceColor', 'b');
    % hold on;
    % plot3(x_data(6,i), y_data(6,i), z_data(6,i), 'o', 'MarkerSize', 4, 'MarkerFaceColor', 'b');
    % hold on;
    % plot3(x_data(7,i), y_data(7,i), z_data(7,i), 'o', 'MarkerSize', 4, 'MarkerFaceColor', 'b');
    % hold on;
    subplot(3,2,[1,2]);
    plot3([x_data(1,i), x_data(2,i)], [y_data(1,i), y_data(2,i)], [z_data(1,i), z_data(2,i)], '-ro');
    hold on;
    plot3([x_data(3,i), x_data(2,i)], [y_data(3,i), y_data(2,i)], [z_data(3,i), z_data(2,i)], '-ro');
    hold on;
    plot3([x_data(1,i), x_data(3,i)], [y_data(1,i), y_data(3,i)], [z_data(1,i), z_data(3,i)], '-ro');
    grid on;
    plot3([x_data(5,i), x_data(6,i)], [y_data(5,i), y_data(6,i)], [z_data(5,i), z_data(6,i)], '-ro');
    hold on;
    plot3([x_data(7,i), x_data(6,i)], [y_data(7,i), y_data(6,i)], [z_data(7,i), z_data(6,i)], '-ro');
    hold on;
    plot3([x_data(5,i), x_data(7,i)], [y_data(5,i), y_data(7,i)], [z_data(5,i), z_data(7,i)], '-ro');
    grid on;
    title('position');
    xlabel('X-axis');
    ylabel('Y-axis');
    zlabel('Z-axis');
%     axis([Mxmin, Mxmax, Mymin, Mymax, Mzmin, Mzmax]);
    view(3); % 3D view
    subplot(3, 2, 3);
    h1 = plot(0, 0, 'y-');
    title('left tibia');
    subplot(3, 2, 4);
    h3 = plot(0, 0, 'k-');
    title('left soleus');
    subplot(3, 2, 5);
    h2 = plot(0, 0, 'r-');
    title('right tibia');
    subplot(3, 2, 6);
    h4 = plot(0, 0, 'b-');
    title('right soleus');
    sgtitle('EMG and Position');
    set(h1, 'XData', t_synchronized(1:i), 'YData', ltibia_data_synchronized(1, 1:i));
    set(h2, 'XData', t_synchronized(1:i), 'YData', lsoleus_data_synchronized(1, 1:i));
    set(h3, 'XData', t_synchronized(1:i), 'YData', rtibia_data_synchronized(1, 1:i));
    set(h4, 'XData', t_synchronized(1:i), 'YData', rsoleus_data_synchronized(1, 1:i));
    drawnow;
    % Pause for a while to simulate the time interval
    pause(0);
end
end