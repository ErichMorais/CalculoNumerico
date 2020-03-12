function [L,p] = CoefLagrange(x,y)
% Function do capitulo 5 dado pela professora...
% Fornece os coeficientes do polinômio p interpolador de Lagrange
% e os polinômios auxiliares Li nas linhas de L
% x e y vetores colunas

n=length(x);L=[];
for k=1:n
    p=1;
    for j=1:n
        if k~=j
            p=conv(p, [1 -x(j)])/(x(k)-x(j));
        end
    end
    L=[L;p];
end
p=y'*L;
