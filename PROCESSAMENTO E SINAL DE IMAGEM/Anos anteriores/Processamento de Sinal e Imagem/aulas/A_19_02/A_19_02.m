% lançamento de um dado
N=100;
D=randi(6,1,N);
Dm=mean(D)
P6=100*sum(D==6)/N

%% função - o nome do ficheiro da função tem de ser o nome da função
function [Dm,P6]=F1(N)
    D=randi(6,1,N);
    Dm=mean(D);
    P6=100*sum(D==6)/N;
end



