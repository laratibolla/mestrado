% carregar uma imagem para teste (por exemplo, 'RobotC.tif')
imagemOriginal = imread('RobotC.tif');
figure;
subplot(3,3,1), imshow(imagemOriginal), title('Original');

% Definir níveis de contaminação e tamanhos de filtro
niveisContaminacao = [0.01, 0.05, 0.1];  % Exemplo: diferentes níveis de ruído
tamanhosFiltro = [3, 5];  % Exemplo: diferentes tamanhos de filtro

% Inicializar matrizes para armazenar resultados
resultadosSalPimentaMedia = zeros(length(niveisContaminacao), length(tamanhosFiltro));
resultadosGaussianoMedia = zeros(length(niveisContaminacao), length(tamanhosFiltro));
resultadosSalPimentaMediana = zeros(length(niveisContaminacao), length(tamanhosFiltro));
resultadosGaussianoMediana = zeros(length(niveisContaminacao), length(tamanhosFiltro));

% loop diferentes níveis de contaminação
for i = 1:length(niveisContaminacao)
    nivel = niveisContaminacao(i);

% Adicionar ruídos
imagemSalPimenta = imnoise(imagemOriginal, 'salt & pepper', nivel);
imagemGaussiano = imnoise(imagemOriginal, 'gaussian', 0, nivel);

subplot(3,3,2), imshow(imagemSalPimenta), title('Ruido Sal & Pimenta');
subplot(3,3,3), imshow(imagemGaussiano), title('Ruido Gaussiano');

% loop diferentes tamanhos de filtro
    for j = 1:length(tamanhosFiltro)
        tamanhoFiltro = tamanhosFiltro(j);

        % Aplicar filtros
        imagemSalPimentaMedia = medfilt2(imagemSalPimenta, [tamanhoFiltro, tamanhoFiltro]);
        imagemGaussianoMedia = medfilt2(imagemGaussiano, [tamanhoFiltro, tamanhoFiltro]);
        imagemSalPimentaMediana = medfilt2(imagemSalPimenta, [tamanhoFiltro, tamanhoFiltro]);
        imagemGaussianoMediana = medfilt2(imagemGaussiano, [tamanhoFiltro, tamanhoFiltro]);

        % Avaliar desempenho quantitativamente (por exemplo, MAE)
        erroSalPimentaMedia = sum(abs(double(imagemOriginal(:)) - double(imagemFiltradaSalPimentaMedia(:)))) / numel(imagemOriginal);
        erroGaussianoMedia = sum(abs(double(imagemOriginal(:)) - double(imagemFiltradaGaussianoMedia(:)))) / numel(imagemOriginal);
        erroSalPimentaMediana = sum(abs(double(imagemOriginal(:)) - double(imagemFiltradaSalPimentaMediana(:)))) / numel(imagemOriginal);
        erroGaussianoMediana = sum(abs(double(imagemOriginal(:)) - double(imagemFiltradaGaussianoMediana(:)))) / numel(imagemOriginal);

        subplot(3,3,5), imshow(imagemSalPimentaMedia), title(['Filtrada Sal e Pimenta Media - MAE:', num2str(erroSalPimentaMediana)]);
        subplot(3,3,6), imshow(imagemGaussianoMedia), title(['Filtrada Gaussiano Media - MAE:', num2str(erroGaussianoMedia)]);
        subplot(3,3,8), imshow(imagemSalPimentaMediana), title(['Filtrada Pimenta Mediana - MAE:', num2str(erroSalPimentaMediana)]);
        subplot(3,3,9), imshow(imagemGaussianoMediana), title(['Filtrada Gaussiano Mediana', num2str(erroGaussianoMediana)]);
        
        % Armazenar resultados
        resultadosSalPimentaMedia(i, j) = maeSalPimentaMedia;
        resultadosGaussianoMedia(i, j) = maeGaussianoMedia;
        resultadosSalPimentaMediana(i, j) = maeSalPimentaMediana;
        resultadosGaussianoMediana(i, j) = maeGaussianoMediana;
    end
end

% Criar uma figura para mostrar os resultados
figure;

% Subplot para Filtro de Média - Ruído Sal & Pimenta
subplot(2, 2, 1);
imshow(imagemOriginal);
title('Imagem Original');

subplot(2, 2, 2);
imshow(imagemFiltradaMediaSalPimenta);
title('Filtro de Média - Ruído Sal & Pimenta');

% Subplot para Filtro de Mediana - Ruído Sal & Pimenta
subplot(2, 2, 3);
imshow(imagemFiltradaMedianaSalPimenta);
title('Filtro de Mediana - Ruído Sal & Pimenta');

% Subplot para Filtro de Média - Ruído Gaussiano
subplot(2, 2, 4);
imshow(imagemFiltradaMediaGaussiano);
title('Filtro de Média - Ruído Gaussiano');