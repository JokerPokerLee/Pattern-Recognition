addpath('data_process');
addpath('mlp');

pkg load statistics;
pkg load nnet;

% load data
if ~exist('sample', 'var')
	[sample, label, tsample, tlabel] = load_data();
end

% normalize
% pca transform
if ~exist('norm_sam', 'var')
	[norm_sam, norm_tsam] = fft_pca(sample, tsample, 6, 1);
end

% remove outlier
% linear scale to unit range
if ~exist('sam', 'var')
	[sam, lab, tsam, tlab] = fil_sca(norm_sam, label, norm_tsam, tlabel);
end

% mlp option
if ~exist('option', 'var')
	option.trf = {'tansig', 'tansig', 'tansig', 'purelin'};
	option.btf = 'trainlm';
	option.blf = 'learngdm';
	option.pf = 'mse';
end

% mlp
if size(sam, 1) != 6
	sam = sam';
	lab = eye(3)(lab, :)';
	tsam = tsam';
	tlab = eye(3)(tlab, :)';
end
acc = [];
for i = 1:20
	acc = mlp(sam, lab, tsam, tlab, [6 5 4 3], option)
end