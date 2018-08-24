function [BER] = caos_tenda_gama(EbNo, Npontos,transitorio,gama,m)

%Mapa de caos Tenda Inclinada

%Valores para teste

% clear all; close all;
% EbN0dB = 20;
% EbNo = 10^(EbN0dB/10);
% Npontos = 10;
% transitorio = 0;
% gama  = 0.35;
% m = sign(randn(1,Npontos));

%Valores iniciais
alpha = 0.1;

s = zeros(1,Npontos);
mestre = zeros(1,Npontos);
escravo = zeros(1,Npontos);
mestre(:,1) = ((rand(1,1)*2)-1);
escravo(:,1) = ((rand(1,1)*2)-1);


%Mestre
s(1)=(1-gama)*mestre(1,1)+gama*m(1);

for n = 1:Npontos-1,
    %s(n) = sinal caótico transmitido
    %mestre
    if (s(n)> -1) && (s(n) < alpha)    
        mestre(1,n+1)=((2/(alpha+1))*s(n))+((1-alpha)/(alpha+1));
    else
        mestre(1,n+1)=((2/(alpha-1))*s(n))-((alpha+1)/(alpha-1));
    end
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
    if (r(n) < alpha)       
        escravo(1,n+1)=((2/(alpha+1))*r(n))+((1-alpha)/(alpha+1));
    else
        escravo(1,n+1)=((2/(alpha-1))*r(n))-((alpha+1)/(alpha-1));
    end
end

%mr(n) = mensagem recuperada
mr = sign((r - (1-gama).*escravo(1,:))/gama);

%Cálculo da BER
BER=(sum(abs(m(transitorio+1:end)-mr(transitorio+1:end)))/2)/(Npontos-transitorio);

    
