function [T] = Otsu(H,total)
% H = image histogram
% toral = number of pixel in image w*h
sum = 0;
for i = 1:256
    sum = sum + (i * H(i));  %here H(i) denotes the pixel intensity.so H(1)=100,H(2)=200.....H(256)=50
end
sumB = 0;
wB = 0;
wF = 0;
mB = 0;
mF = 0;
max = 0;
between = 0;
threshold1 = 0;
threshold2 = 0;
for i = 1:256
    wB = wB + H(i);  %after all the 256 iteration wB will be equal to the total number of pixel
    if (wB == 0)
        continue;
    end
    wF = total - wB;  %since wB is increasing with each iteration after 256 iteration wf will be zero
    if (wF == 0)
        break;
    end
    sumB = sumB + (i * H(i));
    mB = sumB / wB;  % sumB/wB gives us an average value for each pixel value
    mF = (sum - sumB) / wF; %this also find out average in different way.
    between = wB * wF * (mB - mF)^2;  % between is denotes the variance
    if ( between >= max )
        threshold1 = i;
        if ( between > max )
            threshold2 = i;
        end
        max = between;
    end
end
T = ( threshold1 + threshold2 ) / 2;


