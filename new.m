% Group 2
% Project: Human movement analysis
clear all;
close all;  
clc;

%% load the data

fs_EMG = 1000;
period = 1/fs_EMG;
t_EMG= 0:period:62893*period-period;

a=load('walking.mat');   
marker=a.Marker;
markername=fieldnames(marker);
markername=sort(markername);
%load marker


position=zeros(length(markername),6278,3);
x=zeros(length(markername),6278);
y=zeros(length(markername),6278);
z=zeros(length(markername),6278);
for i=1:length(markername)
    position(i,:,:)=marker.(markername{i}).value;
    x(i,:)=position(i,:,1);
    y(i,:)=position(i,:,2);
    z(i,:)=position(i,:,3);
end

% loadEMG
L=initialEMG(a);
% Define sampling frequency
% Create time vector for EMG data
ltibia_data=   getEMGData(L,"Analog18")/1000;   % Extract ltibia data
lsoleus_data = getEMGData(L,"Analog22")/1000;   % Extract lsoleus data
rtibia_data = getEMGData(L,"Analog17")/1000;    % Extract rtibia data
rsoleus_data = getEMGData(L,"Analog21")/1000;   % Extract rsoleus data




%% 1.1-Codamotion data post processing. Understand the walking posture.
%% 1.1.1-Plot the position x,y,z of the feet on time.
% figure(111)

%% 1.1.2-Compute the velocity and the accelerometer of the feet.
   figure (112)
   [V1,V2,A1,A2]=VandA(marker);
%% 1.1.3-Filter the position, velocity and accelerometer with two types of lowpass filter.
   figure (1122)
VanA_after_filter(V1);
   figure (1123)
VanA_after_filter(V2);
%% 1.1.4-Plot x-y, y-z, and x-z 2D trajectories on three coordinate planes.
%real time xyz 
% xyz(position);
%% 1.1.5-Plot 3D dynamic trajectories of two feet with two different colours.
% 
t_realtime = 100;
figure(115);
for t=1:t_realtime
    plotmark(t,x,y,z);
end














% 
% 
%% 1.2-EMG signal processing. Understand the relationship between Tibia and Soleus.
%% 1.2.1-Plot respectively left and right leg muscles. Use different colours for Tibia and Soleus.

 %Remove DC offset
ltibia_data = ltibia_data-mean(ltibia_data);
lsoleus_data = lsoleus_data-mean(lsoleus_data);
rtibia_data = rtibia_data-mean(rtibia_data);
rsoleus_data = rsoleus_data-mean(rsoleus_data);

figure(121); 
% Plot left leg muscles
subplot(2, 1, 1);
line(t_EMG, ltibia_data, 'Color', 'y');
hold on;
line(t_EMG, lsoleus_data, 'Color', 'r');
legend('Left Tibia','Left Soleus');
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Left');

% Plot right leg muscles
subplot(2, 1, 2);
line(t_EMG, rtibia_data, 'Color', 'k');
hold on;
line(t_EMG, rsoleus_data, 'Color', 'b');
legend('Right Tibia','Right Soleus');
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Right');
sgtitle('Leg Muscles')


%% 1.2.2-Plot the absolute value of Tibia and Soleus on time.
% plot on real time
% figure(122);
% subplot(4, 1, 1);
% h1 = plot(0, 0, 'y-');
% title('left tibia');
% subplot(4, 1, 2);
% h2 = plot(0, 0, 'r-');
% title('left soleus');
% subplot(4, 1, 3);
% h3 = plot(0, 0, 'k-');
% title('right tibia');
% subplot(4, 1, 4);
% h4 = plot(0, 0, 'b-');
% title('right soleus');
% sgtitle('The absolute value on time')
% 
% for i = t_EMG
%     set(h1, 'XData', t_EMG(1:i), 'YData', abs(ltibia_data(1, 1:i)));
%     set(h2, 'XData', t_EMG(1:i), 'YData', abs(rtibia_data(1, 1:i)));
%     set(h3, 'XData', t_EMG(1:i), 'YData', abs(lsoleus_data(1, 1:i)));
%     set(h4, 'XData', t_EMG(1:i), 'YData', abs(rsoleus_data(1, 1:i)));
%     drawnow;
%     pause(0.01);
% end



figure(122);
subplot(4, 1, 1);
h1 = plot(t_EMG, abs(ltibia_data), 'y-');
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Left Tibia');

subplot(4, 1, 2);
h2 = plot(t_EMG, abs(lsoleus_data), 'r-');
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Left Soleus');

subplot(4, 1, 3);
h3 = plot(t_EMG, abs(rtibia_data), 'k-');
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Right Tibia');

subplot(4, 1, 4);
h4 = plot(t_EMG, abs(rsoleus_data), 'b-');
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Light Soleus');
sgtitle('The absolute value on time')





%% 1.2.3-Filter bandpass (4-400Hz).
% Process the signal by bandpass
BP_ltibia_data = BP_filter_EMG(1000, 4, 400, 4, ltibia_data);
BP_lsoleus_data = BP_filter_EMG(1000, 4, 400, 4, lsoleus_data);
BP_rtibia_data = BP_filter_EMG(1000, 4, 400, 4, rtibia_data);
BP_rsoleus_data = BP_filter_EMG(1000, 4, 400, 4, rsoleus_data);

% Plot Filter bandpass
figure(123); 
subplot(4, 1, 1);
plot(t_EMG, ltibia_data , 'm');
hold on;
plot(t_EMG, BP_ltibia_data , 'y-');
legend('Raw Sigial','BP Siginal');
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Left Tibia');

subplot(4, 1, 2);
plot(t_EMG, lsoleus_data , 'm');
hold on;
plot(t_EMG, BP_lsoleus_data , 'r-');
legend('Raw Sigial','BP Siginal');
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Left Soleus');

subplot(4, 1, 3);
plot(t_EMG, rtibia_data , 'm');
hold on;
plot(t_EMG, BP_rtibia_data , 'k-');
legend('Raw Sigial','BP Siginal');
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Right Tibia');

subplot(4, 1, 4);
plot(t_EMG, rsoleus_data , 'm');
hold on;
plot(t_EMG, BP_rsoleus_data , 'b-');
legend('Raw Sigial','BP Siginal');
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Right Soleus');
sgtitle('Filter bandpass')





%% 1.2.4-Filter lowpass 5 Hz to obtain an envelope of the muscle activity.
% Process the signal by lowpass
LP_ltibia_data = LP_filter_EMG(1000, 5, 4, BP_ltibia_data);
LP_lsoleus_data = LP_filter_EMG(1000, 5, 4, BP_lsoleus_data);
LP_rtibia_data = LP_filter_EMG(1000, 5, 4, BP_rtibia_data);
LP_rsoleus_data = LP_filter_EMG(1000, 5, 4, BP_rsoleus_data);

% % Plot the envelope of the muscle activity
figure (124)
subplot(4, 1, 1);
e1 = hilbert(LP_ltibia_data);
plot(t_EMG,LP_ltibia_data,'y');
hold on
plot(t_EMG,abs(e1),'-','linewidth',1.5,'Color','m')
legend('Signal','Envelope');
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Left Tibia');

subplot(4, 1, 2);
e2 = hilbert(LP_lsoleus_data);
plot(t_EMG,LP_lsoleus_data,'r');
hold on
plot(t_EMG,abs(e2),'-','linewidth',1.5,'Color','m')
legend('Signal','Envelope');
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Left Soleus');

subplot(4, 1, 3);
e3 = hilbert(LP_rtibia_data);
plot(t_EMG,LP_rtibia_data,'k');
hold on
plot(t_EMG,abs(e3),'-','linewidth',1.5,'Color','m')
legend('Signal','Envelope');
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Right Tibia');


subplot(4, 1, 4);
e4 = hilbert(LP_rsoleus_data);
plot(t_EMG,LP_rsoleus_data,'b');
hold on
plot(t_EMG,abs(e4),'-','linewidth',1.5,'Color','m')
legend('Signal','Envelope');
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Right Soleus');
sgtitle('The envelope of the muscle activity by Filter lowpass 5 Hz')


% 
% 
 %% 1.3-Synchronisation of the EMG and the foot position. Understand the relationship between the EMG and the position during the walking.
 %% 1.3.1-Plot the Marker09 position x,y,z of the feet on time.
x_p=LP_butter_Marker(100,10,5,x);
y_p=LP_butter_Marker(100,10,5,y);
z_p=LP_butter_Marker(100,10,5,z);
Marker09(x_p(9,:),y_p(9,:),z_p(9,:));
% 
% 
% 
% 
% 
%% 1.3.2-Plot Tibia and Soleus of the leg left.

EMGshishi(LP_ltibia_data,LP_lsoleus_data,LP_rtibia_data,LP_rsoleus_data);
%% 1.3.3-Compute absolute value of EMG.
%   
figure(1331)
realTimePlot(LP_ltibia_data)
%% 1.3.4-Plot EMG and position on a same.
Markerfeet(x_p(9:15,:),y_p(9:15,:),z_p(9:15,:),LP_ltibia_data,LP_lsoleus_data,LP_rtibia_data,LP_rsoleus_data);