function data = getEMGData(L, labelName)
    data1 = L(strcmp(L(:, 1), labelName), :);
    data = cell2mat(data1(:, 2));
end