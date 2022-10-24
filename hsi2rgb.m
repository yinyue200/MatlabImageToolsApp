function rgb=hsi2rgb(hsi);
%HSI2RGB 把一幅HSI图像转换为RGB图像

%其中HSI是double型
%hsi(:,:,1)是色度分量，它的范围是除以2*pi后在[0,1]内
%hsi(:,:,2)是饱和度分量，它的范围是在[0,1]内
%hsi(:,:,3)是亮度分量，它的范围是在[0,1]内  

%输出图像的分量是
%rgb(:,:,1)为红
%rgb(:,:,2)为绿
%rgb(:,:,3)为蓝
            
%提取HSI的各个分量
hsi=im2double(hsi);%把hsi转化为双精度浮点类型
H=hsi(:,:,1)*2*pi;
S=hsi(:,:,2);
i=hsi(:,:,3);    

%执行变换方程
R=zeros(size(hsi,1),size(hsi,2));
G=zeros(size(hsi,1),size(hsi,2));
B=zeros(size(hsi,1),size(hsi,2));
            
%RG区(0<=H<2*pi/3)
idx=find((0<=H) & (H<2*pi/3));%寻找0<=H<2*pi/3
B(idx)=i(idx).*(1-S(idx));
R(idx)=i(idx).*(1+S(idx).*cos(H(idx))./cos(pi/3-H(idx)));
G(idx)=3*i(idx)-(R(idx)+B(idx));
            
 %BG区(2*pi/3<=H<4*pi/3)
idx=find((2*pi/3<=H) & (H<4*pi/3));%寻找2*pi/3<=H<4*pi/3
R(idx)=i(idx).*(1-S(idx));
G(idx)=i(idx).*(1+S(idx).*cos(H(idx)-2*pi/3)./cos(pi-H(idx)));
B(idx)=3*i(idx)-(R(idx)+G(idx));
            
%BR区(4*pi/3<=H<=2*pi)
idx=find((4*pi/3<=H) & (H<=2*pi));%寻找4*pi/3<=H<=2*pi
G(idx)=i(idx).*(1-S(idx));
B(idx)=i(idx).*(1+S(idx).*cos(H(idx)-4*pi/3)./cos(5*pi/3-H(idx)));
R(idx)=3*i(idx)-(G(idx)+B(idx));
            
%将3个分量联合成为一个RGB图像
rgb=cat(3,R,G,B);
rgb=max(min(rgb,1),0);
end

