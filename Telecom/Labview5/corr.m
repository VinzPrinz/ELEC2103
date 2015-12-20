x = plinspace(0, 10 , 1000);
y = sin(x);
a = y;
b = y;
corrLength=length(a)+length(b)-1;

c=fftshift(ifft(fft(a,corrLength).*conj(fft(b,corrLength))));

plot(0:corrlength , c)