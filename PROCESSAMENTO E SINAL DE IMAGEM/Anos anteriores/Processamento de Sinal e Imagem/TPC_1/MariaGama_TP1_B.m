%Observacao de operacoes pontuais

%Criado por Maria Gama a 03/03/2021

%Original + 5 variacoes de contraste
figure (1)
IM=imread("Robot_BW.tif");
subplot(2,3,1)
imshow(IM)
title("imagem original")

subplot(2,3,2)
IM1=IM*2; %aumento do contraste
imshow(IM1)
title("contaste x2")

subplot(2,3,3)
IM2=IM*4; %aumento do contraste
imshow(IM2)
title("contaste x4")

subplot(2,3,4)
IM3=IM*0.2; %diminuição do contraste
imshow(IM3)
title("contaste x0.2")

subplot(2,3,5)
IM4=IM*0.001; %constraste muito baixo
imshow(IM4)
title("contaste x0.001")

subplot(2,3,6)
IM5=IM*0.7; %diminuição do contraste
imshow(IM5)
title("contaste x0.7")

%Original + 5 variacoes da luminosidade
figure (2)
subplot(2,3,1)
imshow(IM)
title("imagem original")

subplot(2,3,2)
IM1=IM+200; %aumento da limunusidade
imshow(IM1)
title("luminusidade +200")

subplot(2,3,3)
IM2=IM+60; %aumento da limunusidade 
imshow(IM2)
title("lunimusidade +60")

subplot(2,3,4)
IM3=IM-100; %diminuição da limunusidade
imshow(IM3)
title("luminusidade -100")

subplot(2,3,5)
IM4=IM-30; %diminuição da limunusidade
imshow(IM4)
title("luminusidade -30")

subplot(2,3,6)
IM5=IM-9; %diminuição da limunusidade
imshow(IM5)
title("luminusidade -9")

%Original + 5 correcao gama
figure (3)
subplot(2,3,1)
imshow(IM)
title("imagem original")

subplot(2,3,2)
IM1=imadjust(IM,[],[],2); %gama=2, realça os claros
imshow(IM1)
title("gama=2")

subplot(2,3,3)
IM2=imadjust(IM,[],[],5); %gama=5 
imshow(IM2)
title("gama=5")

subplot(2,3,4)
IM3=imadjust(IM,[],[],0.9); %gama=0.9
imshow(IM3)
title("gama=0.9")

subplot(2,3,5)
IM4=imadjust(IM,[],[],0.5); %gama=0.5
imshow(IM4)
title("gama=0.5")

subplot(2,3,6)
IM5=imadjust(IM,[],[],0.7); %gama=0.7
imshow(IM5)
title("gama=0.7")

%Original + Equalizada + Negativa (invers˜ao de escala) e os 3 histogramas
figure (4)
subplot(2,3,1)
imshow(IM)
title("imagem original")

subplot(2,3,2)
IM1=histeq(IM);
imshow(IM1)
title("imagem equalizada")

subplot(2,3,3)
IM2=imcomplement(IM); %inervsão da escala
imshow(IM2)
title("imagem negativa")

subplot(2,3,4) % hist da imagem original
imhist(IM)
title("hist da imagem original")

subplot(2,3,5)
imhist(IM1)
title("hist da imagem equalizada")

subplot(2,3,6)
imhist(IM2)
title("hist da imagem negativa")