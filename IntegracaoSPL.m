function [Q] = IntegracaoSPL(x,y)
%A partir de nodos este método calcula a integral definida de uma f(x)
%estimada por splines cúbicas.

n=length(x);
A=[];

[C]=coefspline3(x,y);
a=C(:,1);
b=C(:,2);
c=C(:,3);
d=C(:,4);


for i=1:n-1
    h(i)=x(i+1)-x(i);
    A(i)=a(i)/4*h(i)^4 + b(i)/3*h(i)^3 + c(i)/2*h(i)^2 + d(i)*h(i);
end

Q=sum(A);

end

