function draw_hist(data1, data2, data3)
  k = 0;
  m = size(data1, 2);
  col = m / 3;
  if col * 3 < m
    col = col + 1;
  end
  b = [-5000:200:5000];
  for i = 1:m
    k = k + 1;
    subplot(3 * 3, col, k);
    hist(data1(:,i), b);
  end
  k = m;
  for i = 1:m
    k = k + 1;
    subplot(3 * 3, col, k);
    hist(data2(:,i), b);
  end
  k = 2 * m;
  for i = 1:m
    k = k + 1;
    subplot(3 * 3, col, k);
    hist(data3(:,i), b);
  end
end