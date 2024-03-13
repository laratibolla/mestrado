%%
clear all
close all
clc
home

%% obter eigenFaces
[matPCA, volPCA] = eigenFaces;

%% ler uma imagem, obter a reconstru��o e classificar

lista = dir('C:\Users\TEMP\MAIE\1� Ano\1� Semestre\An�lise e Processamento de Imagem\TPs\13\API-P13\testes\*jpg');
numImages = length(lista);

for i = 1:numImages
    % fileIn = lista(randi(numImages)),name;
    fileIn = lista(i).name;
    imgIn = imread(['C:\Users\TEMP\MAIE\1� Ano\1� Semestre\An�lise e Processamento de Imagem\TPs\13\API-P13\testes\' fileIn]);
    
    % reconstru��o
    img = double(imgIn(:));
    x = matPCA\img; % Ax = b  --> x = b\A
    % minimiza o erro quadr�tico m�dio, d� um vector x que mais se pare�a
    % com b
    % quando |b' - b| < delta a reconstru��o � boa. delta � � escolha
    
    imgOut = 0;
    for j = 1:size(matPCA, 2)
        imgOut = imgOut + x(j)*matPCA(:,j);
    end
    imgOut = uint8(reshape(imgOut, size(imgIn,1), size(imgIn,2)));
    figure('name', fileIn); imshow(imgIn)
    
    %.........
    
end