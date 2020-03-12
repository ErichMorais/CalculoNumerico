function [ C ] = PivotamentoParcial( C,n,j )
%NÃO RODAR ESSE ALGORTIMO, É FUNÇÃO INTERNA DO INTERPOVANDER
%Implementar o algoritmo PivotamentoParcial que recebe uma matriz C, seu
%número de linhas n e um inteiro j. Em seguida, procura entre os elementos
%da coluna j, o elemento do maior valor absoluto p (denominado pivo).Se p
%está na linha i, então permuta as linhas i e j entre si. O programa
%retorna a matriz C pivotada.

p=abs(C(j,j));
k=j;

for i=j+1:n
    if abs(C(i,j))>p;
        p=abs(C(i,j));
        k=i;
    end
end

if p == 0
    disp('Erro: Pivotamento Impossível')
end

if k>j
    T=C(j,:);
    C(j,:)=C(k,:);
    C(k,:)=T;
end
  
end

