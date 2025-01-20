function MinhaPopOut = MCMAPopOneTask1(Npop, Tarefas, NumNoc, TamApp)
%------------------------------- Reference --------------------------------
% Created by Manoel Aranda de Almeida 25/05/2023
% to optimize Many-Core
%--------------------------------------------------------------------------
% Npop - tamanho da população
% Tarefas - quantidade de tarefas
% NumNoc - tamanho do cromossomo igual numero de roteadores
% No Individuo cada posição é uma tarefa o valor de cada posição do
% indivíduo é um roteador e precisa usar 

numLinha = ceil(sqrt(NumNoc));
numColuna = floor(sqrt(NumNoc));
inicialApp = [0 TamApp]+1;
finalApp = [0 TamApp];

[LN,CL]=ind2sub([numLinha numColuna],1:numLinha*numColuna);
Pos_Tab=[LN' CL'];
Dist_Tab=pdist2(Pos_Tab,Pos_Tab,'cityblock');

for i=1 : Npop
    auxNoC = zeros(numLinha, numColuna);
    for j = 1 : length(TamApp)
        randApp{j}= (randperm([inicialApp(j+1)-inicialApp(j)])) + finalApp(j);
    end
    randAppSel = randperm(length(TamApp));
    
    for k = 1 : length(TamApp)
        selecApp = randApp{randAppSel(k)};
        for m = 1 : length(selecApp)
            if m == 1
                randX = randi(9, 1, 1);
                randY = randi(9, 1, 1);
                if auxNoC(randX, randY) == 0
                    auxNoC(randX, randY) = selecApp(m);
                else
%                     randX = randi(9, 1, 1);
%                     randY = randi(9, 1, 1);
                    [auxX, auxY] = coordNextFre(auxNoC, randX, randY, Dist_Tab, numLinha, numColuna);
                    randX = auxX;
                    randY = auxY;
                    auxNoC(randX, randY) = selecApp(m);
                end
            else
                    [auxX, auxY] = coordNextFre(auxNoC, randX, randY, Dist_Tab, numLinha, numColuna);
                    randX = auxX;
                    randY = auxY;
                    auxNoC(randX, randY) = selecApp(m);
            end
        end
    end
    
    auxInd = reshape(auxNoC', 1, NumNoc);
    indices = find(auxInd);
    novo_vetor(auxInd(indices)) = indices;
MinhaPopOut(i,:) = novo_vetor;
end

end

function [auxXB, auxYB] = coordNextFre(auxNoCB, randXB, randYB, auxTable, Linha, Coluna)

auxIndiv = reshape(auxNoCB', 1, Linha*Coluna);
PosiLast = find(auxIndiv==auxNoCB(randXB, randYB));
auxLimit = max(auxTable(PosiLast,:));
for z = 1 :  max(auxTable(PosiLast,:))
    auxposiNew = find(auxTable(PosiLast,:) == z);
    %posiZero = reshape(auxNoCB', 1, Linha*Coluna);
    posiNew = intersect(auxposiNew, find(auxIndiv == 0));
    
    if ~isempty(posiNew)
        %if length(posiNew) > 1
            auxposiNew = randi(length(posiNew), 1, 1);
        %end
        if mod(posiNew(auxposiNew), Linha) == 0
            auxXB = (floor(posiNew(auxposiNew)/ Linha));
            auxYB = Coluna;  
            break;
        else            
            auxXB = (floor(posiNew(auxposiNew)/ Linha)) + 1;
            auxYB = mod(posiNew(auxposiNew), Linha);
            break;
        end
    end
%     if auxNoCB(auxXB, auxYB) == 0
%         break
%     end
end
end
