%vídeos-transformação gama

%Criado por Maria Gama a 25/04/2021

function []=MariaGama_TP3_D1(FichIM,Nframes,Gmin,Gmax)

IM=imread(FichIM);
vidObj1=VideoWriter("TGama.avi");
vidObj1.FrameRate = Nframes;
open(vidObj1);
%writeVideo(vidObj1,IM); %gama=1

for f=1:-0.01:Gmin
    g1=imadjust(IM,[],[],f);
    writeVideo(vidObj1,g1);
end

for f=Gmin:0.01:Gmax
    g2=imadjust(IM,[],[],f);
    writeVideo(vidObj1,g2);
end

for f=Gmax:-0.01:1
    g3=imadjust(IM,[],[],f);
    writeVideo(vidObj1,g3);
end
%fechar ficheiro
close(vidObj1);
end