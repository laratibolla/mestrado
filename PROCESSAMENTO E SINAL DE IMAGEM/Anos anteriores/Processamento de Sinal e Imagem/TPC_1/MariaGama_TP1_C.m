%TRANSFORMACAO GAMA

%Criado por Maria Gama a 03/03/2021

function []=MariaGama_TP1_C(imagem, gama)
IM=imread(imagem);
subplot(2,4,1)
imshow(IM)
title("imagem original")

subplot(2,4,2)
Vmin=min(min(IM));
Vmax=max(max(IM)); %min e max tem de estar entre 0 e 1 para estar nos intervalos da função
minnorm=double(Vmin)/255;
maxnorm=double(Vmax)/255; %min e max normalizado
IM1=imadjust(IM,[minnorm maxnorm],[]);
imshow(IM1)
title("imagem otimizada. Min="+Vmin+" Max="+Vmax)

subplot(2,4,3)
IM2=imadjust(IM,[],[],gama);
imshow(IM2)
title("gama="+gama)

subplot(2,4,4)
IM3=histeq(IM);
imshow(IM3)
title("imagem equalizada")

subplot(2,4,5)
imhist(IM)
title("hist-imagem original")

subplot(2,4,6)
imhist(IM1)
title("hist-imagem otimizada")

subplot(2,4,7)
imhist(IM2)
title("hist-correcao gama")

subplot(2,4,8)
imhist(IM3)
title("hist-imagem equalizada")
end