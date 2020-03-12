function [ x, k, ERel ] = ZeroNewton( f, x1, kmax, tol )
% Calcula uma aproxima��o para o zero da fun��o f(x) pelo m�todo de
% Newton-Raphson

k = 1;
ERel = inf;
syms x
df = matlabFunction(diff(f(x)));
while k<kmax && ERel>=tol
    
    x = x1-f(x1)/df(x1);
    ERel = abs((x1-x)/x);
    k = k+1;
    x1=x;
end


end
