function [BER] = caos_1d_gama(EbNo, Npontos,transitorio,gama)

%Mapa de caos 1D quadrático

%Valores para teste

% clear all; close all;
% EbN0dB = 80;
% EbNo = 10^(EbN0dB/10);
% Npontos = 200;
% transitorio = 0;
% toleranciatrans = 1e-5;
% gama = 0.5;

%Valores iniciais
mestre = zeros(1,Npontos);
escravo = zeros(1,Npontos);
mestre(:,1) = rand(1,1);
escravo(:,1) = rand(1,1);
s = zeros(1,Npontos);


%m(n) = mensagem
m = sign(randn(1,Npontos));

%Mestre
    s(1)=(1-gama)*mestre(1,1)+gama*m(1);
    for n = 1:Npontos-1,
        %s(n) = sinal caótico transmitido
        %mestre
        mestre(1,n+1) = -2*(s(n)^2)+1;
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
        escravo(1,n+1) = -2*(r(n)^2)+1;
    end
    
%mr(n) = mensagem recuperada
      mr = sign((r - (1-gama).*escravo(1,:))/gama);
    
%Cálculo da BER
BER=(sum(abs(m(transitorio+1:end)-mr(transitorio+1:end)))/2)/(Npontos-transitorio);






    
