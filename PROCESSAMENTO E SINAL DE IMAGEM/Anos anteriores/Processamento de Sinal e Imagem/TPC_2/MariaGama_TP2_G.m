%Tresholding Local

%Criado por Maria Gama a 20/03/2021
function []= MariaGama_TP2_G(imagem, S, GRAF)
IM=imread(imagem);
[NL,NC,NB]=size(IM);
IC=IM;
if NB==3 %caso IM seja uma imagem de cor, converte para tons de cinzento
    IC=rgb2gray(IM);
end

% Global
TOtsu = graythresh(IC) %calcula o valor T mas numa escala de 0-1
IBG = imbinarize(IC,TOtsu);
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
        SUB=IC(PL(L):UL(L),PC(C):UC(C));
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
    subplot(1,3,1), imshow(IC), title("tons de cinzento")
    subplot(1,3,2), imshow(IBG), title("Tresholding Global")
    subplot(1,3,3), imshow(IBL), title("Tresholding Local")
end

end