function [training testing] = train_test_data(paths,di)
files = {};
for i = 1:length(di)
    files{i} = strcat(paths{i},'\',di(i).name,'_tt.xlsx');
end

data = {};
train_data = {};
test_data = {};
for i = 1:length(di)
    data{i,1} = xlsread(files{i},1);
    train_data{i,1} = data{i,1}(1:floor(.8*size(data{i,1},1)),:);
    test_data{i,1} = data{i,1}(floor(.8*size(data{i,1},1))+1:size(data{i,1},1),:);
end
    

training = cell2mat(train_data);
testing = cell2mat(test_data);
end