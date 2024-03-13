%Avaliação do Tresholding Local

%Criado por Maria Gama a 23/03/2021

IM=imread("seg2.jpg");
REF=imread("seg1.jpg");
[NL,NC,NB]=size(IM);
TOtsu = graythresh(IM); %calcula o valor T mas numa escala de 0-1
Otsu= uint8(255*TOtsu);
BI=[]; IBL=[]; IBL2=[];IBL3=[];IBL4=[];IBL5=[];IBL6=[];IBL7=[];IBL8=[];IBL9=[];IBL10=[];IBL11=[]; IBL12=[]; IBL13=[]; IBL14=[];
s=1:14;
for S=1 %Global
for L=1:S   
    for C=1:S
        NCb = round(NC/S);
        NLb = round(NL/S);
        PC = 1:NCb:(S-1)*NCb+1; %primeira coluna
        UC = [NCb:NCb:(S-1)*NCb NC]; %ultima coluna 
        PL = 1:NLb:(S-1)*NLb+1; %primeira linha
        UL = [NLb:NLb:(S-1)*NLb NL]; %ultima linha
        SUB=IM(PL(L):UL(L),PC(C):UC(C));
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
end
intersecao1=IBL & REF;
uniao1= IBL | REF;
jaccard1 = sum(intersecao1(:))/sum(uniao1(:));

for S=2 
for L=1:S   
    for C=1:S
        NCb = round(NC/S);
        NLb = round(NL/S);
        PC = 1:NCb:(S-1)*NCb+1; %primeira coluna
        UC = [NCb:NCb:(S-1)*NCb NC]; %ultima coluna 
        PL = 1:NLb:(S-1)*NLb+1; %primeira linha
        UL = [NLb:NLb:(S-1)*NLb NL]; %ultima linha
        SUB=IM(PL(L):UL(L),PC(C):UC(C));
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
       IBL2=cat(1,IBL2,BI); %concatena todas as linhas formando a imagem final IBL
       BI=[]; %coloca  alista vazia para poder voltar ao inico do ciclo   
end
end
intersecao2=IBL2 & REF;
uniao2= IBL2 | REF;
jaccard2 = sum(intersecao2(:))/sum(uniao2(:));
erro=horzcat(jaccard1,jaccard2);

for S=3 
for L=1:S   
    for C=1:S
        NCb = round(NC/S);
        NLb = round(NL/S);
        PC = 1:NCb:(S-1)*NCb+1; %primeira coluna
        UC = [NCb:NCb:(S-1)*NCb NC]; %ultima coluna 
        PL = 1:NLb:(S-1)*NLb+1; %primeira linha
        UL = [NLb:NLb:(S-1)*NLb NL]; %ultima linha
        SUB=IM(PL(L):UL(L),PC(C):UC(C));
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
       IBL3=cat(1,IBL3,BI); %concatena todas as linhas formando a imagem final IBL
       BI=[]; %coloca  alista vazia para poder voltar ao inico do ciclo   
end
end
intersecao3=IBL3 & REF;
uniao3= IBL3 | REF;
jaccard3 = sum(intersecao3(:))/sum(uniao3(:));
erro=horzcat(erro,jaccard3);

for S=4 
for L=1:S   
    for C=1:S
        NCb = round(NC/S);
        NLb = round(NL/S);
        PC = 1:NCb:(S-1)*NCb+1; %primeira coluna
        UC = [NCb:NCb:(S-1)*NCb NC]; %ultima coluna 
        PL = 1:NLb:(S-1)*NLb+1; %primeira linha
        UL = [NLb:NLb:(S-1)*NLb NL]; %ultima linha
        SUB=IM(PL(L):UL(L),PC(C):UC(C));
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
       IBL4=cat(1,IBL4,BI); %concatena todas as linhas formando a imagem final IBL
       BI=[]; %coloca  alista vazia para poder voltar ao inico do ciclo   
end
end
intersecao4=IBL4 & REF;
uniao4= IBL4 | REF;
jaccard4 = sum(intersecao4(:))/sum(uniao4(:));
erro=horzcat(erro,jaccard4);

for S=5 
for L=1:S   
    for C=1:S
        NCb = round(NC/S);
        NLb = round(NL/S);
        PC = 1:NCb:(S-1)*NCb+1; %primeira coluna
        UC = [NCb:NCb:(S-1)*NCb NC]; %ultima coluna 
        PL = 1:NLb:(S-1)*NLb+1; %primeira linha
        UL = [NLb:NLb:(S-1)*NLb NL]; %ultima linha
        SUB=IM(PL(L):UL(L),PC(C):UC(C));
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
       IBL5=cat(1,IBL5,BI); %concatena todas as linhas formando a imagem final IBL
       BI=[]; %coloca  alista vazia para poder voltar ao inico do ciclo   
end
end
intersecao5 = IBL5 & REF;
uniao5 = IBL5 | REF;
jaccard5 = sum(intersecao5(:))/sum(uniao5(:));
erro = horzcat(erro,jaccard5);

for S=6 
for L=1:S   
    for C=1:S
        NCb = round(NC/S);
        NLb = round(NL/S);
        PC = 1:NCb:(S-1)*NCb+1; %primeira coluna
        UC = [NCb:NCb:(S-1)*NCb NC]; %ultima coluna 
        PL = 1:NLb:(S-1)*NLb+1; %primeira linha
        UL = [NLb:NLb:(S-1)*NLb NL]; %ultima linha
        SUB=IM(PL(L):UL(L),PC(C):UC(C));
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
       IBL6=cat(1,IBL6,BI); %concatena todas as linhas formando a imagem final IBL
       BI=[]; %coloca  alista vazia para poder voltar ao inico do ciclo   
end
end
intersecao6 = IBL6 & REF;
uniao6 = IBL6 | REF;
jaccard6 = sum(intersecao6(:))/sum(uniao6(:));
erro = horzcat(erro,jaccard6);

for S=7 
for L=1:S   
    for C=1:S
        NCb = round(NC/S);
        NLb = round(NL/S);
        PC = 1:NCb:(S-1)*NCb+1; %primeira coluna
        UC = [NCb:NCb:(S-1)*NCb NC]; %ultima coluna 
        PL = 1:NLb:(S-1)*NLb+1; %primeira linha
        UL = [NLb:NLb:(S-1)*NLb NL]; %ultima linha
        SUB=IM(PL(L):UL(L),PC(C):UC(C));
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
       IBL7=cat(1,IBL7,BI); %concatena todas as linhas formando a imagem final IBL
       BI=[]; %coloca  alista vazia para poder voltar ao inico do ciclo   
end
end
intersecao7 = IBL7 & REF;
uniao7 = IBL7 | REF;
jaccard7 = sum(intersecao7(:))/sum(uniao7(:));
erro = horzcat(erro,jaccard7);

for S=8 
for L=1:S   
    for C=1:S
        NCb = round(NC/S);
        NLb = round(NL/S);
        PC = 1:NCb:(S-1)*NCb+1; %primeira coluna
        UC = [NCb:NCb:(S-1)*NCb NC]; %ultima coluna 
        PL = 1:NLb:(S-1)*NLb+1; %primeira linha
        UL = [NLb:NLb:(S-1)*NLb NL]; %ultima linha
        SUB=IM(PL(L):UL(L),PC(C):UC(C));
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
       IBL8=cat(1,IBL8,BI); %concatena todas as linhas formando a imagem final IBL
       BI=[]; %coloca  alista vazia para poder voltar ao inico do ciclo   
end
end
intersecao8 = IBL8 & REF;
uniao8 = IBL8 | REF;
jaccard8 = sum(intersecao8(:))/sum(uniao8(:));
erro = horzcat(erro,jaccard8);

for S=9 
for L=1:S   
    for C=1:S
        NCb = round(NC/S);
        NLb = round(NL/S);
        PC = 1:NCb:(S-1)*NCb+1; %primeira coluna
        UC = [NCb:NCb:(S-1)*NCb NC]; %ultima coluna 
        PL = 1:NLb:(S-1)*NLb+1; %primeira linha
        UL = [NLb:NLb:(S-1)*NLb NL]; %ultima linha
        SUB=IM(PL(L):UL(L),PC(C):UC(C));
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
       IBL9=cat(1,IBL9,BI); %concatena todas as linhas formando a imagem final IBL
       BI=[]; %coloca  alista vazia para poder voltar ao inico do ciclo   
end
end
intersecao9 = IBL9 & REF;
uniao9 = IBL9 | REF;
jaccard9 = sum(intersecao9(:))/sum(uniao9(:));
erro = horzcat(erro,jaccard9);

for S=10 
for L=1:S   
    for C=1:S
        NCb = round(NC/S);
        NLb = round(NL/S);
        PC = 1:NCb:(S-1)*NCb+1; %primeira coluna
        UC = [NCb:NCb:(S-1)*NCb NC]; %ultima coluna 
        PL = 1:NLb:(S-1)*NLb+1; %primeira linha
        UL = [NLb:NLb:(S-1)*NLb NL]; %ultima linha
        SUB=IM(PL(L):UL(L),PC(C):UC(C));
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
       IBL10=cat(1,IBL10,BI); %concatena todas as linhas formando a imagem final IBL
       BI=[]; %coloca  alista vazia para poder voltar ao inico do ciclo   
end
end
intersecao10 = IBL10 & REF;
uniao10 = IBL10 | REF;
jaccard10 = sum(intersecao10(:))/sum(uniao10(:));
erro = horzcat(erro,jaccard10);

for S=11 
for L=1:S   
    for C=1:S
        NCb = round(NC/S);
        NLb = round(NL/S);
        PC = 1:NCb:(S-1)*NCb+1; %primeira coluna
        UC = [NCb:NCb:(S-1)*NCb NC]; %ultima coluna 
        PL = 1:NLb:(S-1)*NLb+1; %primeira linha
        UL = [NLb:NLb:(S-1)*NLb NL]; %ultima linha
        SUB=IM(PL(L):UL(L),PC(C):UC(C));
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
       IBL11=cat(1,IBL11,BI); %concatena todas as linhas formando a imagem final IBL
       BI=[]; %coloca  alista vazia para poder voltar ao inico do ciclo   
end
end
intersecao11 = IBL11 & REF;
uniao11 = IBL11 | REF;
jaccard11 = sum(intersecao11(:))/sum(uniao11(:));
erro=horzcat(erro,jaccard11);

for S=12 
for L=1:S   
    for C=1:S
        NCb = round(NC/S);
        NLb = round(NL/S);
        PC = 1:NCb:(S-1)*NCb+1; %primeira coluna
        UC = [NCb:NCb:(S-1)*NCb NC]; %ultima coluna 
        PL = 1:NLb:(S-1)*NLb+1; %primeira linha
        UL = [NLb:NLb:(S-1)*NLb NL]; %ultima linha
        SUB=IM(PL(L):UL(L),PC(C):UC(C));
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
       IBL12=cat(1,IBL12,BI); %concatena todas as linhas formando a imagem final IBL
       BI=[]; %coloca  alista vazia para poder voltar ao inico do ciclo   
end
end
intersecao12 = IBL12 & REF;
uniao12 = IBL12 | REF;
jaccard12 = sum(intersecao12(:))/sum(uniao12(:));
erro=horzcat(erro,jaccard12);

for S=11 
for L=1:S   
    for C=1:S
        NCb = round(NC/S);
        NLb = round(NL/S);
        PC = 1:NCb:(S-1)*NCb+1; %primeira coluna
        UC = [NCb:NCb:(S-1)*NCb NC]; %ultima coluna 
        PL = 1:NLb:(S-1)*NLb+1; %primeira linha
        UL = [NLb:NLb:(S-1)*NLb NL]; %ultima linha
        SUB=IM(PL(L):UL(L),PC(C):UC(C));
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
       IBL13=cat(1,IBL13,BI); %concatena todas as linhas formando a imagem final IBL
       BI=[]; %coloca  alista vazia para poder voltar ao inico do ciclo   
end
end
intersecao13 = IBL13 & REF;
uniao13 = IBL13 | REF;
jaccard13 = sum(intersecao13(:))/sum(uniao13(:));
erro=horzcat(erro,jaccard13);

for S=11 
for L=1:S   
    for C=1:S
        NCb = round(NC/S);
        NLb = round(NL/S);
        PC = 1:NCb:(S-1)*NCb+1; %primeira coluna
        UC = [NCb:NCb:(S-1)*NCb NC]; %ultima coluna 
        PL = 1:NLb:(S-1)*NLb+1; %primeira linha
        UL = [NLb:NLb:(S-1)*NLb NL]; %ultima linha
        SUB=IM(PL(L):UL(L),PC(C):UC(C));
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
       IBL14=cat(1,IBL14,BI); %concatena todas as linhas formando a imagem final IBL
       BI=[]; %coloca  alista vazia para poder voltar ao inico do ciclo   
end
end
intersecao14 = IBL14 & REF;
uniao14 = IBL14 | REF;
jaccard14 = sum(intersecao14(:))/sum(uniao14(:));
erro=horzcat(erro,jaccard14);

plot(s,erro)
title("Avaliação do desempenho de TLocal")
xlabel("Valor de S")
ylabel("Erro - Indice de Jaccard")
     