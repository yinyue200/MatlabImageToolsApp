function ffts = DFT(f)
%DFT 二维离散傅里叶变换
%f 输入图像 fft对输入图像进行傅里叶变换结果 
%ffts 将变换的频谱原点移动到频率矩形的中心。
%展现格式 imshow(fft,[])  imshow(ffts,[])
fft = fft2(f);
fft = abs(fft);
ffts = fftshift(fft);
end

