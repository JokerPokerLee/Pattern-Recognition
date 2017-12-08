if ~exist('sample', 'var')
  [sample, label, test_sample, test_label] = load_data();
end
pkg load statistics;
fft_sample = abs(fft(sample, 1000, 2))(:,1:250);
[vec, pca_param] = pca_vec(fft_sample, 6, 1);

% normalize train sample and test sample using pca_param
% perform pca transformation using vec
train_data = pca_trans(process(sample), vec, pca_param);
test_data = pca_trans(process(test_sample), vec, pca_param);

[pw, class_data] = classify(train_data, label);
model = build_model(class_data);
result = predict(test_data, test_label, model, pw);