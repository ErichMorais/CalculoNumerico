function [x] = SLGauss(A,b)
% Essa solu��o fornece o vetor solu��o SPD, pelo m�todo da elimina��o de 
% Gauss: escalonamento e retrosubstitui��o.

[m,n]=size(A);
C=[A b];

if m~=n
    disp('O sistema n�o � quadrado!')
    x=[];
    return
end
    
if det(A)==0
    disp('O sistema n�o � SPD!')
    x=[];
    return
end

for j = 1:n-1
    [ C ] = PivotamentoParcial( C,n,j );
    for i = j+1:n
        C(i,:) = C(i,:) - C(i,j)/C(j,j)*C(j,:);
    end
end

x=zeros(n,1);
for i=n:-1:1
    x(i)=(C(i,n+1)-C(i,1:n)*x)/C(i,i);
end
end










