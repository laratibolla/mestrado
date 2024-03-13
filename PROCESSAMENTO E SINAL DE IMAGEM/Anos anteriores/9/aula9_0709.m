%% Aula9 - processamento de retinografia (grupo 7)
clear all
close all
clc

% 1 - apresentar a imagem
img = imread('retinotesteRed', 'jpg'); % fun��o para ler a imagem
figure
imshow(img), title('retinografia') % fun��o para mostrar a imagem, com o titulo apresentado

% 2 - converter para grayscale
img2 = rgb2gray(img); % transforma a imagem tipo RGB em imagem de intensidades
figure
imshow(img2), title('retinografia grayscale')

% 3 - utiliza��o de filtros
img_m = double(img2); % cria uma imagem c�pia tipo double
Av = fspecial('average', 15); % cria filtro de m�dias com hsize 50

img_avg = filter2(Av, img_m); % aplica��o dos filtros � imagem c�pia
figure
imshow(uint8(img_avg)), title('retinografia com filtro de m�dias') % para apresentar a imagem

img_h = img_m./(img_avg + 1);
figure
imshow(img_h, []), title('retinografia com corre��o de homogeneidade')

figure
subplot(2,1,1), imhist(uint8(img_m)), title('histograma da imagem original')
subplot(2,1,2), imhist(uint8(img_h)), title('histograma da imagem homogeneizada')
