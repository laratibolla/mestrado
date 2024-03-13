%API TP2 Ex.H
%Lara Tibolla Chaves    Entrega: 14/03/2024

%Script: Avaliaçao do desempenho de TLocal

 
imagem = imread('Aguia.jpg'); 

imgCinza = rgb2gray(imagem);
nivelOtsu = graythresh(imgCinza);
IBO = imbinarize(imgCinza, nivelOtsu);

[linhas, colunas, canais] = size(imagem);

% Calcula os índices para dividir a imagem em quatro partes iguais
meio_linhas = round(linhas / 2);
meio_colunas = round(colunas / 2);

% Divide a imagem em quatro partes
parte1 = IBO(1:meio_linhas, 1:meio_colunas, :);
parte2 = IBO(1:meio_linhas, meio_colunas+1:end, :);
parte3 = IBO(meio_linhas+1:end, 1:meio_colunas, :);
parte4 = IBO(meio_linhas+1:end, meio_colunas+1:end, :);

figure;
subplot(2,2,1), imshow(parte1)
subplot(2,2,2), imshow(parte2)
subplot(2,2,3), imshow(parte3)
subplot(2,2,4), imshow(parte4)

%CHECK IF THE IMAGE IS HOMOGENEA
%IF NO - APLY TRASHROLDING
%IF YES - DECIDES IF ALL SUB IMAGE IS 0 OR 1 (COLOR)
