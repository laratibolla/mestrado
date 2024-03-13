% API TP1 Ex.C
%Lara Tibolla Chaves    Data Entrega: 29/02/2024

%Transformaçao Gama

function LaraChaves_TP1_C(nomeArquivo, gama)

    % carregando a imagem original
    ImagemOriginal = imread(nomeArquivo); %utilizar a imagem salva "RobotC.tif"

    %janela
    figure;

    % mostrar imagem original na posiçao 1
    subplot(2, 4, 1), imshow(ImagemOriginal), title('Original');

    % mostrar histograma da imagem original na posiçao 5
    subplot(2, 4, 5), imhist(ImagemOriginal), title('Histograma Original');

    % valores mínimo e máximo 
    minvalor = double(min(ImagemOriginal(:)));
    maxvalor = double(max(ImagemOriginal(:)));

    % Calculo parâmetros para a transformação linear ótimizada de acordo com α = Nr/(rmax − rmin) β = −α*rmin
    a = 255 / (maxvalor - minvalor);
    b = -a * minvalor;

    % aplicando a transformação linear otimizada
    ImagemTransformacaoLinear = uint8(a * double(ImagemOriginal) + b);

    % mostrar imagem com transformaçao otimizada
    subplot(2, 4, 2), imshow(ImagemTransformacaoLinear), title('Transformação Linear Ótima');

    % mostrar histograma da imagem com transformação linear
    subplot(2, 4, 6), imhist(ImagemTransformacaoLinear), title('Histograma Transformação Linear Ótima');

    % correção gama
    ImagemCorrigidaGama = imadjust(ImagemOriginal, [], [], gama);

    % mostrar imagem com correção gama
    subplot(2, 4, 3), imshow(ImagemCorrigidaGama), title(['Correção Gama (' num2str(gama) ')']);

    % mostrar histograma da imagem com correção gama
    subplot(2, 4, 7), imhist(ImagemCorrigidaGama), title(['Histograma Correção Gama (' num2str(gama) ')']);

    % equalizaçao
    ImagemEqualizada = histeq(ImagemOriginal);

    % mostrar imagem equalizada
    subplot(2, 4, 4), imshow(ImagemEqualizada), title('Equalizada');

    % mostrar histograma da imagem equalizada
    subplot(2, 4, 8), imhist(ImagemEqualizada), title('Histograma Equalizado');

end