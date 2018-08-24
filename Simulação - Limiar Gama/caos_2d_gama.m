function [BER] = caos_2d_gama(Npontos,gama,m, mestre1, mestre2)

%Mapa de caos 2D - Soma

%Valores constantes
a = 1.4;
b = 0.3;

mestre = zeros(1,Npontos);
mestre(1,1) = mestre1;
mestre(2,1) = mestre2;
s = zeros(1,Npontos);

%Mestre
    s(1)=(1-gama)*mestre(1,1)+gama*m(1);
    for n = 1:Npontos-1,
        %mestre
        mestre(1,n+1) = 1-a*s(n)^2+mestre(2,n);
        mestre(2,n+1) = b*mestre(1,n);
        s(n+1)=(1-gama)*mestre(1,n+1)+gama*m(n+1);
    end

%Calculo BER - Limiar em zero      
mr=sign(s);
BER=(sum(abs(mr-m))/2)/(length(mr));







    
