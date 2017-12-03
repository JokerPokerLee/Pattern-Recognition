function [res] = pca_trans(data, vec)
  k = size(vec, 1);
  res = [data(:, 1:k) * vec, data(:, k+1:k+2)];
end