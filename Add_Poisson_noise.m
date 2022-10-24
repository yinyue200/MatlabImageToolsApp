function g = Add_Poisson_noise(f)
%ADD_POISSON_NOISE 添加泊松噪声
%f为输入图像 g为噪声图像
g= imnoise(f,'poisson');
end

