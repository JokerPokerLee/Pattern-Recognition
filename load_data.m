% total sample 121622
function [sample, label, test_sample, test_label] = load_data()
  tot_sample = [];
  tot_label = [];
  for i = 1:20
    % process indicator
    sprintf('Loading person %d.\n', i);
    
    % load sample
    load(sprintf('data/sleep_data_row3_%d', i));
    now = size(data,2) / 1000;
    sample = zeros(now, 1000);
    for j = 1:now
      sample(j,:) = data(1, (j - 1) * 1000 + 1:j * 1000);
    end
    
    % load label
    fid = fopen(sprintf('label/HypnogramAASM_subject%d.txt', i));
    fgetl(fid);
    label = [];
    while ~feof(fid)
      s = fgetl(fid);
      label = [label; str2num(s)];
    end
    fclose(fid);
      
    indices = find(label > 0 & label < 4);
    filtered_sample = sample(indices(:),:);
    filtered_label = label(indices(:));
    if i < 20
      tot_sample = [tot_sample; filtered_sample];
      tot_label = [tot_label; filtered_label];
    else
      test_sample = filtered_sample;
      test_label = filtered_label;
    end
  end
  sample = tot_sample;
  label = tot_label;
end