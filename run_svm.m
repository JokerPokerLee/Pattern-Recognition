addpath('data_process');
addpath('libsvm');
addpath('svm');

pkg load statistics;

% load data
if ~exist('sample', 'var')
    [sample, label, tsample, tlabel] = load_data();
end

if ~exist('norm_sample', 'var')
    [norm_sample, norm_tsample] = fft_pca(sample, tsample, 6, 1);
end

if ~exist('sam')
    [sam, lab, tsam, tlab] = fil_sca(norm_sample, label, norm_tsample, tlabel);
end

[~, class_data] = classify(sam, lab);
acc = [];
for i = 1:10
    sub_sample = sub_set(class_data, 600);
    svm_model = svm_train(sub_sample, 0.5);
    acc = [acc, svm_predict(tsam, tlab, svm_model)];
end
max(acc)