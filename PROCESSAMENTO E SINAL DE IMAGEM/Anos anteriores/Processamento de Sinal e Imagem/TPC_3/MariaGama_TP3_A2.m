%imagem com etiquetas

%Criado por Maria Gama a 26/03/2021

function [IEt,NoOb]=MariaGama_TP3_A2(imagem, GRAF)
IM=imread(imagem);
IBf=MariaGama_TP3_A1(imagem,0);
[IEt,NoOb] = bwlabel(IBf);

if GRAF==1
subplot(1,3,1), imshow(IM), title("imagem original");
subplot(1,3,2), imshow(IBf), title("imagem binária");
subplot(1,3,3), imshow(IEt, prism), title("Imagem com etiquetas. Objetos="+NoOb)
end
end