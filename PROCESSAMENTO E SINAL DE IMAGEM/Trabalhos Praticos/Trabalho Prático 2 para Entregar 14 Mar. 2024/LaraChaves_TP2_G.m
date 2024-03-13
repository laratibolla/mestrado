%API TP2 Ex.G
%Lara Tibolla Chaves    Entrega: 14/03/2024

% Segmentação por Thresholding Local 

function LaraChaves_TP2_G(imagem, S, GRAF)
    % Leitura da imagem
    imgOriginal = imread(imagem);
    
    % Conversão para escala de cinza, se necessário
    imgCinza = rgb2gray(imgOriginal);
    
    % Tamanho da imagem
    [linhas, colunas] = size(imgCinza);
    
    % Dividindo a imagem em sub-imagens
    blocosLinhas = floor(linhas / S);
    blocosColunas = floor(colunas / S);
    
    % Criação de uma matriz de índices para cada bloco
    [X, Y] = meshgrid(1:S, 1:S);
    blocoIndices = [X(:) Y(:)];
    
    % Calcula as coordenadas iniciais e finais de cada bloco
    coordenadasIniciais = (blocoIndices - 1) .* [blocosLinhas, blocosColunas] + 1;
    coordenadasFinais = blocoIndices .* [blocosLinhas, blocosColunas];
    
    % Inicializando a imagem binária resultante
    imagemBinaria = zeros(linhas, colunas);
    
    % Tresholding Local usando o método de Otsu para cada bloco
    for i = 1:size(coordenadasIniciais, 1)
        bloco = imgCinza(coordenadasIniciais(i, 1):coordenadasFinais(i, 1), coordenadasIniciais(i, 2):coordenadasFinais(i, 2));
        levelOtsuLocal = graythresh(bloco);
        imagemBinaria(coordenadasIniciais(i, 1):coordenadasFinais(i, 1), coordenadasIniciais(i, 2):coordenadasFinais(i, 2)) = imbinarize(bloco, levelOtsuLocal);
    end
    
    % Apresentação dos resultados, se GRAF=1
    if GRAF
        subplot(1, 3, 1), imshow(imgCinza), title('Imagem Cinza');
        
        
        levelOtsuGlobal = graythresh(imgCinza);
        IGlobal = imbinarize(imgCinza, levelOtsuGlobal);
        subplot(1, 3, 2), imshow(IGlobal), title(['Tresholding Global- Tg:Otsu = ' num2str(uint8(levelOtsuGlobal * 255))]);
        
        subplot(1, 3, 3), imshow(imagemBinaria), title(['Tresholding Local - S = ' num2str(S)]);
    end
end