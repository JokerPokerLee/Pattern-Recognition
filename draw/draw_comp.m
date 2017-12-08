function draw_comp(sample, k)
  comp1 = sample{1}(:, k);
  comp2 = sample{2}(:, k);
  comp3 = sample{3}(:, k);
  x1 = [1:size(comp1, 1)];
  x2 = [1:size(comp2, 1)];
  x3 = [1:size(comp3, 1)];
  x = [1:min(size(x1), size(x2), size(x3))];
  plot(x1, comp1, 'r', x2, comp2, 'g', x3, comp3, 'b');
end