function [fil_sam, fil_lab, param] = rm_outlier(sample, label, param)
  if size(param, 1) == 0
    param.mu = mean(sample);
    param.std = std(sample);
  end
  m = size(sample, 1);
  idx = [];
  for i=1:m
    if sum(abs(sample(i,:) - param.mu) > 3 * param.std) == 0
      idx = [idx i];
    end
  end
  fil_sam = sample(idx,:);
  fil_lab = label(idx,:);
end