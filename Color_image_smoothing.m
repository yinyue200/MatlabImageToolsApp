function imOut = Color_image_smoothing(imIn,type,filtersize)
            %   此函数为对彩色图像平滑处理的函数，imIN为要处理的图像,type为取值为rgb或hsi,filtersize为滤波器的大小
            % type=='rgb'时使用rgb自己的分量处理
            % type=='hsi'时使用hsi单独分量进行处理
            %type默认为rgb，filtersize默认为2
            if nargin==1
                error('please input photo');
            %elseif nargin == 2
            %   type = 'rgb';
            %  filtersize = 2;
            %elseif nargin == 2
            %   filtersize = 2;
            end
            sub=filtersize*filtersize;
            if type == "rgb"
                im_R = imIn(:,:,1);
                im_G = imIn(:,:,2);
                im_B = imIn(:,:,3);
                h = ones(filtersize,filtersize);
                im_R = imfilter(im_R,h,'replicate')./sub;
                im_G = imfilter(im_G,h,'replicate')./sub;
                im_B = imfilter(im_B,h,'replicate')./sub;
                imOut = cat(3,im_R,im_G,im_B);
            else 
                h = ones(filtersize,filtersize);
                imHSI = rgb2hsi(imIn);
                imHSI_I = imfilter(imHSI(:,:,3),h,'replicate')./sub;
                imtemp_hsi = cat(3,imHSI(:,:,1),imHSI(:,:,2),imHSI_I);
                imOut = hsi2rgb(imtemp_hsi);
            end              
        end