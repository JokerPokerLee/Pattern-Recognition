function [sub_sample] = sub_set(class_data, k)
  sub_sample = cell(3, 1);
  for i = 1:3
    sub_sample{i} = class_data{i}(randperm(size(class_data{i}, 1))(1:k),:);
  end
end