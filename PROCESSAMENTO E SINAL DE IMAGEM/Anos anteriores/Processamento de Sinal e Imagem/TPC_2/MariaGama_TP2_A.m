%Visualização de imagens de cor

%Criado por Maria Gama a 12/03/2021

function []= MariaGama_TP2_A(imagem)
IM=imread(imagem);
figure (1)
imshow(IM), title("original")

figure (2)
[II8,TabCor8] = rgb2ind(IM,8,"nodither");
imshow(II8,TabCor8), title("imagem sem dither")

figure (3)
[II8D,TabCor8D] = rgb2ind(IM,8,"dither"); %com dither
imshow(II8D,TabCor8D), title("imagem com dither")

figure (4)
hsv=rgb2hsv(IM);
IG=hsv(:,:,3); %versao escala de cinzento
imshow(IG), title("imagem com tons de cinzento")

figure (5)
imshow(IG, jet), title("imagem com tabela de cor jet")

figure(6)
imshow(IG, spring), title("imagem com tabela de cor spring")
end