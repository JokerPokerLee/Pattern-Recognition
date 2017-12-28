# https://stackoverflow.com/questions/8953326/multi-class-svm-one-versus-all
function [acc] = svm_predict(sample, label, model)
  prob = zeros(size(sample, 1), 3);
  for k=1:3
    [~,~,p] = svmpredict(double(label==k), sample, model{k}, '-b 1 -q');
    prob(:,k) = p(:,model{k}.Label==1);
  end
  [~,pred] = max(prob,[],2);
  acc = sum(pred == label) ./ numel(label);    %# accuracy
end