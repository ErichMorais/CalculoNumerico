function [Q] = IntegracaoNC(f,a,b,m,n)
% Integração Numérica pelo Método de Newton-Cotes Composto
% Q = solução da integral (somatório abaixo da curva)
% f = funcão a ser integrada definida por @ (ou, função anonima)
% a e b são os extremos do intervalo
% m é o número de composições ou subintervalos de {a, b]
% n é o número da ordem de integração (ou do pol interpolador)
% obs1: n deve ser um número inteiro entre 0 e 4 (ou seja: 0, 1, 2, 3 ou 4)
% sendo zero o menos preciso, ou de maior erro, e 4 o mais preciso.
% obs2: m deve ser um número inteiro, entre 1 e 100, quanto maior mais preciso.
% obs3: para calcular pelo Método Newton-Cotes Simples, usar m=1)

Q=0;
H=(b-a)/m;
ab=a+H;

if n==0
    for i=1:m
    x=(a+ab)/2;
    a=ab;
    ab=ab+H;
    Q=Q+H*f(x);
    end
    return
end

if n==1
    w=[1/2 1/2]';
elseif n==2
    w=[1/6 4/6 1/6]';
elseif n==3
    w=[1/8 3/8 3/8 1/8]';
elseif n==4
    w=[7/90 32/90 12/90 32/90 7/90]';
else
    disp('Reveja o valor de n, a ordem do método!')
    Q=[];
    return
end

h=H/n;

for i=1:m
    x=[a:h:ab]';
    a=ab;
    ab=ab+H;
    Q=Q+H*sum(w.*f(x));
end
end

% x=a:0.01:b;
% y= f(x);
% plot(x,y)
% grid on