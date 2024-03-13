%Exemplo de funçao - F1

function []=F1(N)
D=randi(6,1,N)
Dm=mean(D)
P6=100*sum(D==6)/N
end