function EMGshishi(LP_lsoleus_data,LP_rsoleus_data,LP_ltibia_data,LP_rtibia_data)
% Apply filtering
% Define time interval (0.0001 seconds)
time_interval = 0.0001;

% Get the minimum and maximum values from the data
minY = min([LP_lsoleus_data, LP_rsoleus_data, LP_ltibia_data, LP_rtibia_data]);
maxY = max([LP_lsoleus_data, LP_rsoleus_data, LP_ltibia_data, LP_rtibia_data]);

% Create a figure with four subplots
figure;

% Create a subplot for LP_ltibia_data
subplot(2, 2, 1);
title('LP Filtered EMG Data for Left Tibia Muscle');
xlabel('Time (s)');
ylabel('Amplitude');
ltibia_line = animatedline('Color', 'b');
axis([0, (62893-1)*time_interval, minY, maxY], 'seconds');

% Create a subplot for LP_lsoleus_data
subplot(2, 2, 2);
title('LP Filtered EMG Data for Left Soleus Muscle');
xlabel('Time (s)');
ylabel('Amplitude');
lsoleus_line = animatedline('Color', 'g');
axis([0, (62893-1)*time_interval, minY, maxY], 'seconds');

% Create a subplot for LP_rsoleus_data
subplot(2, 2, 3);
title('LP Filtered EMG Data for Right Soleus Muscle');
xlabel('Time (s)');
ylabel('Amplitude');
rsoleus_line = animatedline('Color', 'm');
axis([0, (62893-1)*time_interval, minY, maxY], 'seconds');

% Create a subplot for LP_rtibia_data
subplot(2, 2, 4);
title('LP Filtered EMG Data for Right Tibia Muscle');
xlabel('Time (s)');
ylabel('Amplitude');
rtibia_line = animatedline('Color', 'r');
axis([0, (62893-1)*time_interval, minY, maxY], 'seconds');

% Initialize the time vector
t = 0;

% Loop through the data and update the plots
for i = 1:length(LP_lsoleus_data)
    t = t + time_interval;
    addpoints(ltibia_line, t, LP_ltibia_data(i));
    addpoints(lsoleus_line, t, LP_lsoleus_data(i));
    addpoints(rsoleus_line, t, LP_rsoleus_data(i));
    addpoints(rtibia_line, t, LP_rtibia_data(i));
    drawnow;
end
