function [acc] = mlp(sample, label, tsample, tlabel, si, option)
	mm = min_max(sample);
	net = newff(mm, si, option.trf, option.btf, option.blf, option.pf);
	model = train(net, sample, label);
	[~, pred] = max(sim(model, tsample));
	[~, tlab] = max(tlabel);
	acc = 1.0 * length(find(pred == tlab)) / length(tlab);
end