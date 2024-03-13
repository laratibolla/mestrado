%% Aula13 - compressão de imagens (grupo 7)
clear all
close all
clc

% coordenadas homogéneas: (wx, wy, w) em que w é o factor de normalização
% que transforma wx em x e wy em y
% exemplo: ponto (1,2) é (1,2,1) ou (10,20,10)
% matriz A 3x3 tal que: Xb(vector) = A Xa(vector)
% A = [a11 a12 a13
%       a21 a22 a23
%       a31 a32 1]
% estamos basicamente a calcular a correlação de uma imagem com outra e a
% calcular a matrix de correlação, A, que representa todas as
% transformações que geraram a imagem 2 a partir da imagem 1
% usamos a relação entre alguns pontos para calcular as 8 incógnitas
% restantes na matriz A
% ficamos com um sistema linear de equações do tipo:
% [Xa Ya 1 0 0 0 (-XbXa) (-XbYa)|*[a11, a12, a13, a21, a22, a23, a31, a32] = [Xb, Yb]
% |0 0 0 Xa Ya (-YbXa) (-YbYa)]

%% 1a parte - ler todas as imagens

img1 = imread('C:\Users\hp\FCTUC_EF\MAIE\1º Ano\1º Semestre\Análise e Processamento de Imagem\TPs\14\API-P13\Sets\Set07\01.jpg');
img2 = imread('C:\Users\hp\FCTUC_EF\MAIE\1º Ano\1º Semestre\Análise e Processamento de Imagem\TPs\14\API-P13\Sets\Set07\02.jpg');

figure, imshow(img1)
figure, imshow(img2)
img1 = double(img1);
img2 = double(img2);

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

