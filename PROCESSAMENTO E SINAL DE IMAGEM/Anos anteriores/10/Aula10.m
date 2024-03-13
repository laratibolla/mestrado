%% Aula10 - processamento de imagem médica (grupo 7)
clear all
close all
clc

%% 1a parte - tornar imagem RGB em grayscale e fazer espectros

img = imread('API-TP10_Red', 'jpg'); % função para ler a imagem
img = double(rgb2gray(img));
figure, imshow(uint8(img))

imgf = fft2(img);% transformada da imagem em grayscale
imgsh = fftshift(imgf); % shift da transformada

ampl = 10*log10(abs(imgsh)); % obter as amplitudes da fft da imagem
figure, mesh(ampl), view(2), title('espectro de amplitude original')
fase = angle(imgsh); % obter as fases da fft da imagem
figure, mesh(fase), view(2), title('espectro de fase original')

%% 2a parte - aplicar um filtro à imagem e refazer os espectros

Fdisk = fspecial('disk', 10); % criar um filtro
img_f = filter2(Fdisk, img); % aplicar o filtro
% refazer as transformadas
imgf2 = fft2(img_f);
imgsh2 = fftshift(imgf2);
%refazer os espectros
ampl2 = 10*log10(abs(imgsh2));
figure, mesh(ampl2), view(2), title('espectro de amplitude com filtro do tipo "disk" na imagem')
fase2 = angle(imgsh2);
figure, mesh(fase2), view(2), title('espectro de fase com filtro do tipo "disk" na imagem')

%% 3a parte - aplicação de diferentes filtros e comparação dos espectros

Favg = fspecial('average', 40); % criar um filtro
img_f3 = filter2(Favg, img); % aplicar o filtro
% refazer as transformadas
imgf3 = fft2(img_f3);
imgsh3 = fftshift(imgf3);
%refazer os espectros
ampl3 = 10*log10(abs(imgsh3));
figure, mesh(ampl3), view(2), title('espectro de amplitude com filtro de médias na imagem')
fase3 = angle(imgsh3);
figure, mesh(fase3), view(2), title('espectro de fase com filtro de médias na imagem')

Fdisk4 = fspecial('disk', 20); % criar um filtro
img_f4 = filter2(Fdisk4, img); % aplicar o filtro
% refazer as transformadas
imgf4 = fft2(img_f4);
imgsh4 = fftshift(imgf4);
%refazer os espectros
ampl4 = 10*log10(abs(imgsh4));
figure, mesh(ampl4), view(2), title('esp. de amplitude com filtro do tipo "disk" mais proeminente')
fase4 = angle(imgsh4);
figure, mesh(fase4), view(2), title('esp. de fase com filtro do tipo "disk" mais proeminente')
