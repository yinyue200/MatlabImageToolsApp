function g = Gray_level_transformation(f)
%Gray_level_transformation 灰度变换函数
%f为读入图像 g为灰度变换后的图像
g = imadjust(f,stretchlim(f),[]);
end

