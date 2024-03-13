%imagem com maior objeto na zona central

%Criado por Maria Gama a 10/04/2021

function [IB2,IB3]= MariaGama_TP3_A3(imagem, GRAF)
IM=imread(imagem);
IB1=MariaGama_TP3_A1(imagem,0);
[IEt,NoOb]= MariaGama_TP3_A2(imagem,0);


a=size(IEt);
linhas=a(1);
colunas=a(2);
linhacentral=round(linhas/2);
colunacentral=round(colunas/2);

LinhaDireita=round(linhacentral+(linhas/2-1.5)); 
LinhaEsquerda=round(linhacentral-(linhas/2-1.5));
ColunaCima=round(colunacentral+ (colunas/2-1.5));
ColunaBaixo=round(colunacentral-(colunas/2-1.5));

subImagem=IEt(LinhaEsquerda:LinhaDireita,ColunaBaixo:ColunaCima,:); %imagem sem uma margem de 2 pixels

 for f=1:NoOb 
     P(f)= sum(sum(IEt==f));
 end
 
  maxx=(max(P)); %objeto maior
 
objeto=1;
  for f=1:NoOb
    if P(f)== maxx %percorre todos os objetos e compara com o maior (max)
       objeto=f;
    end
  end
IB2=(IEt==objeto);

%faz-se o mesmo para para a subimagem sem as margens
 for f=1:NoOb 
     P1(f)= sum(sum(subImagem==f));
 end
 dif=P1;
 for f=1:NoOb
    v=P(f);
    v1=P1(f);
    vd= v - v1; %diferença entre os pixeis de cada objeto
      if vd~=0  % se a diferença é diferente de zero é pq o objeto toca na margem
         dif(f)=0; %colocam-se esses objetos a zero para depois se poder escolher o maior que não toca na margem
      end
end      
 maxi=max(dif); %objeto maior
 objeto1=1;
  for f=1:length(dif)
    if dif(f)== maxi
       objeto1=f;
    end
  end
IB3=(subImagem==objeto1);
if GRAF==1
    subplot(2,2,1), imshow(IM), title("Imagem original")
    subplot(2,2,2), imshow(IB1), title("Imagem binária. Objetos="+NoOb)
    subplot(2,2,3), imshow(IB2), title("Maior objeto")
    subplot(2,2,4), imshow(IB3), title("Maior objeto que não toca nas margens")
end
end