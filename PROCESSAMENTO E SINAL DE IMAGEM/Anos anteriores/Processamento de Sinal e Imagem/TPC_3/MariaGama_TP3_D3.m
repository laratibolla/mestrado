%outras operações morfológicas - Skeleton

%Criado por Maria Gama a 31/03/2021


% L é o numero de interações. 
%No video é mostrada a imagem binária inicial e é tambem nmostrada a imagem
%com o numero maximo de interações(inf)
function []= MariaGama_TP3_D3(imagem,L)
IBf=MariaGama_TP3_A1(imagem,0);
vidObj1=VideoWriter("Skeleton.avi");
vidObj1.FrameRate = 4;
open(vidObj1);
writeVideo(vidObj1,IBf);
for f=1:5:L
    IB = bwmorph(IBf,"skel",f);
    IBS=255*uint8(IB);
    writeVideo(vidObj1,IBS);
end
IBinf = bwmorph(IBf,"skel",Inf);
IBinf=255*uint8(IBinf);
writeVideo(vidObj1,IBinf);
close(vidObj1);
end
