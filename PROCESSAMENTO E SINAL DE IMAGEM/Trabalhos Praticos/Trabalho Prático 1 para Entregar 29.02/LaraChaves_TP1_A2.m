%API TP1 Ex.A2
%Lara Tibolla Chaves    29/02/2024

%Fase 2: Funçao

% Pametros:
% - TamanhoImagem = Valor em Pixels. Deve ser > 0
% - IntensidadeMaxima, IntensidadeMinima = Intensidade da luminosidade (Intensidade x 255),
% onde 0 = preto, 1 = branco
function FinalCB=LaraChaves_TP_A2(TamanhoImagem, IntensidadeMaxima, IntensidadeMinima)
    % Tabuleiro Simples
    TamanhoCasaTabuleiro = TamanhoImagem/8;
    TamanhoCasaTabuleiroArredondado = floor(TamanhoCasaTabuleiro); % floor(numero) arredonda o numero para o primeiro inteiro abaixo
    TamanhoLadoImagem = TamanhoCasaTabuleiroArredondado * 8;

    CasaBranca = zeros(TamanhoCasaTabuleiroArredondado);
    CasaNegra = 255 * ones(TamanhoCasaTabuleiroArredondado);
    QuadroBase = [CasaBranca CasaNegra; CasaNegra CasaBranca]; %Matriz (4casasx4casas)
    IM2 = [QuadroBase QuadroBase; QuadroBase QuadroBase];
    SimpleCB = [IM2 IM2; IM2 IM2];

    % Iluminação 20% direita / 90% esquerda
    vl = 0:TamanhoLadoImagem-1;
    vc = ones(TamanhoLadoImagem, 1);
    Gradiente = vc * vl;
    Sombra = mat2gray(Gradiente); 
    Luminosidade = IntensidadeMaxima - IntensidadeMinima;
    ILUM3 = IntensidadeMaxima - Luminosidade * Sombra;

    % Imagem Final do Tabuleiro
    FinalCB = uint8(SimpleCB .* ILUM3);

    % Mostrar resultados
    subplot(1, 3, 1), imshow(SimpleCB), title('Tabuleiro Simples');
    subplot(1, 3, 2), imshow(ILUM3), title('Iluminação');
    subplot(1, 3, 3), imshow(FinalCB), title('Iluminação no Tabuleiro');
end