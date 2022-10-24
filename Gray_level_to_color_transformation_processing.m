function out = Gray_level_to_color_transformation_processing(f)
%GRAY_LEVEL_TO_COLOR_TRANSFORMATION_PROCESSING 灰度级到彩色变换处理
%输入灰度级        输出彩色
% 0～63  1/4         蓝色
% 64～127 2/4        紫色
% 128～191 3/4       黄色
% 192～255  4/4      红色
[row,col]=size(f);
range=255;%每个通道的最大灰度值

R = zeros(row,col);
G = zeros(row,col);
B = zeros(row,col);
for i=1:row
     for j=1:col
        if f(i,j)<=range/4% [0,64]偏蓝
            R(i,j)=0;
            G(i,j)=4*f(i,j);
            B(i,j)=range;
            else if f(i,j)<=range/2% (64,128] 偏紫
                 R(i,j)=0;
                 G(i,j)=range;
                 B(i,j)=-4*f(i,j)+2*range;
                else if f(i,j)<=3*range/4% (128, 192]
                        R(i,j)=4*f(i,j)-2*range;
                        G(i,j)=range;
                        B(i,j)=0;
                     else
                        R(i,j)=range;
                        G(i,j)=4*(range-f(i,j));
                        B(i,j)=0;
                    end
                end
        end
    end
end

out = zeros(row,col);
for i=1:row
    for j=1:col
              out(i,j,1)=R(i,j);
              out(i,j,2)=G(i,j);
              out(i,j,3)=B(i,j);
    end
end

out=out/256;
end

