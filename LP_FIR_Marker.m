function filtered_position = LP_FIR_Marker(fs, fc, order, data)
% Low-pass FIR filter function for marker data
% fs: Sampling rate (in Hz)
% fc: Cutoff frequency (in Hz)
% order: Filter order
% data: Data matrix to be filtered

% Calculate filter parameters
normalized_fc = fc / (fs/2); % Normalized cutoff frequency

% Design a low-pass FIR filter
b = fir1(order, normalized_fc, 'low');

% Assume the data is stored in a variable named "coordinates"

% Initialize the filtered 3D coordinate data
% filtered_position = zeros(size(position));

% Apply low-pass filtering to each coordinate axis separately
for i = 1:size(data)
    % Get the signal for the current coordinate axis

    % Apply the low-pass filter
    filtered_position(i,:) = filter(b, 1, data(i,:));

    % Store the filtered signal in the filtered position matrix
    
end
end