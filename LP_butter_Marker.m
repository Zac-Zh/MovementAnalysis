function filtered_position = LP_butter_Marker(fs, fc, order, data)
% Low-pass Butterworth filter function for marker data
% fs--sampling frequency
% fc--cutoff frequency
% order--filter order
% data--input data

    % Calculate filter parameters
    normalized_fc = fc / (fs/2); % Normalized cutoff frequency
    % Filter order

    [b, a] = butter(order, normalized_fc, 'low');
   
    % position = data;
    % 
    % filtered_position = zeros(size(position));

    for i = 1:size(data)
        % Get the signal for the current axis
        % signal = position(:, i);

        % Apply the low-pass filter
        filtered_position(i,:) = filter(b, a, data(i,:));

        % Store the filtered signal in the filtered position matrix
        % filtered_position(:, i) = filtered_signal;
    end
end