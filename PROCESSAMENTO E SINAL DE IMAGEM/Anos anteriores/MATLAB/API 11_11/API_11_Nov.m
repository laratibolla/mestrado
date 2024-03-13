%(read and convert the provided images into grayscale) - imread, rgb2gray, figure,imshow
%(compute de FT and its inverse) - fft2, fftshift, ifftshift, ifft2, abs, angle, log10

%CAROLINA SILVA E LÚCIA FERNANDES
% 11 de Novembro de 2019

%%

A=imread('API-TP10_Red.jpg');
figure
imshow(A)

IA=rgb2gray(A);
figure
imshow(IA)

B=imread('imagemTeste.jpg');
figure
imshow(B)

%A imagem B já está em grayscale
%IB=rgb2gray(B);
%figure
%imshow(IB)

f1=fft2(double(IA));
ft1=fftshift(f1);
l1=10*log10(ft1);
a1=abs(l1);
figure
mesh(a1)
ag1=angle(l1);
figure
mesh(ag1);


f2=fft2(double(B));
ft2=fftshift(f2);
l2=10*log10(ft2);
a2=abs(l2);
figure
mesh(a2)
ag2=angle(l2);
figure
mesh(ag2);


%imagem A
l2i=10*log10(f1);
ift1=abs(l2i);

%imagem B
ift2=angle(l2i);

%imagem C
l1i=10*log10(f2);
ift3=abs(l1i);

%imagem D
ift4=angle(l1i);

%fase da A com angle da D
ia1=ift1.*exp(1i*ift4);

%fase da C com angle da B
ia2=ift3.*exp(1i*ift2);

%valor absoluto das figuras
fig1=abs(ia1);
fig2=abs(ia2);

%representar as imagens
figure
imshow(fig1)
figure
imshow(fig2)


