%Componentes RGB e HSV

%Criado por Maria Gama a 12/03/2021

function []= MariaGama_TP2_B(imagem)
IM=imread(imagem);
figure
imshow(IM);

%2ª janela -componentes RGB
R=IM(:,:,1);
G=IM(:,:,2);
B=IM(:,:,3);
subplot(2,3,1), imshow(R), title("Red")
subplot(2,3,2), imshow(G), title("Green")
subplot(2,3,3), imshow(B), title("Blue")
subplot(2,3,4), imhist(R), title("Red")
subplot(2,3,5), imhist(G), title("Green")
subplot(2,3,6), imhist(B), title("Blue")

%3ª janela -componentes HSV
IMhsv=rgb2hsv(IM);
H=IMhsv(:,:,1);
S=IMhsv(:,:,2);
V=IMhsv(:,:,3);
figure
subplot(2,3,1), imshow(H), title("Hue")
subplot(2,3,2), imshow(S), title("Saturation")
subplot(2,3,3), imshow(V), title("Value")
subplot(2,3,4), imhist(H), title("Hue")
subplot(2,3,5), imhist(S), title("Saturation")
subplot(2,3,6), imhist(V), title("Value")

end