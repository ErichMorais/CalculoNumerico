function [x, k, Erel] = ZeroBissecao( f,a,b,tol,kmax )
%M�todo para calcular uma aproxima��o para o zero da fun��o f(x) pelo 
%m�todo de bisse��o no intervalo de [a,b], com toler�ncia m�xima 
%para o erro dado por tol e com kmax o n�mero m�ximo de itera��es, 
%onde a fun��o f � dada por f = @(x).

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

