%API TP2 Ex.G
%Lara Tibolla Chaves    Entrega: 14/03/2024

% Segmentação por Thresholding Local 

function LaraChaves_TP2_G(imagem, S, GRAF)
imgOriginal=imread(imagem);
[NL,NC,NB]=size(imgOriginal);
imgCinza=imgOriginal;
if NB==3 %caso IM seja uma imagem de cor, converte para tons de cinzento
    imgCinza=rgb2gray(imgOriginal);
end

% Global
TOtsu = graythresh(imgCinza); %calcula o valor T mas numa escala de 0-1
IBG = imbinarize(imgCinza,TOtsu);
Otsu= uint8(255*TOtsu);
NCb = round(NC/S);
NLb = round(NL/S);
PC = 1:NCb:(S-1)*NCb+1; %primeira coluna
UC = [NCb:NCb:(S-1)*NCb NC]; %ultima coluna 
PL = 1:NLb:(S-1)*NLb+1; %primeira linha
UL = [NLb:NLb:(S-1)*NLb NL]; %ultima linha
BI=[];
IBL=[];

for L=1:S   
    for C=1:S
        SUB=imgCinza(PL(L):UL(L),PC(C):UC(C));
     if (std2(SUB)<10) % atribui um valor de referencia. Caso a imagem seja homogenea 
         if (mean2(SUB)>(TOtsu*255))
             SUB=ones(size(SUB,1),size(SUB,2)); % se a media for maior que o valor OTsu atribuimos o valor 1
             OtsuSUB=graythresh(SUB);
         else
             SUB=zeros(size(SUB,1),size(SUB,2)); % se a media for menor que o valor OTsu atribuimos o valor 0
             OtsuSUB=graythresh(SUB);
         end
     else % caso a imagem não seja homogenea - fazemos o metodo de otsu
         OtsuSUB=graythresh(SUB);
     end
         binaria=imbinarize(SUB, OtsuSUB);
         BI=[BI,binaria]; %junta as imagens na horizontal
                     
     end
       IBL=cat(1,IBL,BI); %concatena todas as linhas formando a imagem final IBL
       BI=[]; %coloca  alista vazia para poder voltar ao inico do ciclo
end
if GRAF==1
    subplot(1,3,1), imshow(imgCinza), title("tons de cinzento")
    subplot(1,3,2), imshow(IBG), title("Tresholding Global")
    subplot(1,3,3), imshow(IBL), title("Tresholding Local")
end

end