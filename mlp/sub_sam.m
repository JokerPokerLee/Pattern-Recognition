function [sub_sample, sub_label] = sub_sam(sample, label, k)
	[~, lab] = max(label);
	n = length(unique(lab));
	sub_sample = [];
	sub_label = [];
	for i = 1:n
		idx = find(lab == i);
		cur_lab = label(:, idx(1));
		if length(idx) < k
			printf('No enough class %d sample.\n', i);
			sub_sample = [sub_sample, sample(:, idx)];
			sub_label = [sub_label, repmat(cur_lab, 1, length(idx))];
			continue;
		end
		perm = randperm(length(idx));
		idx = idx(perm(1:k));
		sub_sample = [sub_sample, sample(:, idx)];
		sub_label = [sub_label, repmat(cur_lab, 1, k)];
	end
end