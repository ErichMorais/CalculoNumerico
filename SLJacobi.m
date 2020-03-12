function [ x,k,Erel ] = SLJacobi( A,b,tol,kmax )
% Essa fun��o fornece o vetor solu��o SPD, pelo m�todo de itera��o de 
% Gauss-Jacobi.

[n,~]=size(A);
C=zeros(n);
d=zeros(n,1);
k=1;
x=ones(n,1); %caso pe�a para modificar o vetor inicializador, mudar esta linha
Erel=tol+1;

for i=1:n
    for j=1:n
        if i~=j
            C(i,j)=-A(i,j)/A(i,i);
        end
    end
    d(i)=b(i)/A(i,i);
end

ro=max(abs(eig(C)));

if ro>1
    disp('ro>1 : O sistema n�o converge!')
    x=[];
    k=[];
    Erel=[];
    return
end

% aqui come�a o processo iterativo

while k<kmax && Erel>tol
    k=k+1;
    u=x; % esta variavel guarda o x anterior
    x=C*x+d;
    Erel=ErroRelVet(u,x);
end
end