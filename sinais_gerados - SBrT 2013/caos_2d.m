function [sinal] = caos_2d(Npontos,m,gama)

%Mapa de caos 2D - Soma

%Valores constantes
a = 1.4;
b = 0.3;

mestre = zeros(2,Npontos);
mestre(:,1) = 0;
s = zeros(1,Npontos);

%Mestre
    s(1)=(1-gama)*mestre(1,1)+gama*m(1);
    for n = 1:Npontos-1,
        %mestre
        mestre(1,n+1) = 1-a*s(n)^2+mestre(2,n);
        mestre(2,n+1) = b*mestre(1,n);
        %s(n) = sinal caótico transmitido
        s(n+1)=(1-gama)*mestre(1,n+1)+gama*m(n+1);
    end
sinal =s;    









    
