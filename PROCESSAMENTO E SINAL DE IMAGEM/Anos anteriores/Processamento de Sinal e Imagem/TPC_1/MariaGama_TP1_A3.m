%Imagem simulada de tabuleiro de xadrez - 3

%Criado por Maria Gama a 05/03/2021

function [XF8]=MariaGama_TP1_A3(N,Imax,Imin,ILang,graf)
a=round(N/8);
P=zeros(a); %pretos
B=255*ones(a); %brancos
PB=[P B; B P];
X2=[PB PB; PB PB];
X=[ X2 X2; X2 X2];
X8=uint8(X);

%iluminação
vl=1:(a*8); %vetor linha
vc=ones(a*8,1); %vetor coluna
ILa=mat2gray(vc*vl); %,matriz com a gradação das cores de 0 a 1

IL=Imax-(Imax-Imin)*ILa; %para variar de entre o valor max e min, da esq para a dir

ILb=transpose(ILa); %linhas iguais
ILang=deg2rad(ILang);
ILc=cos(ILang)*ILa+sin(ILang)*ILb;

Xangulo=ILc.*X;
Xangulo=uint8(Xangulo);

if graf==1
subplot(1,2,1)
imshow(X8)
title("Versão simples")
subplot(1,2,2)
imshow(Xangulo)
title("versão com iluminação a "+rad2deg(ILang)+" graus")

end

end
