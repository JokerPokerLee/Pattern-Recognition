function [norm_sample, norm_tsample] = fft_pca(sample, test_sample, p, mode)

	fft_sample = abs(fft(sample, 1000, 2))(:,1:250);
	[vec, pca_param] = pca_vec(fft_sample, p, mode);

	% normalize train sample and test sample using pca_param
	% perform pca transformation using vec
	norm_sample = pca_trans(process(sample), vec, pca_param);
	norm_tsample = pca_trans(process(test_sample), vec, pca_param);

end