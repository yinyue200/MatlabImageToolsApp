function [I_out,N_out] = Histogram_equalization(I)
%HISTOGRAM_EQUALIZATION 直方图均衡化
%I 读入图像 I_out 均衡化后图像 N_out 均衡化后的直方图
[height,width] = size(I);

N = imhist(I);
P = N./length(I(:));

for i = 1:length(P)
    Sp(i) = sum(P(1:i));
end

Spn = uint8((256-1).*Sp);
I_out = uint8(zeros(height,width));
for i = 1:height
    for j = 1:width
        I_out(i,j) = Spn(I(i,j)+1); % 通过Spn映射表对灰度值进行改变
    end
end

N_out = imhist(I_out);
end

