function [BER] = caos_1d_gama(Npontos,gama,m, mestre1)

%Mapa de caos 1D quadrático

%Valores para teste

% clear all; close all;
% Npontos = 200;
% gama = 0.5;

%Valores iniciais
mestre = zeros(1,Npontos);
mestre(:,1) = mestre1;
s = zeros(1,Npontos);

%Mestre
    s(1)=(1-gama)*mestre(1,1)+gama*m(1);
    for n = 1:Npontos-1,
        %s(n) = sinal caótico transmitido
        %mestre
        mestre(1,n+1) = -2*(s(n)^2)+1;
        s(n+1)=(1-gama)*mestre(1,n+1)+gama*m(n+1);
    end    
   
%Calculo BER - Limiar em zero      
mr=sign(s);
BER=(sum(abs(mr-m))/2)/(length(mr));






    
