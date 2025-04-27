function filtered_data = LP_filter_EMG(fs, fc, order, data)
% LP_filter_EMG is a function to apply low-pass filtering to EMG data.
% It uses a Butterworth filter design.

% Inputs:
% fs: Sampling frequency in Hz.
% fc: Cutoff frequency in Hz.
% order: Filter order.
% data: Input EMG data to be filtered.

% Outputs:
% filtered_data: Filtered EMG data.

% Low-pass Butterworth filter design
% Define sampling frequency and cutoff frequency
f = fs; % Sampling frequency in Hz
fC = fc; % Cutoff frequency in Hz

% Calculate filter parameters
normalized_fc = fC / (f/2); % Normalized cutoff frequency
order1 = order; % Filter order

% Design low-pass filter
[b, a] = butter(order1, normalized_fc, 'low');

% Apply filtering
filtered_data = filter(b, a, data);

end