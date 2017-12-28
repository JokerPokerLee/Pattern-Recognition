addpath('data_process');
addpath('bayesian');

pkg load statistics;

% load data
if ~exist('sample', 'var')
	[sample, label, tsample, tlabel] = load_data();
end

if ~exist('norm_sample', 'var')
	[norm_sample, norm_tsample] = fft_pca(sample, tsample, 6, 1);
end

[pw, class_data] = classify(norm_sample, label);
model = build_model(class_data);
result = predict(norm_tsample, tlabel, model, pw);