function model = build_model(class_data)
  model = [];
  for i = 1:3
    t_sample = class_data.(sprintf('c%d', i));
    new_model.mu = mean(t_sample);
    new_model.sig = cov(t_sample);
    model = [model; new_model];
  end
end