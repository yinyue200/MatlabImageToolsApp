function hsi=rgb2hsi(rgb)
%hsi=rgd2hsi(rgb)把一幅RGB图像转换为HSI图像
%输入图像是大小为M*N*3的三维图像平面，分别对应彩色图像中的红，绿，蓝三个分量
%如果RGB的分量是均衡的，那么HSI就是未定义的。
%输入的类型可以是double(取值范围是[0，1])，uint8或uint16。

%在以下情况下，输出图像类型是double,
%hsi(:,:,1)是色度分量，它的范围是除以2*pi后在[0,1]内
%hsi(:,:,2)是饱和度分量，它的范围是在[0,1]内
%hsi(:,:,3)是亮度分量，它的范围是在[0,1]内
            
%提取图像的各个分量
rgb=im2double(rgb);%把rgb转化为双精度浮点类型
r=rgb(:,:,1);%获取图像第一个分量
g=rgb(:,:,2);%获取图像第二个分量
b=rgb(:,:,3);%获取图像第三个分量
%执行转换方程
num=0.5*((r-g)+(r-b));
den=sqrt((r-g).^2+(r-b).*(g-b));
theta=acos(num./(den+eps));%eps防止除数为0
            
H=theta;
H(b>g)=2*pi-H(b>g);
H=H/(2*pi);
            
num=min(min(r,g),b);
den=r+g+b;
den(den==0)=eps;%eps防止除数为0
S=1-3.*num./den;
            
H(S==0)=0;
tempI=(r+g+b)/3;
%将3个分量联合成为一个HSI图像
hsi=cat(3,H,S,tempI);
end

