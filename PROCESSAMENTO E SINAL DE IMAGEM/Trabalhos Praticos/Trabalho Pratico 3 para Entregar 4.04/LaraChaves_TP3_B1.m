% %API TP3 Ex.B1
%Lara Tibolla Chaves    Entrega: 08/04/2024

% Visualizacao de operacoes morfologicas

function LaraChaves_TP3_B1(imagem)
IM=imread(imagem);
IB = LaraChaves_TP3_A1(imagem,0);
EE3 = strel("disk",3,0);
EE5 = strel("disk",5,0);
EE10 = strel("disk",10,0);
IMe3 = imerode(IB,EE3);
IMd3 = imdilate(IB,EE3); 
IMa3 = imopen(IB,EE3);
IMf3 = imclose(IB,EE3);

IMe5 = imerode(IB,EE5);
IMd5 = imdilate(IB,EE5); 
IMa5 = imopen(IB,EE5);
IMf5 = imclose(IB,EE5);

IMe10 = imerode(IB,EE10);
IMd10 = imdilate(IB,EE10); 
IMa10 = imopen(IB,EE10);
IMf10 = imclose(IB,EE10);

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