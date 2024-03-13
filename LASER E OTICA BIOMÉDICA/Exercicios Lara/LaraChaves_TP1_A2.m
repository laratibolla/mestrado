%API TP1 Ex.A
%Lara Tibolla Chaves    21/02/2024


function LaraChaves_TP1_A2(NColunas,IluminacaoMinima, IluminacaoMaxima)

NSQ=round(NColunas/8);
NN=NSQ*8;
%Simple Chess Board Image
Bsq=zeros(NSQ);
Wsq=255*ones(NSQ);
IM1=[Bsq Wsq; ;Wsq Bsq]
IM2=[IM1 IM1 ; IM1 IM1]
SimpleCB=[IM2 IM2 ; IM2 IM2];

%Iluminaçao image
vl=0:NN-1;
vc=ones(NN,1);
ILUM1=vc*vl;
ILUM2=mat2gray(ILUM1);
ILUM3=IluminacaoMaxima-IluminacaoMinima*ILUM2;

%Final Chessboard image
FinalCB= uint8(SimpleCB.*ILUM3);

%Show Results
subplot (1,3,1), imshow(SimpleCB), title ('Simple ChessB')
subplot (1,3,2), imshow(ILUM3), title ('Ilumination')
subplot (1,3,3), imshow(FinalCB), title ('Ilumination ChessB')