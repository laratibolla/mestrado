%ESPECIFICACAO DO HISTOGRAMA

%Criado por Maria Gama a 03/03/2021

function []=MariaGama_TP1_D(imagem1, imagem2)
IM=imread(imagem1);
REF=imread(imagem2);

figure(1)
subplot(2,1,1)
Hnorm=imhist(REF)./numel(REF); 
IMesp1=histeq(IM,Hnorm);
imshow(IMesp1)
subplot(2,1,2)
imhist(IMesp1)

figure(2)
subplot(2,3,1)
imshow(IM)
title("imagem original")

subplot(2,3,2)
imshow(REF)
title("imagem de referencia")

subplot(2,3,3)
imshow(IMesp1)
title("imagem especificada")

subplot(2,3,4)
imhist(IM)
title("hist-imagem original")

subplot(2,3,5)
imhist(REF)
title("hist-imagem de referencia")

subplot(2,3,6)
imhist(IMesp1)
title("hist-imagem especificada")
end