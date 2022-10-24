function g = Median_value_filter(f)
%MEDIAN_VALUE_FILTER 中值滤波器
%f 输入图像 g滤波结果
g = medfilt2(f,[5 5]);
end

