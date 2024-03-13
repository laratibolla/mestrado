% API TP1 Ex.F
%Lara Tibolla Chaves    Data Entrega: 29/02/2024



% carregar uma imagem para teste (por exemplo, 'RobotC.tif')
imagemOriginal = imread('RobotC.tif');
figure;
subplot(3,3,1), imshow(imagemOriginal), title('Original');

% Definir níveis de contaminação e tamanhos de filtro
niveisContaminacao = [0.01, 0.05, 0.1];  
tamanhosFiltro = [3, 5];

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

        % Aplicar filtros media
        filtroMedia = ones(tamanhoFiltro) / tamanhoFiltro^2;
        imagemSalPimentaMedia = imfilter(imagemSalPimenta, filtroMedia);
        imagemGaussianoMedia = imfilter(imagemGaussiano, filtroMedia);

        % Aplicar filtros mediana
        imagemSalPimentaMediana = medfilt2(imagemSalPimenta, [tamanhoFiltro, tamanhoFiltro]);
        imagemGaussianoMediana = medfilt2(imagemGaussiano, [tamanhoFiltro, tamanhoFiltro]);

        % Avaliar desempenho quantitativamente
        erroSalPimentaMedia = sum(abs(double(imagemOriginal(:)) - double(imagemSalPimentaMedia(:)))) / numel(imagemOriginal);
        erroGaussianoMedia = sum(abs(double(imagemOriginal(:)) - double(imagemGaussianoMedia(:)))) / numel(imagemOriginal);
        erroSalPimentaMediana = sum(abs(double(imagemOriginal(:)) - double(imagemSalPimentaMediana(:)))) / numel(imagemOriginal);
        erroGaussianoMediana = sum(abs(double(imagemOriginal(:)) - double(imagemGaussianoMediana(:)))) / numel(imagemOriginal);

        subplot(3,3,5), imshow(imagemSalPimentaMedia), title(['Filtrada Sal e Pimenta Media - MAE:', num2str(erroSalPimentaMedia)]);
        subplot(3,3,6), imshow(imagemGaussianoMedia), title(['Filtrada Gaussiano Media - MAE:', num2str(erroGaussianoMedia)]);
        subplot(3,3,8), imshow(imagemSalPimentaMediana), title(['Filtrada Pimenta Mediana - MAE:', num2str(erroSalPimentaMediana)]);
        subplot(3,3,9), imshow(imagemGaussianoMediana), title(['Filtrada Gaussiano Mediana', num2str(erroGaussianoMediana)]);
        
        % Armazenar resultados
        resultadosSalPimentaMedia(i, j) = erroSalPimentaMedia;
        resultadosGaussianoMedia(i, j) = erroGaussianoMedia;
        resultadosSalPimentaMediana(i, j) = erroSalPimentaMediana;
        resultadosGaussianoMediana(i, j) = erroGaussianoMediana;
    end
end

% Exibir resultados
exibirResultadosQuantitativos(niveisContaminacao, resultadosSalPimentaMedia, 'Sal & Pimenta - Filtro de Média');
exibirResultadosQuantitativos(niveisContaminacao, resultadosGaussianoMedia, 'Gaussiano - Filtro de Média');
exibirResultadosQuantitativos(niveisContaminacao, resultadosSalPimentaMediana, 'Sal & Pimenta - Filtro de Mediana');
exibirResultadosQuantitativos(niveisContaminacao, resultadosGaussianoMediana, 'Gaussiano - Filtro de Mediana');

% Função para exibir resultados quantitativos
function exibirResultadosQuantitativos(niveisContaminacao, resultados, titulo)
    figure;
    plot(niveisContaminacao, resultados, '-o');
    xlabel('Nível de Contaminação');
    ylabel('MAE');
    title(titulo);
    grid on;

    legend('Filtro 3x3', 'Filtro 5x5');  % Adapte conforme tamanhos de filtro
end