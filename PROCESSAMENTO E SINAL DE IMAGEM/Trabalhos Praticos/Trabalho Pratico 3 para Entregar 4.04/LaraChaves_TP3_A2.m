% %API TP3 Ex.A2
%Lara Tibolla Chaves    Entrega: 08/04/2024

% Imagem com etiquetas

function [IEt,Nobj]=LaraChaves_TP3_A2(imagem, graf)
    imgOriginal = imread(imagem);
    imgBinaria = LaraChaves_TP3_A1(imagem,0);
    [IEt,Nobj] = bwlabel(imgBinaria,8);
    
    
    if graf==1
        subplot(1,3,1), imshow(imgOriginal), title("Original");
        subplot(1,3,2), imshow(imgBinaria), title("Binária");
        subplot(1,3,3), imshow(IEt), title(['Imagem de Etiquetas (', num2str(Nobj), ' objetos identificados)']);
    end
end