%Videos-filtros espaciais

%Criado por Maria Gama a 31/03/2021

function [] = MariaGama_TP3_D2(imagem,L)
IM=imread(imagem);
[NL,NC,NB]=size(IM);
vidObj1=VideoWriter("Media.avi");
vidObj1.FrameRate = 1; %1 frame por segundo para melhor visualização
open(vidObj1);
writeVideo(vidObj1,IM);
vidObj2=VideoWriter("Mediana.avi");
vidObj2.FrameRate = 1;
open(vidObj2);
writeVideo(vidObj2,IM);

%ciclo principal
for f=1:2:L
    ff=fspecial("average",f);
    Iout1=imfilter(IM, ff,"replicate");
    writeVideo(vidObj1,Iout1);
    
    if NB~=3
        Iout2=medfilt2(IM,[f f],"symmetric");
        writeVideo(vidObj2,Iout2);
    elseif NB==3
        Iout2(:,:,1)= medfilt2(IM(:,:,1),[f f]);
        Iout2(:,:,2)= medfilt2(IM(:,:,2),[f f]);
        Iout2(:,:,3)= medfilt2(IM(:,:,3),[f f]);
        writeVideo(vidObj2,Iout2);
    end   
end
%fechar ficheiro
close(vidObj1);
close(vidObj2);
end