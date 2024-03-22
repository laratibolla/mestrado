%API TP2 Ex.F
%Lara Tibolla Chaves    Entrega: 14/03/2024

% Segmentação por Thresholding Global

function LaraChaves_TP2_F(imagem)

IM=imread(imagem);
[NL,NC,NB]=size(IM)
IC=IM;

if NB==3 %caso IM seja uma imagem de cor, converte para tons de cinzento
    IC=rgb2gray(IM);
end
subplot(2,2,1), imshow(IC), title("tons de cinzento")
subplot(2,2,2), imhist(IC), title("histograma IC")

%segmentação pelo metod Otsu
TOtsu = graythresh(IC); %calcula o valor T mas numa escala de 0-1
IBO = imbinarize(IC,TOtsu); 
Otsu=uint8(255*TOtsu);   % 8-bits [0,255]
subplot(2,2,3), imshow(IBO), title("Binaria Otsu. T = "+Otsu)

%segmentação com o valor da mediana
med = median(IC(:)); %8 bits [0,255]
Tmed = double(med)/255; %double [0,1]
IBM = imbinarize(IC,Tmed); 
subplot(2,2,4), imshow(IBM), title("Binaria mediana. T = "+med)


end