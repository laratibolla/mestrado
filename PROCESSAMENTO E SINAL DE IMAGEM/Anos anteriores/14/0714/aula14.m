%% Aula13 - compressão de imagens (grupo 7)
clear all
close all
clc

%% 1a parte - ler todas as imagens (Set07)

img1 = imread('C:\Users\hp\FCTUC_EF\MAIE\1º Ano\1º Semestre\Análise e Processamento de Imagem\TPs\14\API-P13\Sets\Set07\01.jpg');
img2 = imread('C:\Users\hp\FCTUC_EF\MAIE\1º Ano\1º Semestre\Análise e Processamento de Imagem\TPs\14\API-P13\Sets\Set07\02.jpg');

figure, imshow(img1)
figure, imshow(img2)
img1 = double(img1);
img2 = double(img2);

% para o par de imagens Set07
pa1 = [47 153];
pb1 = [34 136];
pa2 = [197 61];
pb2 = [186 49];
pa3 = [122 61];
pb3 = [109 46];
pa4 = [249 164];
pb4 = [237 152];

b = [pb1(1); pb1(2); pb2(1); pb2(2); pb3(1); pb3(2); pb4(1); pb4(2)];
X = [pa1(1) pa1(2) 1 0 0 0 (-pb1(1)*pa1(1)) (-pb1(1)*pa1(2));...
    0 0 0 pa1(1) pa1(2) 1 (-pb1(2)*pa1(1)) (-pb1(2)*pa1(2));...
    pa2(1) pa2(2) 1 0 0 0 (-pb2(1)*pa2(1)) (-pb2(1)*pa2(2));...
    0 0 0 pa2(1) pa2(2) 1 (-pb2(2)*pa2(1)) (-pb2(2)*pa2(2));...
    pa3(1) pa3(2) 1 0 0 0 (-pb3(1)*pa3(1)) (-pb3(1)*pa3(2));...
    0 0 0 pa3(1) pa3(2) 1 (-pb3(2)*pa3(1)) (-pb3(2)*pa3(2));...
    pa4(1) pa4(2) 1 0 0 0 (-pb4(1)*pa4(1)) (-pb4(1)*pa4(2));...
    0 0 0 pa4(1) pa4(2) 1 (-pb4(2)*pa4(1)) (-pb4(2)*pa4(2))];

a = X\b;
a(end+1) = 1;
A = reshape(a,3,3);
A = A';
sz = size(img2);
for i = 1:sz(1)
    for j = 1:sz(2)
        f = A * [i; j; 1];
        if f(1) > f(3) && f(2) > f(3)
            imgn(round(f(1)/f(3)), round(f(2)/f(3))) = img2(i,j);
        end
    end
end

figure('name', 'imagem nova'),imshow(uint8(imgn))

