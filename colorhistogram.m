function colorhistogram(plotto,image)
    if(ifcolorimage(image))
        %Split into RGB Channels
        Red = image(:,:,1);
        Green = image(:,:,2);
        Blue = image(:,:,3);
        %Get histValues for each channel
        [yRed, x] = imhist(Red);
        [yGreen, x] = imhist(Green);
        [yBlue, x] = imhist(Blue);
        %Plot them together in one plot
        plot(plotto,x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');
    else
        histogram(plotto,image);
    end
end

