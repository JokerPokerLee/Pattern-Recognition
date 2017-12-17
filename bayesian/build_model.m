function model = build_model(class_data)
  k = 3;
  model = cell(k, 1);
  for i = 1:k
    t_sample = class_data{i};
    new_model.mu = mean(t_sample);
    new_model.sig = cov(t_sample);
    model{i} = new_model;
  end
end