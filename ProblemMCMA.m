
%------------------------------- Reference --------------------------------
% Created by Manoel Aranda de Almeida 25/05/2023
% to optimize Many-Core
%--------------------------------------------------------------------------
%VOPD
S1 = [1    2   3   4  4   5   6   7   8   8   9 10 11 12 12 12  13 14 15 15 16];
T1 = [2    3   4   5 16   6   7   8   9  10  10  9 12  6  9 13  14 15 11 13  5];
W1 = [70 362 362 362 49 357 353 300 313 500 313 94 16 16 16 16 157 16 16 16 27];
params1 = {16, 9, 9, S1, T1, W1, 9};

%MPEG4
S2 = [  1  1  1   1    1    1   1   2  3  4   5   5   6   6    7   7    8    8    9   9   9    9  10  10  11   12];
T2 = [  2  3  4   5    7    8  10   1  1  1   1   6   5   7    1   6    1    9    8  10  11   12   1   9   9    9];
W2 = [ 64  3  1  20  200  304  11  64  3  1  20  14  14  40  200  40  304  224  224  58  84  167  11  58  84  167];
params2 = {12, 9, 9, S2, T2, W2, 9};

%VCE
S3 = [1  2  2  3  4  5  6  7    8    8    8    8    9    10   10   11   12 12 13   14   15  15  16  17  18  19  20  22  23   24   25];
T3 = [2  3  4  4  5  6  18 8    9    12   10   11   12   13   24   10   10 16 14   15   16  17  18  22  19  20  21  23  24   25   9];
W3 = [90 90 90 90 30 20 20 8400 2800 2800 2800 5600 2000 4200 4200 1400 30 30 4200 2100 660 660 600 240 620 640 640 240 2210 2280 2280];
params3 = {25, 9, 9, S3, T3, W3, 9};

%WIFIRX
S4 = [1   1   2   3   4   4 5   6   7   8   9   9   10  11  12 13 14 15  16 17 17 18 18 18 18 18 18 19 19 19 19 19 19];
T4 = [2   6   3   4   5   1 6   7   8   9   10  11  11  12  13 14 15 16  17 18 19 12 13 14 15 16 19 1  9  11 17 18 20];
W4 = [640 640 640 640 640 1 640 640 512 512 384 384 384 384 72 72 72 108 54 6  54 1  1  1  1  1  4  1  1  1  1  1  54];
params4 = {20, 9, 9, S4, T4, W4, 9};

[params, LenghtGrafos] = UniGrafo({params1, params2, params3, params4});
params = [params LenghtGrafos];

for t = 1 : 1
    disp(t);
%[Dec,Obj,Con] = platemo('problem',@ManyCoreMAV1,'algorithm',@NSGAII,'parameter',{nTask,Line,Column,S,T,P},'save', 1);
[Dec,Obj,Con] = platemo('N',100,'problem',@ManyCoreMAVOneTask,'algorithm',@NSGAII,'parameter',params,'save', 1);
%Dec
%Obj

%Script para encontrar uma solução intermediária
Resultados = Obj;
MenorA = find(Obj(:,1)==min(Obj(:,1)),1);
ProblemVOPDplus9x9Comunic{t} = {Dec(MenorA,:) Obj(MenorA,:)};

for i=1:length(Resultados)
    Res=(Resultados(i,1)/1000);
    Res2 =Resultados(i,2);
    %Distancias(i) = sqrt((Resultados(i,1)/1000)^2+(Resultados(i,2))^2);
    Distancias(i) = sqrt((Resultados(i,1)/50)^2+(Resultados(i,2))^2);
end
    Menor = find(Distancias==min(Distancias),1);
    %Menor = find(Resultados(:,1)==min(Resultados(:,1)),1);
    
ProblemVOPDplus9x9{t} = {Dec(Menor,:) Obj(Menor,:)};
    
end
save ProblemVOPDplus9x9.mat;
save ProblemVOPDplus9x9Comunic.mat;
%plot(Obj(:,1), Obj(:,2),'bo')