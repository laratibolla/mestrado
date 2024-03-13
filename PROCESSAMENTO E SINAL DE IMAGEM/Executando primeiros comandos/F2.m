%Exemplo de funçao com 1 input e 2 outputs - F2

function [Dm,P6]=F2(N)
D=randi(6,1,N);
Dm=mean(D)
P6=100*sum(D==6)/N
end
