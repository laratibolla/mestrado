function []=MariaGama_TP1_E(imagem, ruido)
IO=imread(imagem);

subplot(2,3,1)
imshow(IO)
title("imagem original")

subplot(2,3,2)
IR=imnoise(IO, "salt & pepper",ruido); 
erro1= mean2(abs(IR)-abs(IO));
imshow(IR)
title("imagem contaminada. Erro="+erro1)
%legend("ruido=0.15")

subplot(2,3,3)
media3=fspecial("average",3);
IRmean3=imfilter(IR,media3,"symmetric");
erro2= mean2(abs(IRmean3)-abs(IO));
imshow(IRmean3)
title("filtro media 3x3. Erro="+erro2)

subplot(2,3,4)
media5=fspecial("average",5);
IRmean5=imfilter(IR,media5,"symmetric"); 
erro3= mean2(abs(IRmean5)-abs(IO));
imshow(IRmean5)
title("filtro media 5x5. Erro="+erro3)

subplot(2,3,5)
IRmedian3=medfilt2(IR,[3 3],"symmetric");
erro4= mean2(abs(IRmedian3)-abs(IO));
imshow(IRmedian3)
title("filtro mediana 3x3. Erro="+erro4)

subplot(2,3,6)
IRmedian5=medfilt2(IR,[5 5],"symmetric");
erro5= mean2(abs(IRmedian5)-abs(IO));
imshow(IRmedian5)
title("filtro mediana 5x5. Erro="+erro5)

end
