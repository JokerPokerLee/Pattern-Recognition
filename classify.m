function [p, class_data] = classify(sample, label)
  k = 3;
  m = size(label);
  p = zeros(k, 1);
  tot = 0;
  for i = 1:k
    indices = find(label == i);
    t_sample = sample(indices(:),:);
    p(i) = size(t_sample, 1);
    tot = tot + p(i);
    class_data.(sprintf('c%d', i)) = t_sample;
  end
  p = p ./ tot;
end