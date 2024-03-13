%% Aula13 (grupo 7)
function [matPCA, volPCA] = eigenFaces
clear all
close all
clc

%% 1a parte - ler todas as imagens
listaJPG = dir('C:\Users\TEMP\MAIE\1º Ano\1º Semestre\Análise e Processamento de Imagem\TPs\13\API-P13\caras\*.jpg');
numFotos = length(listaJPG);
mImg = [];
for i = 1:numFotos
    fileIn = ['C:\Users\TEMP\MAIE\1º Ano\1º Semestre\Análise e Processamento de Imagem\TPs\13\API-P13\caras\' listaJPG(i).name];
    imgIn = imread(fileIn);
    mImg(:,end+1) = double(reshape(imgIn, prod(size(imgIn)), 1));
%     figure('name', fileIn); imshow(imgIn)
end

matcov = cov(mImg);
[V,D] = eig(matcov);

volPCA = [];
for i = 1:numFotos
    PCA_i = mImg*V(:,numFotos-i+1);
    volPCA(:,:,i) = reshape(PCA_i, size(imgIn,1), size(imgIn,2));
%     figure('name', ['PCA_' num2str(i)]); imshow(volPCA(:,:,i),[]);
end

matPCA = [];
for i = 1:numFotos
    matPCA(:,end+1) = reshape(volPCA(:,:,i), size(imgIn,1)*size(imgIn,2),1);
end

return