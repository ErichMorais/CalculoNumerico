function [c,v] = IVander(x,y,u)
% Essa function encontra o polinômio interpolador pelo método de Vandermonde
% c = coeficientes do polinômio interpolador - OBS: para 4 pontos interpolados,
% vou encontrar uma função de grau 3: c = c1(x^3) + c2(x^2) + c3(x) + c4
% v = f(u), ou seja para um dado ponto u (pertencente a x), ele retorna o valor de y.
% u = valor da imagem, o u deve estar entre x minimo e x máximo.

n=length(x); % para saber o tamanho de x
X=MVander(x,n-1); % montar a matriz de vandermonde
c = SLGauss( X,y );% X de MVander para resolver o sistema
v=VPol(c,u);

figure
plot(x,y,'*'),grid
hold on
t=min(x):0.01:max(x);
plot(t,VPol(c,t),'r')

p=polyval(c,u);
plot(u,p,'og')
hold off

end