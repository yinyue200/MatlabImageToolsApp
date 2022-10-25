function g = Inverse_filtered_image(f,Len,Theta,D0)
%INVERSE_FILTERED_IMAGE 逆滤波图像
%f为退化后的输入图像 g为处理后的图像
%%
Len = 25;
Theta = 11;
psf = fspecial('motion',Len,Theta);
[M,N] = size(f);
center1 = floor(M/2);
center2 = floor(N/2);
H = fft2(psf,M,N);
Hs=log(abs(H)+1);
pic_outf = fft2(f);
recover_pic = zeros(M,N);
for i = 1:M
    for j = 1:N
        d = sqrt((i - center1).^2+(j - center2).^2);
       if(d > D0)
            recover_pic(i,j) = pic_outf(i,j)/H(i,j); 
       end
    end
end
%recover_pic = pic_outf./H; 
recover_pic_out = real(ifft2(fftshift(recover_pic)));
g=im2uint8(mat2gray(recover_pic_out));
end

