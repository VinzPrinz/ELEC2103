BER = [ 0 0 0 0 0 0 0 0 0.0988 0.2968 0.4912 0.4884 0.496];
deltaf = [1 1.2 1.4 1.8 2 2.2 2.4 2.5 2.53 2.535 2.537 2.55 2.6];

figure; hold on;
title('frequency offset vs BER');
xlabel('frequency offset (kHz)');
ylabel('BER');
plot(deltaf , BER , 'LineWidth' , 3);

hold off
