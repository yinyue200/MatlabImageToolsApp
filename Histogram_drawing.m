function g = Histogram_drawing(f)
%Histogram_drawing 直方图绘制
%f为输入图像 g为输出直方图，注意输出g的方式是bar(g)
g = imhist(f);
end

