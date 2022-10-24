        function imOut = rgbEdgeDetection(im)
        if(ifcolorimage(im))
            Instance_R = im(:, :, 1);
            Instance_G = im(:, :, 2);
            Instance_B = im(:, :, 3);
            Edge_R = edge(Instance_R, 'log');
            Edge_G = edge(Instance_G, 'log');
            Edge_B = edge(Instance_B, 'log');
            imOut = im2uint8(cat(3, Edge_R, Edge_G, Edge_B));
        else
            imOut=im2uint8(edge(im,'log'));
        end
        end