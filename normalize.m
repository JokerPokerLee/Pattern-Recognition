function [res] = normalize(data)
    m = mean(data);
    s = std(data);
    res = (data - m) ./ s;
end