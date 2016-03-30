%Before runing this, the array image must contain an image (of size width x height)
index = 1;
image16b = [];
image16b2 = [];
width = 20;
height = 20;
for i=1:width
    for j=1:height
    r = image(j,i,1);
    g = image(j,i,2);
    b = image(j,i,3);
    rcrop = r/8;
    gcrop = g/4;
    bcrop = b/8;
    %avoid overflow
    if(rcrop == 2^5)
        rcrop = rcrop-1;
    end
    if(gcrop == 2^6)
        gcrop = gcrop-1;
    end
    if(bcrop == 2^5)
        bcrop = bcrop-1;
    end
    rs = dec2bin(rcrop,5);
    gs = dec2bin(gcrop,6);
    bs = dec2bin(bcrop,5);
    resultS = [rs gs bs];
    image16b(index) = bin2dec(resultS);
    temp = num2str(image16b(index));
    disp(temp);
    index = index+1;
    end
end
%grasstexture16b2 = uint16(grasstexture16b);

