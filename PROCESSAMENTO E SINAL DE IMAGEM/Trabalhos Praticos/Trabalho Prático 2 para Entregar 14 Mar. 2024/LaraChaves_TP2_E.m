%API TP2 Ex.D
%Lara Tibolla Chaves    Entrega: 14/03/2024

% Deteçao de contornos em imagem RGB

function LaraChaves_TP2_E(imagem)
imgOriginal=imread(imagem);
figure;
subplot(2,2,1), imshow(imgOriginal), title('Original');

%filtro horizontal
filtrohorizontal = fspecial("prewitt"); 
CH1=imfilter(imgOriginal, filtrohorizontal);
filtroh2=filtrohorizontal.*-1;  
CH2=imfilter(imgOriginal, filtroh2);
CHtotal=CH1+CH2;

subplot(2,2,2), imshow(CHtotal), title('Contornos Horizontais')

%filtro vertical
filtrovertical=filtrohorizontal'; 
CV1=imfilter(imgOriginal, filtrovertical);
filtrov2=filtrovertical.*-1;;
CV2=imfilter(imgOriginal, filtrov2);
CVtotal=CV1+CV2;

subplot(2,2,3), imshow(CVtotal), title('Contornos Verticais');

CHCV=max(CHtotal,CVtotal);
subplot(2,2,4), imshow(CHCV), title('Contornos Horizontais e Verticais');

a=size(imgOriginal);
linha=a(1);
coluna=a(2);

linhacentral=round(linha/2);
colunacentral=round(coluna/2);

linhas=1:linha;
colunas=1:coluna;


figure;
subplot(2,3,1), plot(linhas, imgOriginal(:, colunacentral, 1), 'R', linhas, imgOriginal(:, colunacentral, 2), 'G', linhas, imgOriginal(:, colunacentral, 3), 'B'), title('CV: Original');
subplot(2,3,2), plot(linhas, CHtotal(:, colunacentral, 1), 'R', linhas, CHtotal(:, colunacentral, 2), 'G', linhas, CHtotal(:, colunacentral, 3), 'B'), title('CV - Contornos H');
subplot(2,3,3), plot(linhas, CVtotal(:, colunacentral, 1), 'R', linhas, CVtotal(:, colunacentral, 2), 'G', linhas, CVtotal(:, colunacentral, 3), 'B'), title('CV - Contornos V');
subplot(2,3,4), plot(colunas, imgOriginal(linhacentral, :, 1), 'R', colunas, imgOriginal(linhacentral, :, 2), 'G', colunas, imgOriginal(linhacentral, :, 3), 'B'), title('CH - Original');
subplot(2,3,5), plot(colunas, CHtotal(linhacentral, :, 1), 'R', colunas, CHtotal(linhacentral, :, 2), 'G', colunas, CHtotal(linhacentral, :, 3), 'B'), title('CH - Contornos H');
subplot(2,3,6), plot(colunas, CVtotal(linhacentral, :, 1), 'R', colunas, CVtotal(linhacentral, :, 2), 'G', colunas, CVtotal(linhacentral, :, 3), 'B'), title('CH - Contornos V');

end