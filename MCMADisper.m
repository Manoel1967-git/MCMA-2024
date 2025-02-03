Amostra = length(ProblemVOPDplus9x9);
%Cria vetor auxiliar
Aux_Comunic = zeros(2);
for n=1:length(ProblemVOPDplus9x9)
    Aux_1 = ProblemVOPDplus9x9{n};
    Aux_Comunic(n,:) = Aux_1{2};
end
% Criar o gráfico de pontos
figure;
scatter(Aux_Comunic(:, 1), Aux_Comunic(:, 2), 'k');
xlabel('Latency','FontSize',14);
ylabel('Fault Tolerance', 'FontSize',14);
%title('Gráfico de Pontos');
