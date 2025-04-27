% Load walking data from "walking.mat"
function L=initialEMG(w)


% Get the fieldnames of Analog structure and sort them
a_name = fieldnames(w.Analog);
a_sort = sort(a_name);

% Initialize cell array L to store EMG data
L{1, 1} = "EMGname";
L{1, 2} = "data";
a_data=zeros(length(a_sort),62893);
for i = 1:length(a_sort)
    % Store the label of walking data in a_name
    % Store the value of walking.Analog.(Analogxx) in a_data
    L{i+1, 1} = a_name{i, 1};
    a_data(i, :) = w.Analog.(a_name{i, 1}).value;
    L{i+1, 2} = a_data(i, :);
end

% Save EMG data in a file named "EMGData.mat"
end 
