function [v] = ILagrange(x,y,u)
% u � o ponto de x onde quero obter o y. 
% v = f(u).
% obs: essa function n�o mostra os valores dos coeficientes do polin�mio
% interpolador, para descobrir isso, utilizar o InterpolaVander.

n=length(x);%tamanho de x
m=length(u);%como vetor de u
v=zeros(m,1);%imagem do u
for k=1:m;%fazendo a leitura de u
    s=0;
    for i=1:n
        p=y(i);%p=y*i que i � igual ao L1,L2,L3....
        for j=1:n% este i � igual ao L1,L2,L3.....
            if j~=i
                p=p*(u(k)-x(j))/(x(i)-x(j));%igual a formula do caderno
            end
        end
        s=s+p;% � a vari�vel contadora
    end
    v(k)=s;
end


