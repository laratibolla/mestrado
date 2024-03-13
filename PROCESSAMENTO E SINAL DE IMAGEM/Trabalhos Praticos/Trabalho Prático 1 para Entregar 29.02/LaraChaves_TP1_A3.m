%API TP1 Ex.A3
%Lara Tibolla Chaves    21/02/2024

%Fase 3: Funçao para ILAng e graf

function chessboard_image = LaraChaves_TP_A3(TamanhoImagem, IntensidadeMaxima, IntensidadeMinima, ILAng, graf)
    % tabuleiro Simples
    TamanhoCasaTabuleiro = TamanhoImagem/8;
    TamanhoCasaTabuleiroArredondado = floor(TamanhoCasaTabuleiro); % floor(numero) arredonda o numero para o primeiro inteiro abaixo
    TamanhoLadoImagem = TamanhoCasaTabuleiroArredondado * 8;
    
    CasaBranca = zeros(TamanhoCasaTabuleiroArredondado);
    CasaNegra = 255 * ones(TamanhoCasaTabuleiroArredondado);
    QuadroBase = [CasaBranca CasaNegra; CasaNegra CasaBranca]; % Matriz (4casasx4casas)
    IM2 = [QuadroBase QuadroBase; QuadroBase QuadroBase];
    SimpleCB = [IM2 IM2; IM2 IM2];

    % iluminação
    Luminosidade = IntensidadeMaxima - IntensidadeMinima;
    
    % conversao ângulo de graus para radianos
    AnguloRadianos = deg2rad(ILAng);

    % grade de coordenadas
    [X, Y] = meshgrid(1:TamanhoLadoImagem, 1:TamanhoLadoImagem);

    % calculo componentes x e y do gradiente com base no ângulo
    gradienteX= cos(AnguloRadianos);
    gradienteY = sin(AnguloRadianos);

    % calculo a matriz gradiente
    matrizSombra = gradienteX * X + gradienteY * Y;
    matrizGradiente = mat2gray(matrizSombra);
    matrizGradienteComFiltroDeIntensidade = IntensidadeMaxima - Luminosidade * matrizGradiente;

    % iagem Final do Tabuleiro
    FinalCB = uint8(SimpleCB .* matrizGradienteComFiltroDeIntensidade);

    % resultados se graf=1
    if graf == 1
        subplot(1, 3, 1), imshow(SimpleCB), title('Tabuleiro Simples');
        subplot(1, 3, 2), imshow(matrizGradienteComFiltroDeIntensidade), title('Iluminação');
        subplot(1, 3, 3), imshow(FinalCB), title('Iluminação no Tabuleiro');
    end

    % retornar a imagem do tabuleiro de xadrez
    ImagemTabuleiro = FinalCB;
end