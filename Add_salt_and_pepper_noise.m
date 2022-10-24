function g = Add_salt_and_pepper_noise(f)
%ADD_SALT_AND_PEPPER_NOISE 添加椒盐噪声
%f为输入图像 g为噪声图像
g = imnoise(f,'salt & pepper');
end

