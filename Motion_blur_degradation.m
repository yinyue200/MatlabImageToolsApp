function g = Motion_blur_degradation(f)
%MOTION_BLUR_DEGRADATION 运动模糊退化
%f为输入图像 g为退化图像
Len = 25;
Theta = 11;
psf = fspecial('motion',Len,Theta);
g = imfilter(f,psf,'circular','conv');
end

