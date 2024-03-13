%API TP2 Ex.D
%Lara Tibolla Chaves    Entrega: 14/03/2024

% Extraçao de assinatura de cor

function LaraChaves_TP2_D(imagem)
imgOriginal=imread(imagem);
figure;
subplot(2,4,1), imshow(imgOriginal), title('Original');

a=size(imgOriginal);
linhas=a(1);
colunas=a(2);
linhacentral=round(linhas/2);
colunacentral=round(colunas/2);

linhaDireita=round(linhacentral+linhas/20);
linhaEsquerda=round(linhacentral-linhas/20);
colunaCima=round(colunacentral+colunas/20);
colunaBaixo=round(colunacentral-colunas/20);

subImagem=imgOriginal(linhaEsquerda:linhaDireita,colunaBaixo:colunaCima,:); %imagem central
subplot(2,4,5), imshow(subImagem), title("max, min, media, desvio padrao");

R=subImagem(:,:,1);
G=subImagem(:,:,2);
B=subImagem(:,:,3);

HSV=rgb2hsv(subImagem);
H=HSV(:,:,1);
S=HSV(:,:,2);
V=HSV(:,:,3);

minR= min(min(R)); minG= min(min(G)); minB= min(min(B));
maxR= max(max(R)); maxG= max(max(G)); maxB= max(max(B));
meanR= mean(mean(R)); meanG= mean(mean(G)); meanB= mean(mean(B));
desvioR= std2(double(R));
subplot(2,4,2), imhist(R), title("R: " +maxR+" "+minR+" "+meanR+" "+desvioR);
desvioG= std2(double(G));
subplot(2,4,3), imhist(G), title("G: " +maxG+" "+minG+" "+meanG+" "+desvioG);
desvioB= std2(double(B));
subplot(2,4,4), imhist(B), title("B: " +maxB+" "+minB+" "+meanB+" "+desvioB);
minH= min(min(H)); minS= min(min(S)); minV= min(min(V)); 
maxH= max(max(H)); maxS= max(max(S)); maxV= max(max(V)); 
meanH= mean(mean(H)); meanS= mean(mean(S)); meanV= mean(mean(V));
desvioH= std2(double(H));
subplot(2,4,6), imhist(H), title("H: " +maxH+" "+minH+" "+meanH+" "+desvioH);
desvioS= std2(double(S));
subplot(2,4,7), imhist(S), title("S:. " +maxS+" "+minS+" "+meanS+" "+desvioS);
desvioV= std2(double(V));
subplot(2,4,8), imhist(V), title("V: " +maxV+" "+minV+" "+meanV+" "+desvioV);


end