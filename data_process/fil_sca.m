function [sam, lab, tsam, tlab] = fil_sca(sample, label, test_data, test_label)
	% remove outliar (two std away from mean)
	[fil_sam, fil_lab, fil_param] = rm_outlier(sample, label, []);
	% [fil_tsam, fil_tlab, ~] = rm_outlier(test_data, test_label, fil_param);
	fil_tsam = test_data;
	fil_tlab = test_label;

	% linear scale data to [-1, 1]
	range.u = 1;
	range.l = -1;
	[sca_sam, sca_param] = linear_scale(fil_sam, range, []);
	[sca_tsam, ~] = linear_scale(fil_tsam, range, sca_param);

	sam = sca_sam;
	lab = fil_lab;
	tsam = sca_tsam;
	tlab = fil_tlab;
end