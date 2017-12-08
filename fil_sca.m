% train_data = train_data(:,1:6);
% test_data = test_data(:,1:6);

% remove outliar (two std away from mean)
[fil_sam, fil_lab, fil_param] = filter(train_data, label, []);
[fil_tsam, fil_tlab, ~] = filter(test_data, test_label, fil_param);

% linear scale data to [-1, 1]
range.u = 1;
range.l = -1;
[sca_sam, sca_param] = linear_scale(fil_sam, range, []);
[sca_tsam, ~] = linear_scale(fil_tsam, range, sca_param);

[~, sca_class] = classify(sca_sam, fil_lab);
sub_sample = sub_set(sca_class, 500);