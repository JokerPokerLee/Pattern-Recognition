function [acc] = mlp(sample, label, tsample, tlabel, k, si, option)
	[train_sam, train_lab] = sub_sam(sample, label, k);
	mm = min_max(train_sam);
	net = newff(mm, si, option.trf, option.btf, option.blf, option.pf);
	model = train(net, train_sam, train_lab);
	[~, pred] = max(sim(model, tsample));
	[~, tlab] = max(tlabel);
	acc = 1.0 * length(find(pred == tlab)) / length(tlab);
end