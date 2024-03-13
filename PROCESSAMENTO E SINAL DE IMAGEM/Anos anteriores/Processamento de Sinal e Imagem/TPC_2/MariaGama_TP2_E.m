%Deteção de contornos em imagem RGB

%Criado por Maria Gama a 12/03/2021

function []= MariaGama_TP2_E(imagem)
IO=imread(imagem);
figure (1)
subplot(2,2,1), imshow(IO), title("imagem original")

hPh1 = fspecial("prewitt"); %filtro horizontal
CH1=imfilter(IO, hPh1);
hPh2=-hPh1;
CH2=imfilter(IO, hPh2);
CHtotal=CH1+CH2;

subplot(2,2,2), imshow(CHtotal), title("contornos horizontais")

hPv1=hPh1'; %filtro vertical
CV1=imfilter(IO, hPv1);
hPv2=-hPv1;
CV2=imfilter(IO, hPv2);
CVtotal=CV1+CV2;

subplot(2,2,3), imshow(CVtotal), title("contornos verticais")

CHCV=max(CHtotal,CVtotal);
subplot(2,2,4), imshow(CHCV), title("contornos horizontais e verticais")

figure(2)
a=size(IO);
linha=a(1);
coluna=a(2);

linhacentral=round(linha/2);
colunacentral=round(coluna/2);

linhas=1:linha;
colunas=1:coluna;

figure(2)
subplot(2,3,1),plot(linhas, IO(:,colunacentral,1), 'r', linhas, IO(:,colunacentral,2), 'g', linhas, IO(:,colunacentral,3), 'b'), title("Corte vertical-imagem original")
subplot(2,3,2),plot(linhas, CHtotal(:,colunacentral,1), 'r', linhas, CHtotal(:,colunacentral,2), 'g', linhas, CHtotal(:,colunacentral,3), 'b'), title("Corte vertical-contornos H")
subplot(2,3,3),plot(linhas, CVtotal(:,colunacentral,1), 'r', linhas, CVtotal(:,colunacentral,2), 'g', linhas, CVtotal(:,colunacentral,3), 'b'), title("Corte vertical-contornos V")
subplot(2,3,4),plot(colunas, IO(linhacentral,:,1), 'r', colunas, IO(linhacentral,:,2), 'g', colunas, IO(linhacentral,:,3), 'b'), title("Corte horizontal-imagem original")
subplot(2,3,5),plot(colunas, CHtotal(linhacentral,:,1), 'r', colunas, CHtotal(linhacentral,:,2), 'g', colunas, CHtotal(linhacentral,:,3), 'b'), title("Corte horizontal-contornos H")
subplot(2,3,6),plot(colunas, CVtotal(linhacentral,:,1), 'r', colunas, CVtotal(linhacentral,:,2), 'g', colunas, CVtotal(linhacentral,:,3), 'b'), title("Corte horizontal-contornos V")

end