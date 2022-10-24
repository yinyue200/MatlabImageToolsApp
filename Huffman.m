function [Out,origin_size,final_size,CR]=Huffman(A);
%Huffman 图像进行huffman编码压缩
%A 输入彩色图像 Out为压缩后图像 
%origin_size 原始图像比特长度
%final_size 编码后比特长度
%CR 计算压缩率
I=rgb2gray(A);
 
[M,N] = size(I);%将图像转为二维矩阵
I1 = I(:);%转为一维向量
P = zeros(1,256);
%获取各符号的概率；
for i = 0:255
    P(i+1) = length(find(I1 == i))/(M*N);
end
 
k = 0:255;
dict = huffmandict(k,P); %根据灰度级k和概率数组P生成Huffman字典
enco = huffmanenco(I1,dict); %哈夫曼编码
deco = huffmandeco(enco,dict); %哈夫曼解码
Ide = col2im(deco,[M,N],[M,N],'distinct'); %把向量重新转换成图像块；
 
%subplot(1,2,1);imshow(I);title('原始图像');
Out = uint8(Ide);
%subplot(1,2,2);imshow(Out);title('解码图像');
 
B=length(enco);%原始图像比特长度
sumcode=length(deco);%编码后比特长度
CR=sumcode/B;%计算压缩率
origin_size = num2str(B);
final_size = num2str(sumcode);
%disp(['原始图像 Bit:          ',origin_size,' bit']);
%disp(['压缩图像 Bit:          ',final_size,' bit']);
%disp(['压缩率:                ',num2str(CR)]);
