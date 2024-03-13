IM=imread('Robot_BW.tif');
imshow(IM)

%% 
vl=1:100;
vc=ones(100,1);
% ficamos com uma mtirz 10x10
M=vc*vl;
imshow(M); %cria uma imagem sintetica toda branca
% isto acontece porque temos os valores em double. temos de passar para
% uint8
% agora já temos tonalidade de 0 até 100 (escuros)
%se for int8 temos tons claros

M2=mat2gray(M) % muda a escala do M para o range de 0 a 1
% o 1 passa a 0 e o 100 passa a 1

% na imagem do robt se a imagem já usar o range todo ( de 0 a 255) o
% mat2gray não muda nada

%% ex1 - tpc

%criado por em 26/02
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
vc=ones(512,1); 
ILa=mat2gray(vc*vl); %,matriz com a gradação das cores de 0 a 1
% mas queremos 0,2 na esquerda e 0.9 na direita

IL=0.9-0.7*ILa; %para variar de 0.9 a 0.2 esq para dir
subplot(1,3,2)
imshow(IL)
title("iluminação")

XF=X.*IL;
XF8=uint8(XF);
subplot(1,3,3)
imshow(XF8)
title("versão com iluminação")

aux1= (255-X)/255*100; %os pretos ficam a 
imshow(uint8(aux1))
aux2=uint8(aux1)+XF8;
imshow(aux2)