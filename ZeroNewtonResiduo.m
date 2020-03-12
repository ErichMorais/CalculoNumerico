function [ x, k, Residuo ] = ZeroNewtonResiduo( f, x1, kmax, tol )
% Calcula uma aproxima��o para o zero da fun��o f(x)
% no intervalo [a,b]. O intervalo deve ser previamente definido, pela
% an�lise de gr�fico, e deve conter somente UM zero da f. Escolher x1 em
% [a,b].
% Sintaxe adequada: [ x, i, ERel ] = zero_bisseccao( f, a, b, M, tol )

k = 1;
Residuo = inf;
syms x
df = matlabFunction(diff(f(x)));
while k<kmax && Residuo>=tol
    
    x = x1-f(x1)/df(x1);
    Residuo = f(x);
    k = k+1;
    x1=x;
end


end
