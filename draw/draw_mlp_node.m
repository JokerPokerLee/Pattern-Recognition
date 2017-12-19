function [num, acc, tot] = draw_mlp_node(sam, lab, tsam, tlab, option)
	acc = [];
	k = 500;
	option.trf = {'tansig', 'tansig', 'tansig', 'tansig'};
	% num = [3 4 5 8 10 12 15 18 20 50];
	num = [6, 5, 4, 3; 6, 4, 4, 3; 6, 4, 3, 3; 6, 3, 3, 3];
	tot = [];
	for i = 1:size(num, 1);
		si = num(i, :);
		tmp = [];
		for j = 1:20
			printf('Number: %d, Round: %d\n', i, j);
			tmp = [tmp, mlp(sam, lab, tsam, tlab, k, si, option)];
			printf('Accuracy: %f\n\n', tmp(j));
		end
		tot = [tot; tmp];
		acc = [acc, max(tmp)];
	end
end