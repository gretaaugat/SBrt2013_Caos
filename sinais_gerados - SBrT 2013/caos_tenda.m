function [sinal] = caos_tenda(Npontos,m,gama)

%Mapa de caos Tenda Inclinada

%Valores iniciais
alpha = 0.1;

s = zeros(1,Npontos);
mestre = zeros(1,Npontos);
mestre(:,1) = 0;

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

sinal = s;


    
