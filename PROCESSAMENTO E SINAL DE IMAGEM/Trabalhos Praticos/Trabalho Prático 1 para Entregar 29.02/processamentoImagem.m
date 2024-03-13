% API TP1 Ex.E
%Lara Tibolla Chaves    Data Entrega: 29/02/2024

% Filtros espaciais em imagens com ruido Sal & Pimenta

function processamentoImagem(nomeArquivo, nivelRuido)
    % carrega a imagem original
    ImagemOriginal = imread(nomeArquivo);

    % ruído Sal & Pimenta
    ImagemRuido = imnoise(ImagemOriginal, 'salt & pepper', nivelRuido);

    % filtros de média e mediana
    filtroMedia3x3 = imfilter(ImagemRuido, ones(3) / 9);
    filtroMedia5x5 = imfilter(ImagemRuido, ones(5) / 25);
    filtroMediana3x3 = medfilt2(ImagemRuido, [3 3]);
    filtroMediana5x5 = medfilt2(ImagemRuido, [5 5]);

    % calculo erro 
    erroOriginal = sum(abs(double(ImagemOriginal(:))) - double(ImagemOriginal(:))) / numel(ImagemOriginal);
    erroRuido = sum(abs(double(ImagemOriginal(:)) - double(ImagemRuido(:)))) / numel(ImagemOriginal);
    erroMedia3x3 = sum(abs(double(ImagemOriginal(:)) - double(filtroMedia3x3(:)))) / numel(ImagemOriginal);
    erroMedia5x5 = sum(abs(double(ImagemOriginal(:)) - double(filtroMedia5x5(:)))) / numel(ImagemOriginal);
    erroMediana3x3 = sum(abs(double(ImagemOriginal(:)) - double(filtroMediana3x3(:)))) / numel(ImagemOriginal);
    erroMediana5x5 = sum(abs(double(ImagemOriginal(:)) - double(filtroMediana5x5(:)))) / numel(ImagemOriginal);

    %visualizar 
    figure;
    subplot(2,3,1), imshow(ImagemOriginal), title('Original');
    subplot(2,3,2),imshow(ImagemRuido), title(['Imagem com Ruido - Erro:', num2str(erroRuido)]);
    subplot(2,3,3),imshow(ImagemRuido), title(['Filtro Media 3x3 - Erro:', num2str(erroMedia3x3)]);
    subplot(2,3,4),imshow(ImagemRuido), title(['Filtro Media 5x5 - Erro:', num2str(erroMedia5x5)]);
    subplot(2,3,5),imshow(ImagemRuido), title(['Filtro Mediana 3x3 - Erro:', num2str(erroMediana3x3)]);
    subplot(2,3,6),imshow(ImagemRuido), title(['Filtro Mediana 5x5 - Erro medio:', num2str(erroMediana5x5)]);
end

function erro = calcularerro(imagem1, imagem2)
    % calculo erro médio absoluto 
    diferenca = double(imagem1) - double(imagem2);
    erro = sum(abs(diferenca(:))) / numel(imagem1);
end