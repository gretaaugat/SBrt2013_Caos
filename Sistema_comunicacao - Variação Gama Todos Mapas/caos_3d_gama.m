function [BER] = caos_3d_gama(EbNo,Npontos,transitorio,gama,m)

%Mapa Henon 3D - Soma

%Valores para teste
% % 
% clear all; close all;
% EbN0dB = 10;
% EbNo = 10^(EbN0dB/10);
% Npontos = 1000000;
% transitorio = 200;
% m = sign(randn(1,Npontos));
% gama = 0.35;

%Valores constantes
a = 1.07;
b = 0.3;

mestre = zeros(3,Npontos);
escravo = zeros(3,Npontos);
mestre(1,1) = ((rand(1,1)*2)-1);
mestre(2,1) = ((rand(1,1)*2)-1);
mestre(3,1) = ((rand(1,1)*2)-1);
escravo(1,1) = ((rand(1,1)*2)-1);
escravo(2,1) = ((rand(1,1)*2)-1);
escravo(3,1) = ((rand(1,1)*2)-1);


s = zeros(1,Npontos);

%Mestre

s(1)=(1-gama)*mestre(1,1)+gama*m(1);
for n = 1:Npontos-1,
    %mestre
    mestre(1,n+1) = -a*s(n)^2+mestre(3,n)+1;
    mestre(2,n+1) = -b*mestre(1,n);
    mestre(3,n+1) = b*mestre(1,n)+mestre(2,n);
    %s(n) = sinal ca�tico transmitido
    s(n+1)=(1-gama)*mestre(1,n+1)+gama*m(n+1);
end

%CANAL
Potsinal = mean(s.^2);
No = Potsinal/EbNo;
% e = ru�do
e = sqrt(No/2)*randn(1,Npontos);
%r(n) = sinal ca�tico recebido
r = s + e;

% ESCRAVO
for n = 1:Npontos-1,
    escravo(1,n+1) = -a*r(n)^2+escravo(3,n)+1;
    escravo(2,n+1) = -b*escravo(1,n);
    escravo(3,n+1) = b*escravo(1,n)+escravo(2,n);
end

%mr(n) = mensagem recuperada
mr = sign((r - (1-gama).*escravo(1,:))/gama);

%C�lculo da BER
BER=(sum(abs(m(transitorio+1:end)-mr(transitorio+1:end)))/2)/(Npontos-transitorio);








    
