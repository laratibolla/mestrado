%API TP2 Ex.A
%Lara Tibolla Chaves    Entrega: 14/03/2024

% Visualização de imagens de cor 

function LaraChaves_TP2_A(imagem)
  % (1) original RGB
    imgRGB = imread(imagem);
    R=imgRGB(:,:,1);
    G=imgRGB(:,:,2);
    B=imgRGB(:,:,3);
    figure;
    imshow(imgRGB), title('Original');
    
  % (2,3) vers˜oes de cor indexada a 8 cores com/sem ‘dither
    [ImgIndexada8, TabCor8] = rgb2ind(imgRGB, 8, 'nodither');
    [ImgIndexada8d, TabCor8d] = rgb2ind(imgRGB, 8, 'dither');
    figure;
    imshow(ImgIndexada8, TabCor8), title('8 Cores Sem Dither');
    figure;
    imshow(ImgIndexada8d, TabCor8d), title('8 Cores Com Dither');
    
  % (4) vers˜ao escala de cinzento (IG)
    ImgCinza = rgb2gray(imgRGB);
    figure;
    imshow(ImgCinza), title('Escala Cinza');

  % (5,6) IG com tabelas de cor ’jet’ e ’spring
    figure;
    imshow(ImgCinza, jet), title('Jet');

    figure;
    imshow(ImgCinza, spring), title('Spring');  

     
end

 