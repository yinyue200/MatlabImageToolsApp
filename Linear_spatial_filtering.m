function g = Linear_spatial_filtering(f)
%LINEAR_SPATIAL_FILTERING 线性空间滤波
%f 输入图像 g滤波结果
w = fspecial('average',[5 5]);
g = imfilter(f,w,'circular');
end

