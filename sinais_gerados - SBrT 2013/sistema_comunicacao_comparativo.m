%Sistema de comunicação

clear all; close all;
fclose('all');
clc;

Npontos = 100000;
gama = 0.4;

s_caostenda = zeros(1,Npontos);
s_caos3d = zeros(1,Npontos);
s_caos2d = zeros(1,Npontos);
s_caos1d = zeros(1,Npontos);

m = sign(randn(1,Npontos));

s_caos1d = caos_1d(Npontos,m,gama);
s_caostenda = caos_tenda(Npontos,m,gama);
s_caos2d = caos_2d(Npontos,m,gama);
s_caos3d = caos_3d(Npontos,m,gama);


%GRÁFICOS
%Escala - tempo
    tempo = 0:Npontos-1;    
% Mensagem
    subplot(5,1,1);
    plot(tempo,m,'k.');
    grid on; 
    ylabel('\fontsize{14}(a) m(n)');
    axis([0 200 -1.5 1.5]);    

% s_caos1d
    subplot(5,1,2);
    plot(tempo,s_caos1d,'b','linewidth',2);
    grid on;
    ylabel('\fontsize{14}(b) s_Q(n)');
    axis([0 200 -1.5 1.5]);
    
%s_caostenda
    subplot(5,1,3);
    plot(tempo,s_caostenda,'g','linewidth',2);
    grid on;
    ylabel('\fontsize{14}(c) s_{TI}(n)');
    axis([0 200 -1.5 1.5]);
    
%s_caos2d
    subplot(5,1,4);
    plot(tempo,s_caos2d,'r','linewidth',2);
    grid on;
    ylabel('\fontsize{14}(d) s_{H2D}(n)');
    axis([0 200 -1.5 1.5]);    
    
%s_caos3d
    subplot(5,1,5);
    plot(tempo,s_caos3d,'m','linewidth',2);
    grid on;
    ylabel('\fontsize{14}(e) s_{H3D}(n)');
    xlabel('n');
    axis([0 200 -1.5 1.5]);  


    
    








    
