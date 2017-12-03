% perform n to k de-dimension pca
% retain at least <prop> proportion message of sample after pca
% if mode equals to 1, prop determine how many component to select,
% otherwise prop indicate how much info to remain
function [vec] = pca_vec(sample, prop, mode)
  % n-dim sample
  n = size(sample, 2);
  pkg load statistics;
  [COEFF, SCORE, latent] = princomp(sample);
  p = cumsum(latent) ./ sum(latent);
  if mode == 1
    vec = COEFF(:, 1:prop);
    p(prop)
    return
  end
  % init k to n
  k = n;
  for i = 1:size(p)
    if p(i) >= prop
      k = i;
      break;
    end
  end
  % get eigvec
  vec = COEFF(:,1:k);
end