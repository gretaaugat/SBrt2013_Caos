%Sistema de comunicação

clear all; close all;
fclose('all');
clc;

Ngama = 100;
gama = linspace(0,1,Ngama);
Npontos = 1000000;
mestre1 = ((rand(1,1)*2)-1);
mestre2 = ((rand(1,1)*2)-1);
mestre3 = ((rand(1,1)*2)-1);

BER_gama = zeros(1,Ngama);
BER_gamat = zeros(1,Ngama);
BER_gama2 = zeros(1,Ngama);
BER_gama3 = zeros(1,Ngama);

%m(n) = mensagem
m = sign(randn(1,Npontos));

for n = 1:Ngama,
    str = sprintf('%d de %d', n, Ngama);
    disp(str);
    BER_gama(n) = caos_1d_gama(Npontos,gama(n),m,mestre1);
    BER_gamat(n) = caos_tenda_gama(Npontos,gama(n),m,mestre1);
    BER_gama2(n) = caos_2d_gama(Npontos,gama(n),m,mestre1,mestre2);
    BER_gama3(n) = caos_3d_gama(Npontos,gama(n),m,mestre1,mestre2,mestre3);
%     while isnan(BER_gama3(n))==1
%         mestre1 = 0;
%         mestre2 = 0;
%         mestre3 = 0;
%         valor = caos_3d_gama(Npontos,gama(n),m,mestre1,mestre2,mestre3);
%     end
end;

%GRÁFICO
plot(gama,BER_gama,'b',gama,BER_gamat,'k',gama,BER_gama2,'m',gama,BER_gama3,'g')
grid on;
legend('Quadrático c^{(1)}','Tenda inclinada c^{(1)}','Hénon 2D c^{(1)}', 'Hénon 3D c^{(1)}')
ylabel('BER');
xlabel('\gamma');
axis([0 1 0 0.8]);
