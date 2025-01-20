% Criar uma figura
figure;

% Definir o layout
num_linhas = cell2mat(params(2));
num_colunas = cell2mat(params(3));
%num_tarefas = 5;
%posi_App = 4;
tarefa_app = [];
Cores = [0 .5 .5; 0 .35 .850; .33 .65 .65; .45 .55 .65; 0.5 0 0.5];
WTask = cell2mat(params(8));
num_App = length(WTask);

for j = 1: length(WTask)
    if j == 1
        tarefa_app(1,j) = 1;
        tarefa_app(2,j) = WTask(j);
    else
        tarefa_app(1,j) = WTask(j-1)+1;
        tarefa_app(2,j) = WTask(j);
    end
end

% Definir as coordenadas e tamanhos dos quadrados
width = 2;       % Largura dos quadrados
height = 2;      % Altura dos quadrados

%Indiv = zeros(num_tarefas, (num_linhas * num_colunas));
%Indiv(1,:) = resComparaVOPDplus9x9(1, 3:75);

%Para mostrar o Multi Objetivo
IndivCell = ProblemVOPDplus9x9{1,1};
IndivCell = IndivCell{1};
Indiv = IndivCell;


% %Para mostrar o Multi Phase
%Indiv = IndivConv(posi_App,:);

PosiNoc = [];
PosiNoc = zeros((num_linhas * num_colunas),1);

for s=1:(num_linhas * num_colunas)
     if ismember(s, Indiv)
         Var1 = find(Indiv(1,:) == s);
         PosiNoc(s,1:length(Var1)) = Var1;
     end
end

% Definir os números correspondentes aos quadrados
%TotalNoc1 = TotalNoc(:,:);
numeros = reshape(PosiNoc, num_linhas, num_colunas);
numeros = permute(numeros,[2,1,3]);

% Loop para desenhar os quadrados e adicionar os números
for i = 1:num_linhas
    for j = 1:num_colunas
        % Calcular as coordenadas x e y do quadrado atual
        x = width*(j - 1);
        y = height*(num_linhas - i);
        
        % Desenhar o quadrado
        
        for l = 1 : num_App
            if numeros(i, j) > (tarefa_app(1, l) - 1) 
                if (numeros(i, j)) < (tarefa_app(2, l) + 1)
            Corquadrado = Cores(l,:);
                end
            end
            if numeros(i, j) == 0
                Corquadrado = [1 1 1];
            end
        end
        rectangle('Position', [x y width height], 'FaceColor', Corquadrado, 'LineWidth',2);
        
        % Adicionar o número no centro do quadrado
        text(x + width/2, y + height/2, num2str(nonzeros(numeros(i, j,:))), 'HorizontalAlignment', 'center');
    end
end


% text(-0.8, -0.8, num2str(SoluOb(1)),'HorizontalAlignment', 'left');
% text(1.2, -0.8, num2str(SoluOb(2)),'HorizontalAlignment', 'left');
% text(-0.8, -0.4, {'Comunication'},'HorizontalAlignment', 'left');
% text(1.2, -0.4, {'Balance'},'HorizontalAlignment', 'left');

% Configurar o eixo para mostrar todos os quadrados
axis([-1 num_colunas*width -1 num_linhas*height]);

% Remover os eixos
axis off;
