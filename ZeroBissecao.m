function [x, k, Erel] = ZeroBissecao( f,a,b,tol,kmax )
%Método para calcular uma aproximação para o zero da função f(x) pelo 
%método de bisseção no intervalo de [a,b], com tolerância máxima 
%para o erro dado por tol e com kmax o número máximo de iterações, 
%onde a função f é dada por f = @(x).

k=1;
x=(a+b)/2;
Erel=tol+1;

while k<kmax && abs(Erel)>tol
    if f(a)*f(x)<=0
        b=x;
        f(x);
    else
        a=x;
        f(x);
    end
    
    k=k+1;
    u=x;
    x=1/2*(a+b);
    f(x);
    Erel=(u-x)/x;

end
% f=@(x);
% x=-4:1; usar grande
% y=f(x);
% tab=[x' y'];
% plot (x,y)
% grid

