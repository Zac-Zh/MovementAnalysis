function VanA_after_filter(data)
    % Calculate the total speed
    data=data';
    total_speed = sqrt(sum(data.^2, 2));
    fs = 100;
    t = 1/fs;
    % Calculate the tangential speed
    tangential_speed = gradient(total_speed);
    
    % Calculate the total acceleration
    total_acceleration = (total_speed(2:end) - total_speed(1:end-1)) ./ 0.01;
    
    % Calculate the tangential acceleration
    tangential_accelertation = gradient(total_acceleration);
    % Generate a time axis based on time interval and data point count
    time = t * (0:length(data)-1);
    time2 = t * (0:length(data)-2);
    subplot(2,2,1)
        plot(time, total_speed );
        title('Total Speed');
        xlabel('Time (s)');
        ylabel('Filtered Total Speed');
        grid on;
    subplot(2,2,2)
        plot(time, tangential_speed);
        title('Tangential Speed');
        xlabel('Time (s)');
        ylabel('Filtered Total Acceleration');
        grid on;
    subplot(2,2,3)
        plot(time2, total_acceleration);
        title('Total Acceleration');
        xlabel('Time (s)');
        ylabel('Filtered Total Speed');
        grid on;
    subplot(2,2,4)
        plot(time2, tangential_accelertation);
        title('Tangential Accelertation');
        xlabel('Time (s)');
        ylabel('Filtered Tangential Accelertation');
        grid on;
end