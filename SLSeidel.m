function [x,k,erel] = SLSeidel(A,b,tol,kmax)
%Essa solução fornece o vetor solução SPD, pelo método de iteração de 
%Gauss-Seidel.

[linhas,colunas]=size(A);

if linhas~=colunas
    disp('O sistema não é quadrado!')
    x=[];
    k=[];
    erel=[];
    return
end

C=zeros(size(A));
d=zeros(size(b));
n=length(b);
x=ones(size(b)); % caso peça para modificar o vetor inicializador modificar esta linha
k=1;
erel=tol+1;
somadiagonal=0;
somafora=0;

for i=1:n
    for j=1:n
        if i==j
            somadiagonal=somadiagonal+abs(A(i,j));
        else
            somafora=somafora+abs(A(i,j));
        end
    end
end

if somafora>somadiagonal
    disp('O sistema não converge!')
    x=[];
    k=[];
    erel=[];
    return
end

for i=1:n
    for j=1:n
        if i~=j
            C(i,j)=-(A(i,j)/A(i,i));
        end
    end
end

for i=1:n
d(i) = b(i)/A(i,i);
end

ro=max(abs(eig(C)));

if ro>1
    disp('O sistema não converge!')
    x=[];
    k=[];
    erel=[];
    return
end

while erel>=tol && k<kmax
    aux=x;
    for i=1:n
        x(i)=C(i,:)*x+ d(i);
    end
    erel=ErroRelVet(x,aux);
    k=k+1;

end
end


