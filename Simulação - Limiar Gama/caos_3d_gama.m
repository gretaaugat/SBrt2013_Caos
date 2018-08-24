function [BER] = caos_3d_gama(Npontos,gama,m, mestre1, mestre2,mestre3)

%Mapa Henon 3D - Soma

%Valores para teste

% clear all; close all;
% Npontos = 100000;
% gama = 0.3;
% mestre1 = rand(1,1);
% mestre2 = rand(1,1);
% mestre3 = rand(1,1);
% m = sign(randn(1,Npontos));

%Valores constantes
a = 1.07;
b = 0.3;

mestre = zeros(1,Npontos);
mestre(1,1) = mestre1;
mestre(2,1) = mestre2;
mestre(3,1) = mestre3;
s = zeros(1,Npontos);

%Mestre
s(1)=(1-gama)*mestre(1,1)+gama*m(1);

for n = 1:Npontos-1,
    %mestre
    mestre(1,n+1) = -a*s(n)^2+mestre(3,n)+1;
    mestre(2,n+1) = -b*mestre(1,n);
    mestre(3,n+1) = b*mestre(1,n)+mestre(2,n);
    %s(n) = sinal caótico transmitido
    s(n+1)=(1-gama)*mestre(1,n+1)+gama*m(n+1);
end

%Calculo BER - Limiar em zero      
mr=sign(s);
BER=(sum(abs(mr-m))/2)/(length(mr));








    
