% API TP1 Ex.B3
%Lara Tibolla Chaves    Data Entrega: 29/02/2024

%Original + 5 correçoes γ (com valores <1 e >1)

% Carregando a imagem original
ImagemOriginal = imread("RobotC.tif");

% janela
figure;

% mostrar imagem original
subplot(2, 3, 1), imshow(ImagemOriginal), title('Original');

% definindo escala de correçao com valores <1 e >1)
gama = [0.1, 0.5, 1, 2, 3];

% aplicando correção gama para cada valor
for i = 1:length(gama)
    ImagemCorrigidaGama = imadjust(ImagemOriginal, [], [], gama(i));
    
    % mostrar imagem com correçao aplicada
    subplot(2, 3, i + 1), imshow(ImagemCorrigidaGama),title(['Correção Gama ' num2str(gama(i))]);
end