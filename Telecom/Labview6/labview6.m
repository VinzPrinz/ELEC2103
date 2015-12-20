f1024 = [ 0 20 50 100 150 200 250]
f64 = [250 300 400 500]

BER1024 = [1E-3  1E-3 1E-3 1E-3 0.076 0.2156 0.3]
BER64 = [1E-3 0.0045 0.065544 0.1458]

figure; hold on;
title('Frequency offset vs BER')
plot(f1024 , log10(BER1024) , f64 , log10(BER64) , 'LineWidth' , 3);
legend('N=1024' , 'N=64');
xlabel('frequency');
ylabel('log10(BER)');
hold off;