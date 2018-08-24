function [sinal] = caos_1d(Npontos,m,gama)

%Mapa de caos 1D quadrático

%Valores iniciais
mestre = zeros(1,Npontos);
mestre(:,1) = 0;
s = zeros(1,Npontos);

%Mestre
    s(1)=(1-gama)*mestre(1,1)+gama*m(1);
    for n = 1:Npontos-1,
        %mestre
        mestre(1,n+1) = -2*(s(n)^2)+1;
        s(n+1)=(1-gama)*mestre(1,n+1)+gama*m(n+1);
    end    
      
sinal = s;
    







    
