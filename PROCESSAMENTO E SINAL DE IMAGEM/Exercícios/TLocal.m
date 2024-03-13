%API TP2 Ex.G
%Lara Tibolla Chaves    Entrega: 14/03/2024
% Tresholding Local

function LaraChaves_TP2_G(Ficheiro, S, GRAF)
    % Leitura da imagem
    imagem = imread(Ficheiro);
    
    % Conversão para escala de cinza, se necessário
    IC = rgb2gray(imagem);
    
    % Tamanho da imagem
    [linhas, colunas] = size(IC);
    
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
    for k = 1:size(coordenadasIniciais, 1)
        bloco = IC(coordenadasIniciais(k, 1):coordenadasFinais(k, 1), coordenadasIniciais(k, 2):coordenadasFinais(k, 2));
        levelOtsuLocal = graythresh(bloco);
        imagemBinaria(coordenadasIniciais(k, 1):coordenadasFinais(k, 1), coordenadasIniciais(k, 2):coordenadasFinais(k, 2)) = imbinarize(bloco, levelOtsuLocal);
    end
    
    % Apresentação dos resultados, se GRAF=1
    if GRAF
        subplot(1, 3, 1), imshow(IC), title('Imagem de Tons de Cinzento (IC)');
        
        
        levelOtsuGlobal = graythresh(IC);
        IGlobal = imbinarize(IC, levelOtsuGlobal);
        subplot(1, 3, 2), imshow(IGlobal), title(['Tresholding Global (Otsu) - Tg_{Otsu} = ' num2str(uint8(levelOtsuGlobal * 255))]);
        
        subplot(1, 3, 3), imshow(imagemBinaria), title(['Tresholding Local - S = ' num2str(S)]);
    end
end