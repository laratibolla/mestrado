% API TP1 Ex.F
%Lara Tibolla Chaves    Data Entrega: 29/02/2024

% Avaliaçao dos filtros espaciais para reduçao ruıdo

% carregar imagem
ImagemOriginal = imread('RobotC.tif');

% parametros (que podem ser alterados)
tamanhoFiltro = 5;  
niveisRuido = [0.01, 0.05, 0.1];  

% resultados
resultados = zeros(2, length(niveisRuido));

% loop para avaliar níveis de ruído
for j = 1:length(niveisRuido)
    nivelRuido = niveisRuido(j);
    
    % add ruído Sal & Pimenta
    imagemRuidosaSP = imnoise(ImagemOriginal, 'salt & pepper', nivelRuido);

    % aplicar filtro de média
    filtroMedia = ones(tamanhoFiltro) / tamanhoFiltro^2;
    imagemMediaSP = conv2(double(imagemRuidosaSP), filtroMedia, 'same');

    % aplicar filtro de mediana
    imagemMedianaSP = medfilt2(double(imagemRuidosaSP), [tamanhoFiltro, tamanhoFiltro]);

    % calculo erro para filtros de média e mediana
    resultados(1, j) = sum(abs(imagemMediaSP(:) - double(ImagemOriginal(:)))) / numel(ImagemOriginal);
    resultados(2, j) = sum(abs(imagemMedianaSP(:) - double(ImagemOriginal(:)))) / numel(ImagemOriginal);
end

% janela
figure;

% mostrar resultados para ruído Sal & Pimenta
subplot(2, 1, 1);
plot(niveisRuido, resultados(1, :), 'o-', 'DisplayName', 'Filtro Média');
hold on;
plot(niveisRuido, resultados(2, :), 's-', 'DisplayName', 'Filtro Mediana');
xlabel('Nível de Ruído');
ylabel('Erro');
title('Avaliação do Desempenho - Ruído Sal & Pimenta');
legend;
grid on;

% add ruído Gaussiano
resultados = zeros(2, length(niveisRuido));

% loop para avaliar diferentes níveis de ruído
for j = 1:length(niveisRuido)
    nivelRuido = niveisRuido(j);

    % add ruído Gaussiano
    imagemRuidosaGauss = imnoise(ImagemOriginal, 'gaussian', 0, nivelRuido);

    % aplicar filtro de média
    filtroMedia = ones(tamanhoFiltro) / tamanhoFiltro^2;
    imagemMediaGauss = conv2(double(imagemRuidosaGauss), filtroMedia, 'same');

    % aplicar filtro de mediana
    imagemMedianaGauss = medfilt2(double(imagemRuidosaGauss), [tamanhoFiltro, tamanhoFiltro]);

    % calculo erro média e mediana
    resultados(1, j) = sum(abs(imagemMediaGauss(:) - double(ImagemOriginal(:)))) / numel(ImagemOriginal);
    resultados(2, j) = sum(abs(imagemMedianaGauss(:) - double(ImagemOriginal(:)))) / numel(ImagemOriginal);
end

% mostrar resultados para ruído Gaussiano
subplot(2, 1, 2);
plot(niveisRuido, resultados(1, :), 'o-', 'DisplayName', 'Filtro Média');
hold on;
plot(niveisRuido, resultados(2, :), 's-', 'DisplayName', 'Filtro Mediana');
xlabel('Nível de Ruído');
ylabel('Erro');
title('Avaliação do Desempenho - Ruído Gaussiano');
legend;
grid on;

figure;
subplot(3,3,1), imshow(imagemOriginal), title('Original');
subplot(3,3,2), imshow(imagemRuidosaSP), title('Ruido Sal & Pimenta');
subplot(3,3,3), imshow(imagemRuidosaGauss), title('Ruido Gaussiano');
subplot(3,3,5), imshow(imagemMediaSP), title('Filtrada Sal e Pimenta Media');
subplot(3,3,6), imshow(imagemMediaGauss), title('Filtrada Gaussiano Media');
subplot(3,3,8), imshow(imagemMedianaSP), title('Filtrada Pimenta Mediana');
subplot(3,3,9), imshow(imagemMedianaGauss), title('Filtrada Gaussiano Mediana');