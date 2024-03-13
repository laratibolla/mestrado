%API TP2 Ex.B
%Lara Tibolla Chaves    Entrega: 14/03/2024

%  Componentes RGB e HSV

function LaraChaves_TP2_B(imagem)
    % (1) a imagem original
    imgOriginal = imread(imagem);
    whos imgOriginal

    figure;
    imshow(imgOriginal), title('Imagem Original');
   
    % (2) as componentes RGB e os seus histogramas (subplot de 2×3)
    figure;
    R=imgOriginal(:,:,1);
    subplot(2,3,1), imshow(R), title('Componetes Red'); 
    subplot(2,3,4), imhist(R), title('Histograma Componentes Red');
    G=imgOriginal(:,:,2);
    subplot(2,3,2), imshow(G), title('Componentes Green');
    subplot(2,3,5), imhist(G), title('Histograma Componentes Green');
    B=imgOriginal(:,:,3);
    subplot(2,3,3), imshow(B), title('Componetes Blue');
    subplot(2,3,6), imhist(B), title('Histograma Componentes Blue');
 
   % (3) as componentes HSV e os seus histogramas (subplot de 2×3).
    imgHSV = rgb2hsv(imgOriginal);
    whos imgHSV

    figure;
    imshow(imgHSV);

    figure;
    H=imgHSV(:,:,1);
    subplot(2,3,1); imshow(H), title('Componentes Hue');
    subplot(2,3,4), imhist(H), title('Histograma Componentes Hue');
    S=imgHSV(:,:,2);
    subplot(2,3,2); imshow(S), title('Componentes Saturation');
    subplot(2,3,5); imhist(S), title('Histograma Componentes Saturation');
    V=imgHSV(:,:,3);
    subplot(2,3,3); imshow(V), title('Componentes Value');
    subplot(2,3,6), imhist(V), title('Histograma Componentes Value');

end