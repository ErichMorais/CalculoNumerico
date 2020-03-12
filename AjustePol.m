function [c,SQE] = AjustePol(x,y,m)
% m = a ordem do polinômio que eu quero aproximar
% OBS:SE NA PROVA PEDIR 3 INCOGNITAS E 3 EQUAÇÕES, ENTÃO m=2, um grau menor
% exemplo m = 2... polinômio gerado =>> p(x)= c1*(x^2) + c2*(x^1) + c3
% v = mostra os valores de y da função de aproximação p(x) (dica: ver gráfico)
% OBS2: Caso peça para escrever matricialmente o sistema a ser resolvido
% para encontrar o polinômio de ajuste... essa matriz é a matriz A e o
% vetor coluna é b.
figure
plot(x,y,'*'), grid, hold on

[X]=MVander(x,m);
A=X'*X; 
b=X'*y;
[c]=SLGauss(A,b);
v=X*c;
SQE=norm(y-v)^2;

t=min(x):0.01:max(x);
f1=VPol(c,t);
plot(t,f1,'r');
hold off

%  A % caso peça para mostrar o sistema Ax=b
%  b
end

