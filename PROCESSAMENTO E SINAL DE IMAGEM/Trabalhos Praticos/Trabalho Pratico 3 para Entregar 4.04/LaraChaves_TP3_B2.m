% %API TP3 Ex.B2
%Lara Tibolla Chaves    Entrega: 08/04/2024

% Visualizacao de operacoes morfologicas (binarias)

function LaraChaves_TP3_B2(imagem)
IM=imread(imagem);
IBf=LaraChaves_TP3_A1(imagem,0);
EE3 = strel("disk",3,0);
EE5 = strel("disk",5,0);
EE10 = strel("disk",10,0);
IMe3 = imerode(IBf,EE3);
IMd3 = imdilate(IBf,EE3); 
IMa3 = imopen(IBf,EE3);
IMf3 = imclose(IBf,EE3);
IMe5 = imerode(IBf,EE5);
IMd5 = imdilate(IBf,EE5); 
IMa5 = imopen(IBf,EE5);
IMf5 = imclose(IBf,EE5);
IMe10 = imerode(IBf,EE10);
IMd10 = imdilate(IBf,EE10); 
IMa10 = imopen(IBf,EE10);
IMf10 = imclose(IBf,EE10);


figure(1)
subplot(2,1,1), imshow(IM), title("Imagem original")
subplot(2,1,2), imshow(IBf), title("Imagem binária")

figure(2)
subplot(3,4,1), imshow(IMe3), title("Erosão R=3")
subplot(3,4,2), imshow(IMd3), title("Dilatação R=3")
subplot(3,4,3), imshow(IMa3), title("Abertura R=3")
subplot(3,4,4), imshow(IMf3), title("Fecho R=3")
subplot(3,4,5), imshow(IMe5), title("Erosão R=5")
subplot(3,4,6), imshow(IMd5), title("Dilatação R=5")
subplot(3,4,7), imshow(IMa5), title("Abertura R=5")
subplot(3,4,8), imshow(IMf5), title("Fecho R=5")
subplot(3,4,9), imshow(IMe10), title("Erosão R=10")
subplot(3,4,10), imshow(IMd10), title("Dilatação R=10")
subplot(3,4,11), imshow(IMa10), title("Abertura R=10")
subplot(3,4,12), imshow(IMf10), title("Fecho R=10")

end