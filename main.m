 % Group 2
 % data  11.6
clear all;
close all;

%%  load the data
a=load('walking.mat');   
marker=a.Marker;
markername=fieldnames(marker);
markername=sort(markername);
t_EMG=1:62893;
for i=1:length(markername)
    position(i,:,:)=marker.(markername{i}).value;
    x(i,:)=position(i,:,1);
    y(i,:)=position(i,:,2);
    z(i,:)=position(i,:,3);
end

L=initialEMG(a);
% Define sampling frequency
% Create time vector for EMG data
ltibia_data=   getEMGData(L,"Analog18");   % Extract ltibia data
lsoleus_data = getEMGData(L,"Analog22");   % Extract rsoleus data
rtibia_data = getEMGData(L,"Analog17");
rsoleus_data = getEMGData(L,"Analog21");
%% 1.2 


% Plot EMG data for ltibia and lsoleus
figure(1);
subplot(2, 1, 1);
line(t_EMG, ltibia_data, 'Color', 'b');
hold on;
line(t_EMG, lsoleus_data, 'Color', 'r');
hold on;

% Plot EMG data for rtibia and rsoleus
subplot(2, 1, 2);
line(t_EMG, rtibia_data, 'Color', 'cyan');
hold on;
line(t_EMG, rsoleus_data, 'Color', 'g');
hold on;

% Plot absolute value of ltibia_data over time
% figure;

% for i = t_EMG
%     plot(i, abs_ltibia(1, i), 'Color', 'b', 'Marker', '+');
%     hold on;
%     drawnow;
%     pause(0.01);
% end
% figure (2)
% realTimePlot(t_EMG,abs(ltibia_data));
% figure (3)
% realTimePlot(t_EMG,abs(lsoleus_data));
%process the signal
BP_lsoleus_data = BP_filter_EMG(1000, 4, 400, 4, lsoleus_data);
LP_lsoleus_data = LP_filter_EMG(1000, 5, 4, BP_lsoleus_data);
BP_rsoleus_data = BP_filter_EMG(1000, 4, 400, 4, rsoleus_data);
LP_rsoleus_data = LP_filter_EMG(1000, 5, 4, BP_rsoleus_data);
BP_ltibia_data = BP_filter_EMG(1000, 4, 400, 4, ltibia_data);
LP_ltibia_data = LP_filter_EMG(1000, 5, 4, BP_ltibia_data);
BP_rtibia_data = BP_filter_EMG(1000, 4, 400, 4, rtibia_data);
LP_rtibia_data = LP_filter_EMG(1000, 5, 4, BP_rtibia_data);
x_p=LP_butter_Marker(100,10,5,x);
y_p=LP_butter_Marker(100,10,5,y);
z_p=LP_butter_Marker(100,10,5,z);
%plot the envelope
analytic_signal = hilbert(LP_lsoleus_data);
envelope = abs(analytic_signal);

figure(2) ;
plot(t_EMG, envelope,'Color','r','LineWidth',1.5);
hold on;
plot(t_EMG,LP_lsoleus_data','b');
xlabel('Time (s)');
ylabel('Amplitude');
title('Envelope of Filtered Data');


%%

%%
figure (3)
Marker09(x_p,y_p,z_p);
%    for t=1:6278
%             plotfeet(t,x_p,y_p,z_p);
% %             plot(t*10-9:t*10,lsoleus_data(1,t*10-9:t*10),'-'); 
%             hold on
%    end
%%