%Imagem simulada de tabuleiro de xadrez - 2

%Criado por Maria Gama a 28/02/2021

function []=MariaGama_TP1_A2(N,Imax,Imin)
a=round(N/8);
P=zeros(a); %pretos
B=255*ones(a); %brancos
PB=[P B; B P];
X2=[PB PB; PB PB];
X=[ X2 X2; X2 X2];
X8=uint8(X);
subplot(1,3,1)
imshow(X8) %tabuleiro simples (8x8)
title("Versão simples")

%iluminação
vl=1:(a*8); %vetor linha
vc=ones(a*8,1); %vetor coluna
ILa=mat2gray(vc*vl); %,matriz com a gradação das cores de 0 a 1

IL=Imax-(Imax-Imin)*ILa; %para variar de entre o valor max e min, da esq para a dir
subplot(1,3,2)
imshow(IL)
title("iluminação")

XF=X.*IL;
XF8=uint8(XF);
subplot(1,3,3)
imshow(XF8)
title("versão com iluminação")
end
