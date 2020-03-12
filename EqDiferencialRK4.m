function [t,u] = EqDiferencialRK4(F,a,b,ua,h)
% ENTRADAS:
% F --> função definida por @ (ex: F = @(t,u) 1+t-2*u)
% a e b são os extremos do intervalo t
% ua = u(0) (valor de u quando t é 0)
% h --> passo / distância entre os valores de t (ex: t=0.05)
% SAÍDAS:
% t e u --> coordenadas dos pontos que passam pela função solução

n=(b-a)/h;
t=(a:h:b)';
u=zeros(n+1,1);
u(1)=ua;

for i=1:n
    k1=F(t(i),u(i));
    k2=F(t(i)+h/2,u(i)+k1*h/2);
    k3=F(t(i)+h/2,u(i)+k2*h/2);
    k4=F(t(i)+h,u(i)+k3*h);
    u(i+1)=u(i)+h*(1/6*k1+2/6*k2+2/6*k3+1/6*k4);
end

plot(t,u,'sg') % visualizo os pontos que utilizei pra obter a resposta
hold on
grid
plot(t,u,'-.') % visualizo a curva da função resposta

% tab=[t u] caso eu queira a minha saída na forma de tabela

end