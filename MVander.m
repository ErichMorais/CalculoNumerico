function X=MVander(x,m)
% N�O RODAR ESSE ALGORITMO, ELE Gera a matriz de Vandermonde (INTERNA)
% x � o vetor, m � o tamanho da matriz, quantidade de linhas e colunas
n=length(x);
X=zeros(n,m+1);
for i=1:n
    X(i,m+1)=1;
    for j=m:-1:1
        X(i,j)=x(i)*X(i,j+1);
    end
end

