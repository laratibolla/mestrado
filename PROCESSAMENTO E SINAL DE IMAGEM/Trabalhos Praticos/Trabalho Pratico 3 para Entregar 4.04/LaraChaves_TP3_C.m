% %API TP3 Ex.C
%Lara Tibolla Chaves    Entrega: 08/04/2024

%  Videos com operacoes morfologicas

function LaraChaves_TP3_C (imagem)
IB = LaraChaves_TP3_A1(imagem,0);

%abrir ficheiro
vidObj1=VideoWriter("Erosao.avi");
vidObj2=VideoWriter("Dilatação.avi");
vidObj3=VideoWriter("Abertura.avi");
vidObj4=VideoWriter("Fecho.avi");
open(vidObj1);
open(vidObj2);
open(vidObj3);
open(vidObj4);

%ciclo principal
for f=1:50
    EE3 = strel("disk",f,0);
    IBnew1 = imerode(IB,EE3);
    VIDframe1=255*uint8(IBnew1);
    writeVideo(vidObj1,VIDframe1);
    
    IBnew2 = imdilate(IB,EE3);
    VIDframe2=255*uint8(IBnew2);
    writeVideo(vidObj2,VIDframe2);
    
    IBnew3 = imopen(IB,EE3);
    VIDframe3=255*uint8(IBnew3);
    writeVideo(vidObj3,VIDframe3);
    
    
    IBnew4 = imclose(IB,EE3);
    VIDframe4=255*uint8(IBnew4);
    writeVideo(vidObj4,VIDframe4);
end
%fechar ficheiro
close(vidObj1);
close(vidObj2);
close(vidObj3);
close(vidObj4);
end