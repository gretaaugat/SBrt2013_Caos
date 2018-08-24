function [BER] = caos_2d_gama(EbNo, Npontos,transitorio,gama,m)

%Mapa de caos 2D - Soma

%Valores para teste

% clear all; close all;
% EbN0dB = inf;
% EbNo = 10^(EbN0dB/10);
% Npontos = 200;
% transitorio = 0;
% gama=0.001;

%Valores constantes
a = 1.4;
b = 0.3;

mestre = zeros(2,Npontos);
escravo = zeros(2,Npontos);
mestre(1,1) = ((rand(1,1)*2)-1);
mestre(2,1) = ((rand(1,1)*2)-1);
escravo(1,1) = ((rand(1,1)*2)-1);
escravo(2,1) = ((rand(1,1)*2)-1);
s = zeros(1,Npontos);

%Mestre
    %s(1) = mestre(1,1)+0.001*m(1);
    s(1)=(1-gama)*mestre(1,1)+gama*m(1);
    for n = 1:Npontos-1,
        %mestre
        mestre(1,n+1) = 1-a*s(n)^2+mestre(2,n);
        mestre(2,n+1) = b*mestre(1,n);
        s(n+1)=(1-gama)*mestre(1,n+1)+gama*m(n+1);
    end

%CANAL
    Potsinal = mean(s.^2);
    No = Potsinal/EbNo;
    % e = ruído
    e = sqrt(No/2)*randn(1,Npontos);
    %r(n) = sinal caótico recebido
    r = s + e;
     
% ESCRAVO
    
    for n = 1:Npontos-1,     
        escravo(1,n+1) = 1-a*r(n)^2+escravo(2,n);
        escravo(2,n+1) = b*escravo(1,n);
    end
%mr(n) = mensagem recuperada
    mr = sign((r - (1-gama).*escravo(1,:))/gama);
  
%Cálculo da BER
BER=(sum(abs(m(transitorio+1:end)-mr(transitorio+1:end)))/2)/(Npontos-transitorio);









    
