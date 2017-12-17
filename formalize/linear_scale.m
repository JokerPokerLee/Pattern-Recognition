function [sca_sam, param] = linear_scale(sample, range, param)
  scale = range.u - range.l;
  bias = range.l;
  if size(param, 1) == 0
    mi = min(sample);
    ma = max(sample);
  else
    mi = param.mi;
    ma = param.ma;
  end
  sca_sam = scale * (sample - mi) ./ (ma - mi) + bias;
  param.mi = mi;
  param.ma = ma;
end