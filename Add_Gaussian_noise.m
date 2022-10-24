function g = Add_Gaussian_noise(f)
%Add_Gaussian_noise 添加高斯噪声
%f为输入图像 g为噪声图像
g = imnoise(f,'gaussian',0,0.05);
end

