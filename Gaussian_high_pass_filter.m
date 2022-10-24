function I_r = Gaussian_high_pass_filter(I,D0)
%GAUSSIAN_HIGH_PASS_FILTER 高斯高通滤波器
%I 输入图像 I_r 输出图像
%展现格式 imshow(I_r,[])
FI = fft2(I);
Fc = fftshift(FI);
[M,N] = size(I);
center1 = floor(M/2);
center2 = floor(N/2);
n = 4;
H = zeros(M,N);
for i = 1:M
for j = 1:N
d = sqrt((i- center1).^2+(j-center2).^2);
H(i,j)=1-exp(-( d^2 / (2*D0^2) ) ); 
end
end
%% filtering
Fh = Fc.*H;
I_r = real(ifft2(ifftshift(Fh)));
end

