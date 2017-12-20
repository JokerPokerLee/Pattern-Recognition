function [num, acc, tot] = draw_mlp(sam, lab, tsam, tlab, option)
	acc = [];
	option.trf = {'tansig', 'tansig', 'tansig', 'tansig'};
	% num = [3 4 5 8 10 12 15 18 20 50];
	% num = [6, 5, 4, 3; 6, 4, 4, 3; 6, 4, 3, 3; 6, 3, 3, 3];
	tot = [];
	sets = [4000, 5000, 6000, 7000, 8000, 9000, 10000, 15000, 20000, 25000, 30000];
	num = [];
	for k = sets
		si = [6 5 4 3];
		tmp = [];
		[train_sample, train_label] = sub_sam(sam, lab, k);
		num = [num, size(train_sample, 2)];
		for j = 1:20
			printf('Number: %d, Round: %d\n', k, j);
			tmp = [tmp, mlp(sam, lab, tsam, tlab, si, option)];
			printf('Accuracy: %f\n\n', tmp(j));
		end
		tot = [tot; tmp];
		acc = [acc, max(tmp)];
	end
end