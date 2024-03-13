% API TP1 Ex.B2
%Lara Tibolla Chaves    Data Entrega: 29/02/2024

% Original + 5 variaçao da luminosidade (com valores + e -)

% carregando a imagem original
ImagemOriginal=imread("RobotC.tif");

% janela
figure;

% mostrar imagem original
subplot (2,3,1), imshow(ImagemOriginal), title('Original');

% escala para luminosidade (com valores + e -)
luminosidade=[-60, -20 , 1 , 36 , 82];

% aplicando luminosidade na imagem original
for i = 1:length(luminosidade);
    ImagemIluminada = ImagemOriginal + luminosidade(i); %% Aplicando variação de luminosidade de acordo com r: r + β
    ImagemIluminada = max(min(ImagemIluminada, 255), 0); %Garantindo que os valores dos pixels estejam no intervalo [0, 255]

% mostrando imagens com variaçao de luminosidade + original
subplot(2,3,i+1), imshow(uint8(ImagemIluminada)), title(['Luminosidade' num2str(luminosidade(i))]);

end
