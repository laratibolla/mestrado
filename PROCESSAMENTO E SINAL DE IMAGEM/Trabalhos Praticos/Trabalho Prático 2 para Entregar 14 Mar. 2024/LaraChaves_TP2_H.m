%API TP2 Ex.H
%Lara Tibolla Chaves    Entrega: 15/03/2024

%Script: Avaliaçao do desempenho de TLocal - (usei TDR e TNR)

imgOriginal = imread("Aguia.jpg");
REF = imread("Aguia.jpg");
[NL, NC, ~] = size(imgOriginal);
TOtsu = graythresh(imgOriginal);
Otsu = uint8(255 * TOtsu);
erro = zeros(1, 15);

for S = 1:15
    IBL = zeros(NL, NC);
    for L = 1:S
        for C = 1:S
            NCb = round(NC / S);
            NLb = round(NL / S);
            PC = 1:NCb:(S-1)*NCb+1;
            UC = [NCb:NCb:(S-1)*NCb NC];
            PL = 1:NLb:(S-1)*NLb+1;
            UL = [NLb:NLb:(S-1)*NLb NL];
            SUB = imgOriginal(PL(L):UL(L), PC(C):UC(C));
            if std2(SUB) < 10
                if mean2(SUB) > (TOtsu * 255)
                    SUB = ones(size(SUB));
                    OtsuSUB = graythresh(SUB);
                else
                    SUB = zeros(size(SUB));
                    OtsuSUB = graythresh(SUB);
                end
            else
                OtsuSUB = graythresh(SUB);
            end
            binaria = imbinarize(SUB, OtsuSUB);
            IBL(PL(L):UL(L), PC(C):UC(C)) = binaria;
        end
    end
    intersecao = IBL & REF;
    uniao = IBL | REF;
    jaccard = sum(intersecao(:)) / sum(uniao(:));
    erro(S) = jaccard;
end

plot(1:15, erro);
title("Avaliação de desempenho: TLocal");
xlabel("Valor de S");
ylabel("Erro - Índice de Jaccard");