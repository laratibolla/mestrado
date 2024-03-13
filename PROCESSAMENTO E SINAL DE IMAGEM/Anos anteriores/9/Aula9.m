%% Aula9 - processamento de retinografia (grupo 7)
clear all
close all
clc

% 1 - apresentar a imagem
img = imread('retinotesteRed', 'jpg'); % função para ler a imagem
figure
imshow(img), title('retinografia') % função para mostrar a imagem, com o titulo apresentado

% 2 - converter para grayscale
img2 = rgb2gray(img); % transforma a imagem tipo RGB em imagem de intensidades
figure
imshow(img2), title('retinografia grayscale')

% 3 - utilização de filtros
img_m = img2; % cria uma imagem cópia
Av = fspecial('average', 10); % cria filtro de médias com hsize 50
% Dk = fspecial('disk', 10); % cria filtro de disco de raio 10
% Ga = fspecial('gaussian', 10, 0.5); % cria filtro gaussiano com hsize 10 e desvio 0.5
% La = fspecial('laplacian', 0.9); % cria filtro laplaciano com alpha 1 (alpha:[0,1])
% Lo = fspecial('log', 10, 0.5); % cria filtro logarítmico com hsize 10 e desvio 0.5
% Sh = fspecial('unsharp', 0.6); % cria filtro de sharpenning com alpha 0.6 (alpha:[0,1])

img_avg = imfilter(img_m, Av); % aplicação dos filtros à imagem cópia
% img_dk = imfilter(img_m, Dk);
% img_ga = imfilter(img_m, Ga);
% img_lap = imfilter(img_m, La);
% img_log = imfilter(img_m, Lo);
% img_shp = imfilter(img_m, Sh);

figure % para apresentar a imagem
% subplot(2,3,1)
imshow(img_avg), title('retinografia average')
% subplot(2,3,2), imshow(img_dk), title('retinografia disk')
% subplot(2,3,3), imshow(img_ga), title('retinografia gaussian')
% subplot(2,3,4), imshow(img_lap), title('retinografia laplacian')
% subplot(2,3,5), imshow(img_log), title('retinografia logarithm')
% subplot(2,3,6), imshow(img_shp), title('retinografia sharpened')
img_h = img_m./img_avg;
figure
imshow(img_h), title('retinografia com correção de homogeneidade')

figure
subplot(2,1,1), imhist(img_m)
subplot(2,1,2), imhist(img_h)
