function [result] = predict(sample, label, model, pw)
  m = size(sample, 1);
  n = size(sample, 2);
  if n != size(model(1).mu)
    sprintf('[predict]: Dimension dismatch.')
    return;
  end
  tot = 0;
  cor = 0;
  k = size(model);
  result = zeros(3, 3);
  cnt = 0;
  for i = 1:m
    if label(i) < 1 | label(i) > 3
      continue;
    end
    cnt = cnt + 1;
    pd = [];
    for j = 1:k
      p = mvnpdf(sample(i,:), model(j).mu, model(j).sig);
      pd = [pd; p * pw(j)];
    end
    [v, idx] = max(pd);
    tot = tot + 1;
    if idx == label(i)
      cor = cor + 1;
    end
    result(idx, label(i)) += 1;
  end
  1.0 * cor / tot
end