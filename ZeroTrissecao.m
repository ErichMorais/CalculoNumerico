function [x,k,Residuo] = ZeroTrissecao(f,a,b,tol,kmax)
% Calcula uma aproxima��o para o zero da fun��o f(x) pelo m�todo
% da Trisse��o, proposto no exerc�cio 10.

k=1;
x=(a+b)/2;
Residuo=tol+1;

while abs(Residuo)>=tol && k<kmax % crit�rios de parada
    c = a + 1.*(b-a)/3;
    d = a + 2.*((b-a)/3);
    
    if f(a)*f(c)<=0
            b=c;
    elseif f(c)*f(d)<=0
            a=c;
            b=d;
    else
            a=d;
    end

    x1=x;
    x=(a+b)/2;
    k=k+1;
   Residuo=f(x);
end
    
end