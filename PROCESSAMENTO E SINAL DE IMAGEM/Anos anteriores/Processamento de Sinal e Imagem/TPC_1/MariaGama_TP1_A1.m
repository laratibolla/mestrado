%Imagem simulada de tabuleiro de xadrez - 1

%Criado por Maria Gama a 28/02/2021

P=zeros(64); %pretos
B=255*ones(64); %brancos
PB=[P B; B P];
X2=[PB PB; PB PB];
X=[ X2 X2; X2 X2];
X8=uint8(X);
subplot(1,3,1)
imshow(X8) %tabuleiro simples (8x8)
title("Versão simples")

%iluminação
vl=1:512; %vetor linha
vc=ones(512,1); %vetor coluna
ILa=mat2gray(vc*vl); %,matriz com a gradação das cores de 0 a 1

IL=0.9-0.7*ILa; %para variar de entre 0.9 e 0.2, da esq para a dir
subplot(1,3,2)
imshow(IL)
title("iluminação")

XF=X.*IL;
XF8=uint8(XF);
subplot(1,3,3)
imshow(XF8)
title("Versão com iluminação")