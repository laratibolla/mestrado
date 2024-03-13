%API TP2 Ex.F
%Lara Tibolla Chaves    Entrega: 14/03/2024

% Tresholding Global

function LaraChaves_SegImagem(imagem)
% carregando imagem
img = imread(imagem);

% converter para escala de cinza
if size(img, 3) == 3
        imgCinza = rgb2gray(img);
    else
        imgCinza = img;
    end
% imagem e histograma imgCinza
subplot(2,2,1), imshow(imgCinza), title('Imagem escala Cinza');
subplot(2,2,2), imhist(imgCinza), title('Histograma imagem escala de Cinza');

% Tresholding Global usando o método de Otsu
nivelOtsu = graythresh(imgCinza);
IBO = imbinarize(imgCinza, nivelOtsu);  
 subplot(2, 2, 3), imshow(IBO), title(['IBO - Tg_{Otsu} = ' num2str(uint8(nivelOtsu * 255))]);

% Tresholding Global usando o valor da mediana de IC
 nivelMediana = median(imgCinza(:)) / 255;
 IBM = imbinarize(imgCinza, nivelMediana);
 subplot(2, 2, 4), imshow(IBM), title(['IBM - Tg_{Mediana} = ' num2str(uint8(nivelMediana * 255))]);


end

