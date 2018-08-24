%Sistema de comunicação

clear all; close all;
fclose('all');
clc;

Npontos = 10000000;
EbNo_db = linspace(-5,200,100);
EbNo = 10.^(EbNo_db/10);

Pb_caostenda = zeros(1,length(EbNo_db));
Pb_caos3d = zeros(1,length(EbNo_db));
Pb_caos2d = zeros(1,length(EbNo_db));
Pb_caos1d = zeros(1,length(EbNo_db));

gama = 0.4;

%m(n) = mensagem
m = sign(randn(1,Npontos));

% Cálculo do BER
transitorio = 200;

for n = 1:length(EbNo_db),
    str = sprintf('%d de %d', n, length(EbNo_db));
    disp(str);
    Pb_caostenda(n) = caos_tenda_gama(EbNo(n),Npontos,transitorio,gama,m);
    Pb_caos1d(n) = caos_1d_gama(EbNo(n),Npontos,transitorio,gama,m);
    Pb_caos2d(n) = caos_2d_gama(EbNo(n),Npontos,transitorio,gama,m);
    Pb_caos3d(n) = caos_3d_gama(EbNo(n),Npontos,transitorio,gama,m);
end

%PSK Teórico

PSK_teorico = 0.5*erfc(sqrt(EbNo));

%GRÁFICO
semilogy(EbNo_db,Pb_caos1d,'b',EbNo_db,Pb_caostenda,'k',EbNo_db,Pb_caos2d,'r',EbNo_db,Pb_caos3d,'m',EbNo_db,PSK_teorico,'g');
grid on;
legend('Quadrático','Tenda inclinada','Hénon 2D','Hénon 3D','Sem caos');
%title('Taxa de erro');
ylabel('BER');
xlabel('SNR_{dB}');
axis([-5 80 1e-6 0.7]);
save dadosBER_0_4;

