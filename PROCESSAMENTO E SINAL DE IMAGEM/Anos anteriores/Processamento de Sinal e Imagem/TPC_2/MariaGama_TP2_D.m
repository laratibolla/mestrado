%Extração de assinatura de cor

%Criado por Maria Gama a 13/03/2021

function []= MariaGama_TP2_D(imagem)
IM=imread(imagem);
a=size(IM);
linhas=a(1);
colunas=a(2);
linhacentral=round(linhas/2);
colunacentral=round(colunas/2);

LinhaDireita=round(linhacentral+linhas/20);
LinhaEsquerda=round(linhacentral-linhas/20);
ColunaCima=round(colunacentral+colunas/20);
ColunaBaixo=round(colunacentral-colunas/20);

subImagem=IM(LinhaEsquerda:LinhaDireita,ColunaBaixo:ColunaCima,:); %imagem central

R=subImagem(:,:,1);
G=subImagem(:,:,2);
B=subImagem(:,:,3);

HSV=rgb2hsv(subImagem);
H=HSV(:,:,1);
S=HSV(:,:,2);
V=HSV(:,:,3);

minR= min(min(R));
minG= min(min(G));
minB= min(min(B));
maxR= max(max(R));
maxG= max(max(G));
maxB= max(max(B));
meanR= mean(mean(R));
meanG= mean(mean(G));
meanB= mean(mean(B));
SDR= std2(double(R));
SDG= std2(double(G));
SDB= std2(double(B));
minH= min(min(H));
minS= min(min(S));
minV= min(min(V));
maxH= max(max(H));
maxS= max(max(S));
maxV= max(max(V));
meanH= mean(mean(H));
meanS= mean(mean(S));
meanV= mean(mean(V));
SDH= std2(double(H));
SDS= std2(double(S));
SDV= std2(double(V));

figure(1)
subplot(2,4,1), imshow(IM), title("original")
subplot(2,4,2), imshow(subImagem), title("max, min, media, desvio padrao")
subplot(2,4,3), imshow(R), title("RED " +maxR+" "+minR+" "+meanR+" "+SDR)
subplot(2,4,4), imshow(G), title("GREEN " +maxG+" "+minG+" "+meanG+" "+SDG)
subplot(2,4,5), imshow(B), title("BLUE " +maxB+" "+minB+" "+meanB+" "+SDB)
subplot(2,4,6), imshow(H), title("HUE " +maxH+" "+minH+" "+meanH+" "+SDH)
subplot(2,4,7), imshow(S), title("SATURATION " +maxS+" "+minS+" "+meanS+" "+SDS)
subplot(2,4,8), imshow(V), title("VALUE " +maxV+" "+minV+" "+meanV+" "+SDV)
end