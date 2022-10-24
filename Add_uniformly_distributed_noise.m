function g = Add_uniformly_distributed_noise(f)
%ADD_UNIFORMLY_DISTRIBUTED_NOISE 添加均匀分布噪声
%f为输入图像 g为噪声图像
g = imnoise(f,'speckle',0.5); 
end

