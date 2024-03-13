% API TP1 Ex.B4
%Lara Tibolla Chaves    Data Entrega: 29/02/2024

%Original + Equalizada + Negativa (inversao de escala) e os 3 histogramas.

% Carregando a imagem original
ImagemOriginal = imread("RobotC.tif");

% janela
figure;

% mostrar imagem original
subplot(2, 3, 1), imshow(ImagemOriginal), title('Original');

% mostrar histograma da imagem original
subplot(2, 3, 4), imhist(ImagemOriginal), title('Histograma Original');

% Equalizando a imagem
ImagemEqualizada = histeq(ImagemOriginal);

% mostrar imagem equalizada
subplot(2, 3, 2), imshow(ImagemEqualizada), title('Equalizada');

% mostrar histograma da imagem equalizada
subplot(2, 3, 5), imhist(ImagemEqualizada), title('Histograma Equalizado');

% Negativa da imagem (inversão de escala)
ImagemNegativa = 255 - ImagemOriginal;

% Subplot para a imagem negativa
subplot(2, 3, 3), imshow(ImagemNegativa), title('Negativa');

% Subplot para o histograma da imagem negativa
subplot(2, 3, 6), imhist(ImagemNegativa), title('Histograma Negativo');