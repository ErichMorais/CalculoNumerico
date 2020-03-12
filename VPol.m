function [ y ] = VPol( c,x )
% Algoritmo VPol usa a forma de Horner para avaliação polinomial, isto é,
% recebe um vetor c com os coeficêntes de uma função polinomial p, o valor
% de x e determina y=p(x).

% Ex: c(x)= 1(x^4) - 3(x^3) - 2(x^2) + 7 --> quero saber o y quando x é 1
% ou seja, c(1) = ?
% >> c = [1 -3 -2 0 7]' ; x = 1 ; [ y ] = VPol( c,x )
% Resposta: y = 3

n=length(c);
y=0;

for i=1:n
    y=y.*x+c(i);
    
end

end

