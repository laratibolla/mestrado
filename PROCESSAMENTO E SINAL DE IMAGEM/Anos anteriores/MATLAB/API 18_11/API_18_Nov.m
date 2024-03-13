%(read and convert the provided images into grayscale) - imread, rgb2gray, figure,imshow
%(compute de FT and its inverse) - fft2, fftshift, ifftshift, ifft2, abs, angle, log10

%CAROLINA SILVA E LÚCIA FERNANDES
% 18 de Novembro de 2019

%%

%ler e mostrar imagem
A=imread('API-XRay_mod.jpg');
figure 
imshow(A)

%transformada da imagem e centrar (mostrar o espetro de amplitudes)

f1=fft2(double(A));
ft1=fftshift(f1);
l1=10*log10(abs(ft1));
figure;
mesh(l1);

% built a gaussian notch filter
ll=linspace(-1,1,size(A,1)); %linhas
cc=linspace(-1,1,size(A,2)); %colunas

[CC,LL]=meshgrid(cc,ll); %mapa
ff=sqrt(CC.^2 + LL.^2);

w=0.10; fc=0.40;
fNotch=1-exp(-(ff-fc).^2/(2*w^2)); %função Gaussian Notch Filter
figure;
mesh(fNotch);

% apply filter
ft1 = ft1 .* fNotch;

%compute inverse
img_ifft = abs(ifft2(ifftshift(ft1)));

%show image without noise
figure
imshow(uint8(img_ifft)) 



