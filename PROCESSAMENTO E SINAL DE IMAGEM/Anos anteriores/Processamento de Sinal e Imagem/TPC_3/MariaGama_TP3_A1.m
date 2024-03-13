%imagem binária com objetos de interesse

%Criado por Maria Gama a 26/03/2021

function [IBf]= MariaGama_TP3_A1(imagem, GRAF)

IM=imread(imagem);
[NL,NC,NB]=size(IM);
IC=IM;

if NB==3 %caso IM seja uma imagem de cor, converte para tons de cinzento
    IC=rgb2gray(IM);
end
%segmentação pelo metod Otsu
TOtsu = graythresh(IC); %calcula o valor T mas numa escala de 0-1
IBo = imbinarize(IC,TOtsu); 
Otsu=uint8(255*TOtsu);   % 8-bits [0,255]

IBc=1-IBo;
%criterio de decisão
a=size(IBo);
linhas=a(1);
colunas=a(2);
linhacentral=round(linhas/2);
colunacentral=round(colunas/2);

LinhaDireita=round(linhacentral+0.25*linhas); %imagem central a 50%
LinhaEsquerda=round(linhacentral-0.25*linhas);
ColunaCima=round(colunacentral+0.25*colunas);
ColunaBaixo=round(colunacentral-0.25*colunas);

subImagem=IBo(LinhaEsquerda:LinhaDireita,ColunaBaixo:ColunaCima,:); %imagem central
Pixgray= sum(sum(IC>TOtsu*255));
Pix_centro= sum(sum(subImagem>TOtsu*255)); %somatorio dos valores superiores ao Otsu (brancos)
Pix = round(Pixgray - Pix_centro) ;

%percentagem de pixeis nas imagens ;
P1=round(Pix_centro/100) ;
P2=round(Pix/100) ;

%a imagem de referencia, que de momento está a preto, está situada no centro
    if P1 < P2 % se P1 for menor significa que não há brancos no centro (só pretos), logo substitui-se pela imagem complementar
       IBf=IBc;
    elseif P1 > P2 
       IBf=IBo;
    end

if GRAF==1
    subplot(2,2,1), imshow(IM), title("imagem original")
    subplot(2,2,2), imshow(IC), title("tons de cinzento")
    subplot(2,2,3), imshow(IBo), title("Binaria original Otsu. T = "+Otsu)
    subplot(2,2,4), imshow(IBf), title("Binaria complementar")
end
end

