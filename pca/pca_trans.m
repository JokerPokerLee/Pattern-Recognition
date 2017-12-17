function [res, par] = pca_trans(data, vec, param)
  data = (data - param.mu) ./ param.std;
  k = size(vec, 1);
  res = data(:, 1:k) * vec;
  if size(data, 2) > k
    res = [data(:, 1:k) * vec, data(:, k+1:k+2)];
  end
end