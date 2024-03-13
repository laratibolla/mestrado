% Escolher um valor para N
N = 4;

% Carregar a imagem
imageFile = 'Aguia.jpg';  % Substitua 'sua_imagem.jpg' pelo nome da sua imagem
originalImage = imread(imageFile);

% Conversão para escala de cinza se a imagem for RGB
if size(originalImage, 3) == 3
    grayImage = rgb2gray(originalImage);
else
    grayImage = originalImage;
end

% Tamanho da imagem
[rows, cols] = size(grayImage);

% Tamanho aproximado de cada sub-imagem
subImageSizeRow = ceil(rows / N);
subImageSizeCol = ceil(cols / N);

% Inicialização da imagem binária resultante
binaryImage = zeros(rows, cols);

% Loop sobre as sub-imagens
for i = 1:N
    for j = 1:N
        % Limites da sub-imagem atual
        rowStart = (i - 1) * subImageSizeRow + 1;
        rowEnd = min(i * subImageSizeRow, rows);
        colStart = (j - 1) * subImageSizeCol + 1;
        colEnd = min(j * subImageSizeCol, cols);

        % Sub-imagem atual
        subImage = double(grayImage(rowStart:rowEnd, colStart:colEnd));

        % Verificar se o bloco é uniforme
        if std(subImage(:)) < 10  % Ajuste este limiar conforme necessário
            % Se SIM, decidir o valor (0 ou 1) a atribuir a todo o bloco
            if mean(subImage(:)) > 128
                binaryImage(rowStart:rowEnd, colStart:colEnd) = 255;  % Branco
            else
                binaryImage(rowStart:rowEnd, colStart:colEnd) = 0;  % Preto
            end
        else
            % Se NAO, calcular TL (ex. com Otsu) e aplicar Thresholding ao bloco
            TLocal = graythresh(subImage / 255);
            binaryImage(rowStart:rowEnd, colStart:colEnd) = imbinarize(subImage / 255, TLocal) * 255;
        end
    end
end

% Exibir resultados
figure;
subplot(1, 2, 1), imshow(grayImage), title('Imagem Original em Tons de Cinza');
subplot(1, 2, 2), imshow(binaryImage), title('Resultado da Segmentação');

sgtitle(['Thresholding Local - Divisão em ', num2str(N), 'x', num2str(N), ' Sub-Imagens']);