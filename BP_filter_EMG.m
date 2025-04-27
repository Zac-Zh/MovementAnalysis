function filtered_data = BP_filter_EMG(f, fl, fh, order, data)
% BP_filter - Bandpass filter the data using an IIR filter
%   filtered_data = BP_filter(f, fl, fh, order1, data) filters the input
%   data using an IIR bandpass filter. It takes the sampling frequency f,
%   lower cutoff frequency fl, upper cutoff frequency fh, filter order
%   order1, and the input data.

% Define the sampling frequency and cutoff frequencies
fs = f; % Sampling frequency
f1 = fl; % Lower cutoff frequency
f2 = fh; % Upper cutoff frequency

% Normalize the cutoff frequencies
normalized_f1 = f1 / (fs / 2);
normalized_f2 = f2 / (fs / 2);

% Design the IIR bandpass filter
order1 = order; % Filter orde
[b, a] = butter(order1, [normalized_f1, normalized_f2], 'bandpass');

% Apply the filter
filtered_data = filter(b, a, data);

end