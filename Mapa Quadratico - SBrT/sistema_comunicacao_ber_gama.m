%Sistema de comunicação

clear all; close all;
fclose('all');
clc;

MaxEb_No = 100;
Npontos = 10000000;

EbNo_db = linspace(-5,200,100);
EbNo = 10.^(EbNo_db/10);

Pb_caos1d_gama_1 = zeros(1,length(EbNo_db));
Pb_caos1d_gama_2 = zeros(1,length(EbNo_db));
Pb_caos1d_gama_3 = zeros(1,length(EbNo_db));
Pb_caos1d_gama_4 = zeros(1,length(EbNo_db));
Pb_caos1d_gama_5 = zeros(1,length(EbNo_db));
Pb_caos1d_gama_6 = zeros(1,length(EbNo_db));
Pb_caos1d_gama_7 = zeros(1,length(EbNo_db));
Pb_caos1d_gama_8 = zeros(1,length(EbNo_db));
Pb_psk = zeros(1,length(EbNo_db));


% Cálculo do BER
transitorio = 200;

for n = 1:length(EbNo_db),
    str = sprintf('%d de %d', n, length(EbNo_db));
    disp(str);
    Pb_caos1d_gama_1(n) = caos_1d_gama(EbNo(n),Npontos,transitorio,0.001);
    Pb_caos1d_gama_2(n) = caos_1d_gama(EbNo(n),Npontos,transitorio,0.01);
    Pb_caos1d_gama_3(n) = caos_1d_gama(EbNo(n),Npontos,transitorio,0.1);
    Pb_caos1d_gama_4(n) = caos_1d_gama(EbNo(n),Npontos,transitorio,0.2);
    Pb_caos1d_gama_5(n) = caos_1d_gama(EbNo(n),Npontos,transitorio,0.4);
    Pb_caos1d_gama_6(n) = caos_1d_gama(EbNo(n),Npontos,transitorio,0.5);
    Pb_caos1d_gama_7(n) = caos_1d_gama(EbNo(n),Npontos,transitorio,0.7);
    Pb_caos1d_gama_8(n) = caos_1d_gama(EbNo(n),Npontos,transitorio,0.9);
end

%PSK Teórico

PSK_teorico = 0.5*erfc(sqrt(EbNo));

%GRÁFICO
semilogy(EbNo_db,Pb_caos1d_gama_1,'m',EbNo_db,Pb_caos1d_gama_2,'m',EbNo_db,Pb_caos1d_gama_3,'m',EbNo_db,Pb_caos1d_gama_4,'m',EbNo_db,Pb_caos1d_gama_5,'m',EbNo_db,Pb_caos1d_gama_6,'m',EbNo_db,Pb_caos1d_gama_7,'m',EbNo_db,Pb_caos1d_gama_8,'m',EbNo_db,PSK_teorico,'g')
legend('\gamma = 0.001','\gamma = 0.01','\gamma = 0.1','\gamma = 0.2','\gamma = 0.4','\gamma = 0.5','\gamma = 0.7','\gamma = 0.9','Sem caos');

grid on;	
ylabel('BER');
xlabel('SNR');
axis([-5 100 1e-6 0.7]);
save dadosBER_Gama_1d;

