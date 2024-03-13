%API TP1 Ex.A1
%Lara Tibolla Chaves    21/02/2024

% Fase 1: Script Tabuleiro Xadrez

% Tabuleiro Simples
    CasaBranca = zeros(32);
    CasaNegra = 255 * ones(32);
    QuadroBase = [CasaBranca CasaNegra; CasaNegra CasaBranca]; %Matriz (4casasx4casas)
    IM2 = [QuadroBase QuadroBase; QuadroBase QuadroBase];
    SimpleCB = [IM2 IM2; IM2 IM2];

    % Iluminação
    vl = 0:255;
    vc = ones(256, 1);
    Gradiente = vc * vl;
    Sombra = mat2gray(Gradiente);
    IntensidadeMaxima = 0.9;
    IntensidadeMinima = 0.2;
    Luminosidade = IntensidadeMaxima - IntensidadeMinima;
    ILUM3 = IntensidadeMaxima - Luminosidade * Sombra;

    % Imagem Final do Tabuleiro
    FinalCB = uint8(SimpleCB .* ILUM3);

    % Mostrar resultados
    subplot(1, 3, 1), imshow(SimpleCB), title('Tabuleiro Simples');
    subplot(1, 3, 2), imshow(ILUM3), title('Iluminação');
    subplot(1, 3, 3), imshow(FinalCB), title('Iluminação no Tabuleiro');