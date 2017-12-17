addpath('pca');
addpath('formalize')
pkg load statistics;

if ~exist('sample', 'var')
	[sample, label, tsample, tlabel] = load_data();
end

% normalize
% pca transform
[norm_sam, norm_tsam] = data_process(sample, tsample, 6, 1);

% remove outlier
% linear scale to unit range
[sam, lab, tsam, tlab] = fil_sca(norm_sam, label, norm_tsam, tlabel);

[~, c_sam] = classify(sam, lab);