K = pi;
x = linspace(0,5, 1000)*K;
y = x-0.3*pi;
X = [0  1  2]*K;
Y = X-0.3*pi;

figure; hold on;
title('Influence of frequency offset');
plot(x , sin(x)./x , 'b', x , sin(y)./y, 'r', ...
            x , sin(x-pi)./(x-pi) , 'b' , x , sin(x-2*pi)./(x-2*pi),'b' , ...
            x , sin(y-pi)./(y-pi) , 'r' , x , sin(y-2*pi)./(y-2*pi),'r' , ...
            'LineWidth' , 3 );
legend('expected signal' , 'signal with frequency offset');
xlabel('frequency');
ylabel('s[m]');
hold off;