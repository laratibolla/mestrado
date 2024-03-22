% %API TP3 Ex.A1
%Lara Tibolla Chaves    Entrega: 08/04/2024

% Imagem binaria com objetos de interesse

function [IBf]= LaraChaves_TP3_A1(imagem, graf)

imgOriginal=imread(imagem);
[NL,NC,NB]=size(imgOriginal);
imgCinza=imgOriginal;

if NB==3 %caso IM seja uma imagem de cor, converte para tons de cinzento
    imgCinza=rgb2gray(imgOriginal);
end
%segmentação pelo metod Otsu
TOtsu = graythresh(imgCinza); %calcula o valor T mas numa escala de 0-1
imgBinaria = imbinarize(imgCinza,TOtsu); 
Otsu=uint8(255*TOtsu);   % 8-bits [0,255]

imgBC=1-imgBinaria;

%criterio de decisão
x=size(imgBinaria);
linhas=x(1);
colunas=x(2);
linhacentral=round(linhas/2);
colunacentral=round(colunas/2);

LinhaDireita=round(linhacentral+0.25*linhas); %imagem central a 50%
LinhaEsquerda=round(linhacentral-0.25*linhas);
ColunaCima=round(colunacentral+0.25*colunas);
ColunaBaixo=round(colunacentral-0.25*colunas);

subImagem=imgBinaria(LinhaEsquerda:LinhaDireita,ColunaBaixo:ColunaCima,:); %imagem central
Pixgray= sum(sum(imgCinza>TOtsu*255));
Pix_centro= sum(sum(subImagem>TOtsu*255)); %somatorio dos valores superiores ao Otsu (brancos)
Pix = round(Pixgray - Pix_centro) ;

%percentagem de pixeis nas imagens ;
P1=round(Pix_centro/100) ;
P2=round(Pix/100) ;

% a imagem de referencia (preta), está situada no centro
    if P1 < P2 % se P1 for menor significa que não há brancos no centro (só pretos), logo substitui-se pela imagem complementar
       IBf=imgBC;
    elseif P1 > P2 
       IBf=imgBinaria;
    end

if graf==1
    subplot(2,2,1), imshow(imgOriginal), title("Original")
    subplot(2,2,2), imshow(imgCinza), title("Imagem Cinza")
    subplot(2,2,3), imshow(imgBinaria), title("Binaria original Otsu. T = "+Otsu)
    subplot(2,2,4), imshow(IBf), title("Binaria complementar")
end
end
