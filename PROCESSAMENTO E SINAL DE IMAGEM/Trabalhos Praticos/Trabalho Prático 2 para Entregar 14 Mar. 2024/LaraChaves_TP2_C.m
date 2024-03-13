%API TP2 Ex.C
%Lara Tibolla Chaves    Entrega: 14/03/2024

% Equalizaçao nos modelos RGB e HSV

function LaraChaves_TP2_C(imagem)
  % imagem original
    imgOriginal = imread(imagem);
    whos imgOriginal

    figure;
    subplot(1,3,1), imshow(imgOriginal), title("Original");
  % imagem RGB equalizada
    imgEqualizadaRGB = histeq(imgOriginal);
    subplot(1,3,2), imshow(imgEqualizadaRGB), title('RGB Equalizada');

  % imagem HSV e HSV equalizada
    imgHSV=rgb2hsv(imgOriginal);
    imgEqualizadaHSV=imgHSV;
    imgEqualizadaHSV(:,:,3)=histeq(imgHSV(:,:,3));
    imgAux=hsv2rgb(imgEqualizadaHSV);
    imgEqualizadaHSV=uint8(255*imgAux);
    subplot(1,3,3), imshow(imgEqualizadaHSV), title('HSV Equalizada');

end