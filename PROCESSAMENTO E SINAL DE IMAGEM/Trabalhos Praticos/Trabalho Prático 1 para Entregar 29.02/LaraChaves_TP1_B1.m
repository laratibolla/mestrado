% API TP1 Ex.B1
%Lara Tibolla Chaves    Data Entrega: 29/02/2024

%Original + 5 variaçao de contraste (com valores <1 e >1)

%Carregando a imagem
ImagemOriginal=imread("RobotC.tif");

%Criando uma nova figura
figure;

 % Mostra original na posição (1,1)
 subplot(2, 3, 1), imshow(ImagemOriginal), title("Original");

%Definindo os valores de contraste
contraste= [0.2, 0.5, 0.7, 1.6, 2.5];

%Aplicando contraste
for i = 1:length(contraste)
    contrasteAtual = contraste(i); % pega o valor na posiçao I do vetor de contrastes
    % Aplicando o contraste à imagem original de acordo com r: α r
    ImagemComContraste = uint8(double(ImagemOriginal) * contrasteAtual);
    % Garantindo que os valores dos pixels estejam no intervalo [0, 255]
    ImagemComContraste = max(min(ImagemComContraste, 255), 0);

   % Mostrar as imagens Original + imagens com contraste nas posições
    subplot(2, 3, i+1), imshow(ImagemComContraste), title(['Contraste ', num2str(contraste(i))]);
   
end