function g = Wiener_filtered_image(f)
%WIENER_FILTERED_IMAGE 维纳滤波图像
%f为退化后的输入图像 g为处理后的图像
Len = 25;
Theta = 11;
psf = fspecial('motion',Len,Theta);
g = deconvwnr(f,psf,0.05);
end

