function Marker09(x,y,z)

% Specify the number of markers to traverse
  % Assuming there are 32 markers

% Create a cell array to store data for all markers
% marker_data = cell(1, num_markers);
% 
% % Traverse all markers and store their data
% for marker_number = 1:num_markers
%     marker_name = ['Marker', sprintf('%02d', marker_number)];  % Generate marker names, e.g., Marker01, Marker02
%     marker_data{marker_number} = data.(marker_name).value;
% end

% Initialize time interval
time_interval = 0.01;

% Create empty matrices to store data history
x_data_history = zeros(1, 6278);
y_data_history = zeros(1, 6278);
z_data_history = zeros(1, 6278);

% Initialize variables for min and max values
M9xmin = inf;
M9xmax = -inf;
M9ymin = inf;
M9ymax = -inf;
M9zmin = inf;
M9zmax = -inf;

% Loop through the data
for i = 1 : 6278
    x_data = x(i);
    y_data = y(i);
    z_data = z(i);
    
    % Update min and max values
    M9xmin = min(M9xmin, x_data);
    M9xmax = max(M9xmax, x_data);
    M9ymin = min(M9ymin, y_data);
    M9ymax = max(M9ymax, y_data);
    M9zmin = min(M9zmin, z_data);
    M9zmax = max(M9zmax, z_data);
end

% Loop through the data for real-time visualization
for i = 1 : 6278
    x_data = x(i);
    y_data = y(i);
    z_data = z(i);
    
    % Create a logical index to filter out (0,0,0) points
    non_zero_index = (x_data ~= 0 | y_data ~= 0 | z_data ~= 0);
    
    % Clear the previous plot
%     clf ;
    figure(131)

    % Use logical index to plot 3D scatter plot
    subplot(2, 2, 1);
    plot3(x_data(non_zero_index), y_data(non_zero_index), z_data(non_zero_index), 'o', 'MarkerSize', 6, 'MarkerFaceColor', 'b');
    grid on;
    title('Real-time Data Scatter Plot');
    xlabel('X-axis');
    ylabel('Y-axis');
    zlabel('Z-axis');
    axis([M9xmin, M9xmax, M9ymin, M9ymax, M9zmin, M9zmax]);
    view(3); % 3D view

    % Plot real-time data for X-axis in the second subplot
    subplot(2, 2, 2);
    x_data_history(i) = x_data;
    plot(1:i, x_data_history(1:i), 'b', 'LineWidth', 1.5);
    title('X-axis Real-time Data');
    xlabel('Time (ms)');
    ylabel('X-axis Data');
    grid on;

    % Plot real-time data for Y-axis in the third subplot
    subplot(2, 2, 3);
    y_data_history(i) = y_data;
    plot(1:i, y_data_history(1:i), 'g', 'LineWidth', 1.5);
    title('Y-axis Real-time Data');
    xlabel('Time (ms)');
    ylabel('Y-axis Data');
    grid on;

    % Plot real-time data for Z-axis in the fourth subplot
    subplot(2, 2, 4);
    z_data_history(i) = z_data;
    plot(1:i, z_data_history(1:i), 'm', 'LineWidth', 1.5);
    title('Z-axis Real-time Data');
    xlabel('Time (ms)');
    ylabel('Z-axis Data');
    grid on;

    % Pause for a while to simulate the time interval
    pause(time_interval);
end
end