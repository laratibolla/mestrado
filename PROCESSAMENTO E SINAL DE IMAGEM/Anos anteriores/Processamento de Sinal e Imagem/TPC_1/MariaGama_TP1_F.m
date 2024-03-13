%Avaliação dos filtros espaciais para redução de ruido

%Criado por Maria Gama a 10/03/2021

%não consegui encontrar uma solução para fazer variar o ruído, então pensei
%fazer uma função e assim já conseguiamos fazer variar o valor dos ruidos
function []=MariaGama_TP1_F(ruidosalt, ruidogauss)

IM=imread("Robot_BW.tif");
IR=imnoise(IM,'salt & pepper',ruidosalt);
x=1:2:15;
ymedia=[];
ymediana=[];

    for f=1:2:15
       ymedia=[ymedia, mean2(abs(imfilter(IR,fspecial('average',f)))-abs(IM))];
    end
    
    for f=1:2:15
      ymediana=[ymediana,mean2(abs(medfilt2(IR,[f f]) - abs(IM)))];
    end
    
figure(1)
plot(x,ymedia,x,ymediana)
title('Gráfico do erro vs dimensão do filtro para ruido sal e pimenta')
xlabel('Dimensão do filtro')
ylabel('Erro')
legend('Média sal e pimenta','Mediana sal e pimenta')

%Fazendo o mesmo para o ruido gaussiano   
IRR=imnoise(IM,'gaussian', ruidogauss);
ymediagauss=[];
ymedianagauss=[];
    for f=1:2:15
       ymediagauss=[ymediagauss, mean2(abs(imfilter(IRR,fspecial('average',f)))-abs(IM))];
    end

    for f=1:2:15
       ymedianagauss=[ymedianagauss,mean2(abs(medfilt2(IRR,[f f]) - abs(IM)))];
    end


figure (2)
plot(x,ymediagauss,x,ymedianagauss)
title('Gráfico do erro vs dimensão do filtro para ruido gaussiano')
xlabel('Dimensão do filtro')
ylabel('Erro')
legend('Média gaussiano','Mediana gaussiano')
end