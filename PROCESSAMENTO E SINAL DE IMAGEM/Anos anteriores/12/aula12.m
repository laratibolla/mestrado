%% Aula12 - remoção de ruído periódico de uma imagem (grupo 7)
clear all
close all
clc

%% 1a parte - 
img = imread('API-Grupo (7)_mod','jpg');
img = double(img);
imgf = fft2(img);% transformada da imagem em grayscale
imgfs = fftshift(imgf); % shift da transformada
[a,b] = size(imgfs);

freq = 10*log10(abs(imgfs));
figure, mesh(freq), axis equal %neste grafico dá para ver o valor máx da freq
%como encontrar max de um grafico

[R,C] = find(freq>60); % localização das frequêcnias com valor absoluto
% maior que 60dB
A = [R(1), R(2), R(length(R)-1), R(length(R))];
B = [C(1), C(2), C(length(C)-1), C(length(C))];

F = ones(a,b); % filtro passa tudo ideal
% colocar no filtro F as posições das frequências que queremos
% eliminar a zero
F(A(1),B(1)) = 0;
F(A(2),B(2)) = 0;
F(A(3),B(3)) = 0;
F(A(4),B(4)) = 0;
figure, mesh(F), axis equal

imgfn = imgfs.*F;
imgnew = ifftshift(imgfn);
imgnew = ifft2(imgnew);
figure
subplot(1,2,1), imshow(uint8(img)), title('imagem original')
subplot(1,2,2), imshow(uint8(imgnew)), title('imagem filtrada')
