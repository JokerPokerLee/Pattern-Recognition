if ~exist('sample', 'var')
  [sample, label, test_sample, test_label] = load_data();
end
pkg load statistics;
fft_sample = abs(fft(test_sample, 1000, 2))(:,1:250);
vec = pca_vec(fft_sample, 1, 1);
train_data = pca_trans(process(sample), vec);
[pw, class_data] = classify(train_data, label);
model = build_model(class_data);
test_data = pca_trans(process(test_sample), vec);
result = predict(test_data, test_label, model, pw); 