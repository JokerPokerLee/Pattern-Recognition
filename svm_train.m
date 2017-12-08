# https://stackoverflow.com/questions/8953326/multi-class-svm-one-versus-all
function [model] = svm_train(train_data, cost)
  model = cell(3, 1);
  sample = [train_data{1}; train_data{2}; train_data{3}];
  wei = [2, 1, 6];
  for i = 1:3
    label = [];
    for j = 1:3
      newl = zeros(size(train_data{j}, 1), 1);
      if i == j
        newl = newl + 1;
      end
      label = [label; newl];
    end
    model{i} = svmtrain(label, sample, sprintf('-t 2 -c %d -b 1 -q -wi %d', cost, wei(i)));
  end
end