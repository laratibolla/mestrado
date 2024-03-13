% API TP1 Ex.D
%Lara Tibolla Chaves    Data Entrega: 29/02/2024

%Especificaçao de histograma

function ImagemNova = LaraChaves_TP1_D(imagem1, imagemReferencia)
    % carregar imagens
    imagemOriginal = imread(imagem1);
    imgReferencia = imread(imagemReferencia);

    % histogramas das imagens
    histModificar = imhist(imagemOriginal);
    histReferencia = imhist(imgReferencia);

    % equalizar a imagem a ser modificada como base no histograma de referência
    imgFinal = histeq(imagemOriginal, histReferencia);

    % janela
    figure;

    % mostrar a imagem original a ser modificada
    subplot(2, 3, 1), imshow(imagemOriginal), title('Original (Modificar)');

    % mostrar o histograma da imagem original a ser modificada
    subplot(2, 3, 4), imhist(imagemOriginal), title('Histograma Original (Modificar)');

    % mostrar a imagem de referência
    subplot(2, 3, 2), imshow(imgReferencia), title('Referência');

    % mostrar o histograma da imagem de referência
    subplot(2, 3, 5), imhist(imgReferencia), title('Histograma Referência');

    % mostrar a imagem final após a modificação de histograma
    subplot(2, 3, 3), imshow(imgFinal), title('Final');

    % mostrar o histograma da imagem final
    subplot(2, 3, 6), imhist(imgFinal), title('Histograma Final');

    % saida: Imagem final depois da modificação de histograma
    novaImagem = imgFinal;
end