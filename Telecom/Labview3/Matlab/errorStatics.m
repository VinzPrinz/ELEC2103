close all;
N = 2:2:20;

% pour 0.34Ts
errorMax34 = [0.0256 0.0081 0.00044 0.001229 0.0016 0.000044 0.000294 0.000759 0.000044 0.0001];
errorEarly34 = [0.04648 0.02112 0.018802 0.068621 0.060816 0.066232 0.062347 0.06393 0.06478 0.062807];

figure; hold on;
title('Error static for tau_d=0.34T_s');
xlabel('Oversampling factor');
ylabel('log10(Error static)');
plot(N , log10(errorMax34)  , N , log10(errorEarly34));
legend('Max Energy' , 'Early gate');
hold off;


% pour 0.25Ts
errorMax25 = [0.0625 0.00001 0.006944 0.00001 0.0025 0.00001 0.001276 0.00001 0.000772 0.00001];
errorEarly25 = [0.0625 0.065687 0.04022 0.043 0.03898 0.04025 0.035541 0.034805 0.035185 0.034495];

figure; hold on;
title('Error static for tau_d=0.25T_s');
xlabel('Oversamplng factor');
ylabel('log10(Error static');
plot(N , log10(errorMax25) , N , log10(errorEarly25));
legend('Max Energy' , 'Early gate');
hold off;

% explication des resultats

T = 20;
tau = 0.34*T;
N10 = 8;
N12 = 12;
x = linspace(0 , T , 1000);
sinc = sin(x)./x;
sincDelay = sin((x-tau))./(x-tau);

k10 = linspace(0 , T-(T/N10) , N10);
D10 = sin((k10-tau))./(k10-tau);
k12 = linspace(0 , T-(T/N12) , N12);
D12 = sin((k12-tau))./(k12-tau);

figure; hold on;
title('Expected signal and recieved signal for tau_d=0.34T_s');
xlabel('time');
ylabel('Signals');
plot(x , sinc , x , sincDelay , k10 , D10 , 'O' , k12 , D12 , 'O');
legend('Expected signal', 'Recieved signal' , 'samples N=8' , 'samples N=12');
hold off;

% graphe pour maximum energy

T = 20;
tau = 0.34*T;
NSymbols = 3;
M = 7;
SamplesTimes = 0:(T/M):((NSymbols-1)*T);
x = linspace(0, NSymbols*T , 1000*NSymbols); 
figure; hold on;
plot(x , zeros(1000*NSymbols));
for i = 0:(NSymbols-1)
    plot(x , sin(pi*(x-tau-i*T))./(pi*(x-tau-i*T)) , 'b');
    %plot(x , sin(pi*(x-i*T))./(pi*(x-i*T)) , 'g');
end

plot(SamplesTimes, 0.5 , 'o');


hold off;
