function [out1,out2,out3,out4]=VandA(data)
% Load the MAT file
% Specify the number of markers to iterate over
num_markers = 32;  % Assuming there are 32 markers
fs = 100;
t = 1/fs;
% Create a cell array to store data for all markers
marker_data = cell(1, num_markers);

% Iterate over all markers
for marker_number = 1:num_markers
    marker_name = ['Marker', sprintf('%02d', marker_number)];  % Generate marker names, e.g., Marker01, Marker02
    marker_data{marker_number} = data.(marker_name).value/1000;
end

barycenter_x = zeros(6278, 1);
barycenter_y = zeros(6278, 1);
barycenter_z = zeros(6278, 1);

for allDataNumber = 1:6278

    barycenter_x(allDataNumber) = mean( ...
        marker_data{1, 13}(allDataNumber, 1) ...
        + marker_data{1, 14}(allDataNumber, 1) ...
        + marker_data{1, 15}(allDataNumber, 1));

    barycenter_y(allDataNumber) = mean( ...
        marker_data{1, 13}(allDataNumber, 2) ...
        + marker_data{1, 14}(allDataNumber, 2) ...
        + marker_data{1, 15}(allDataNumber, 2));

    barycenter_z(allDataNumber) = mean( ...
        marker_data{1, 13}(allDataNumber, 3) ...
        + marker_data{1, 14}(allDataNumber, 3) ...
        + marker_data{1, 15}(allDataNumber, 3));

    % Combine x, y, and z coordinates into a matrix
    barycenter_point = [barycenter_x, barycenter_y, barycenter_z];

    % Calculate velocity
    velocity = diff(barycenter_point) / t;

    % Calculate acceleration
    acceleration = diff(velocity) / t;
end

% Generate a time axis based on time interval and data point count
time = t * (0:length(velocity)-1);

% Generate time axes based on time interval and data point count
time_velocity = t * (0:length(velocity)-1);
time_acceleration = t * (0:length(acceleration)-1);

% Calculate the total velocity magnitude
velocity_magnitude = sqrt(sum(velocity.^2, 2));

% Calculate the total acceleration magnitude
acceleration_magnitude = sqrt(sum(acceleration.^2, 2));

% Plot velocity
subplot(2, 2, 1);
plot(time_velocity, velocity);
title('Velocity');
xlabel('Time (s)');
ylabel('Velocity (m/s)');
legend('Vx', 'Vy', 'Vz');
grid on;

% Plot acceleration
subplot(2, 2, 2);
plot(time_acceleration, acceleration);
title('Acceleration');
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
legend('Ax', 'Ay', 'Az');
grid on;

% Adjust subplot layout
sgtitle('Velocity and Acceleration');

% Plot the total velocity

subplot(2, 2, 3);
plot(time, velocity_magnitude);
title('Total Velocity');
xlabel('Time (s)');
ylabel('Total Velocity (m/s)');
grid on;

% Plot the total acceleration
subplot(2, 2, 4);
plot(time(2:end), acceleration_magnitude);
title('Total Acceleration');
xlabel('Time (s)');
ylabel('Total Acceleration (m/s^2)');
grid on;

sgtitle('Total Velocity and Total Acceleration');
for i=1:3
    velocityturned(i,:)=velocity(:,i);
    accelerationturned(i,:)=acceleration(:,i);
end
   	V_p1=LP_butter_Marker(100,10,5,velocityturned);
    V_p2=LP_FIR_Marker(100,10,4,velocityturned);
    A_p1=LP_butter_Marker(100,10,5,accelerationturned);
    A_p2=LP_FIR_Marker(100,10,4,accelerationturned);
out1=V_p1;
out2=V_p2;
out3=A_p1;
out4=A_p2;

figure (1131);
%plot butter processed v
subplot(2, 2, 1);
plot(time_velocity, V_p1);
title('Butter Filtered Velocity');
xlabel('Time (s)');
ylabel('Velocity (m/s)');
legend('Vx', 'Vy', 'Vz');
grid on;

% Plot butter processed acceleration
subplot(2, 2, 2);
plot(time_acceleration, A_p1);
title('Butter Filted Acceleration');
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
legend('Ax', 'Ay', 'Az');
grid on;

%plot FIR processed v
subplot(2, 2, 3);
plot(time_velocity, V_p2);
title('FIR Filtered Velocity');
xlabel('Time (s)');
ylabel('Velocity (m/s)');
legend('Vx', 'Vy', 'Vz');
grid on;

subplot(2, 2, 4);
plot(time_acceleration, A_p2);
title('FIR Filtered Acceleration');
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
legend('Ax', 'Ay', 'Az');
grid on;
sgtitle('Filtered Velocity and Filtered Acceleration');
end

