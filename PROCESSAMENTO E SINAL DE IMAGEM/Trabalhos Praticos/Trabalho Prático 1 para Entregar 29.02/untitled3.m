% Carregar uma imagem de teste (por exemplo, 'RobotC.tif')
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

% Loop diferentes níveis de contaminação
for i = 1:length(niveisContaminacao)
    nivel = niveisContaminacao(i);

    % Adicionar ruídos
    imagemSalPimenta = imnoise(imagemOriginal, 'salt & pepper', nivel);
    imagemGaussiano = imnoise(imagemOriginal, 'gaussian', 0, nivel);

    % Loop diferentes tamanhos de filtro
    for j = 1:length(tamanhosFiltro)
        tamanhoFiltro = tamanhosFiltro(j);

        % Aplicar filtros
        imagemSalPimentaMedia = medfilt2(imagemSalPimenta, [tamanhoFiltro, tamanhoFiltro]);
        imagemGaussianoMedia = medfilt2(imagemGaussiano, [tamanhoFiltro, tamanhoFiltro]);
        imagemSalPimentaMediana = medfilt2(imagemSalPimenta, [tamanhoFiltro, tamanhoFiltro]);
        imagemGaussianoMediana = medfilt2(imagemGaussiano, [tamanhoFiltro, tamanhoFiltro]);

        % Avaliar desempenho quantitativamente
        erroSalPimentaMedia = sum(abs(double(imagemOriginal(:)) - double(imagemSalPimentaMedia(:)))) / numel(imagemOriginal);
        erroGaussianoMedia = sum(abs(double(imagemOriginal(:)) - double(imagemGaussianoMedia(:)))) / numel(imagemOriginal);
        erroSalPimentaMediana = sum(abs(double(imagemOriginal(:)) - double(imagemSalPimentaMediana(:)))) / numel(imagemOriginal);
        erroGaussianoMediana = sum(abs(double(imagemOriginal(:)) - double(imagemGaussianoMediana(:)))) / numel(imagemOriginal);

        % Armazenar resultados
        resultadosSalPimentaMedia(i, j) = erroSalPimentaMedia;
        resultadosGaussianoMedia(i, j) = erroGaussianoMedia;
        resultadosSalPimentaMediana(i, j) = erroSalPimentaMediana;
        resultadosGaussianoMediana(i, j) = erroGaussianoMediana;
    end
end

% Exibir resultados em gráficos 2D
exibirGraficos2D(niveisContaminacao, resultadosSalPimentaMedia, 'Sal & Pimenta - Filtro de Média');
exibirGraficos2D(niveisContaminacao, resultadosGaussianoMedia, 'Gaussiano - Filtro de Média');
exibirGraficos2D(niveisContaminacao, resultadosSalPimentaMediana, 'Sal & Pimenta - Filtro de Mediana');
exibirGraficos2D(niveisContaminacao, resultadosGaussianoMediana, 'Gaussiano - Filtro de Mediana');

% Função para exibir gráficos 2D
function exibirGraficos2D(niveisContaminacao, resultados, titulo)
    figure;
    plot(niveisContaminacao, resultados, '-o');
    xlabel('Nível de Contaminação');
    ylabel('MAE');
    title(titulo);
    grid on;
    legend('Filtro 3x3', 'Filtro 5x5');  % Adapte conforme necessário
end