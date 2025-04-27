function xyz(data)
% Load the MAT file
% Specify the number of markers to iterate over


% Iterate over all markers
figure(114)
barycenter_x = zeros(6278, 1);
barycenter_y = zeros(6278, 1);
barycenter_z = zeros(6278, 1);

for allDataNumber = 1:6278

    barycenter_x(allDataNumber) = mean( ...
        data(13,allDataNumber,1)+ ...
        data(14,allDataNumber,1)+ ...
        data(15,allDataNumber,1));

    barycenter_y(allDataNumber) = mean( ...
        data(13,allDataNumber,2)+ ...
        data(14,allDataNumber,2)+ ...
        data(15,allDataNumber,2));

    barycenter_z(allDataNumber) = mean( ...
        data(13,allDataNumber,3)+ ...
        data(14,allDataNumber,3)+ ...
        data(15,allDataNumber,3));
    % Combine x, y, and z coordinates into a matrix
    barycenter_point = [barycenter_x, barycenter_y, barycenter_z];

end





xy_trajectory = [];
yz_trajectory = [];
xz_trajectory = [];
    figure(111)

for i = 1:size(barycenter_point, 1)

    current_point = barycenter_point(i, :);
    
  
    xy_trajectory = [xy_trajectory; current_point(1:2)];
    yz_trajectory = [yz_trajectory; current_point(2:3)];
    xz_trajectory = [xz_trajectory; current_point([1, 3])];
    

    clf;
   

    subplot(1, 3, 1);
    plot(xy_trajectory(:, 1), xy_trajectory(:, 2), 'b-');
    axis equal;
    title('X-Y Plane');
    

    subplot(1, 3, 2);
    plot(yz_trajectory(:, 1), yz_trajectory(:, 2), 'g-');
    axis equal;
    title('Y-Z Plane');
    

    subplot(1, 3, 3);
    plot(xz_trajectory(:, 1), xz_trajectory(:, 2), 'r-');
    axis equal;
    title('X-Z Plane');
    

    % drawnow;
    

    pause(0);
end

