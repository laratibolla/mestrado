% S3 - cria grafico das funçoes seno e coseno

x=0:pi/100:4*pi;
y1=sin(x);
y2=cos(x);
plot(x,y1,x,y2)
xlabel('x')
ylabel('f(x)')
title('Grafico das funcoes seno e coseno')
legend('sen(x)','cos(x)')