% Equalizacao nos modelos RGB e HSV
%Criado por Maria Gama a 12/03/2021

function []= MariaGama_TP2_C(imagem)
IM=imread(imagem);
%display images
subplot(1,3,1)
imshow(IM), title("Original")
IMeqRGB=histeq(IM); %o tamanho do ficheiro é o mesmo
subplot(1,3,2), imshow(IMeqRGB), title("Equalizada RGB")
IMhsv=rgb2hsv(IM);
IMhsveq=IMhsv;
IMhsveq(:,:,3)=histeq(IMhsv(:,:,3));
IMaux=hsv2rgb(IMhsveq);
IMeqHSV=uint8(255*IMaux);
subplot(1,3,3), imshow(IMeqHSV), title("Equalizada HSV")

end
