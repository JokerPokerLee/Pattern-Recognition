%{
  fft transform
  add amplitude
  add max frequency
%}
function [res] = process(sample)
  % assume that there are 1000 feature
  % symmetry property filter 501~1000 component
  % observed that component above 250 decrease to zero
  fft_sample = abs(fft(sample, 1000, 2))(:,1:250);
  amp = max(abs(sample), [], 2);
  fm = max(fft_sample, [], 2);
  res = [fft_sample];
end