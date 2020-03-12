function [t,u] = EqDiferencialEuler(F,a,b,ua,h)
% ENTRADAS:
% F --> função definida por @ (ex: F = @(t,u) 1+t-2*u)
% a e b são os extremos do intervalo t
% ua = u(0) (valor de u para o t inicial)
% h --> passo / distância entre os valores de t (ex: t=0.05)
% SAÍDAS:
% t e u --> coordenadas dos pontos que passam pela função solução

n=(b-a)/h;
t=(a:h:b)';
u=zeros(n+1,1);
u(1)=ua;
for i=1:n
    u(i+1)=u(i)+F(t(i),u(i))*h;
end
plot(t,u,'or') % plota os pontos utilizados
hold on
grid
plot(t,u,'--r') % plota a curva da função resposta
%tab=[t u] % caso queira a saída na forma de tabela
end
% DEFINIR:
% F=@(x,y)y*x-x.^3;
% a=0;
% b=1.8;
% ua=1;
% h=0.6; %passo
% f=@(x) x.^2 -exp(x.^2/2)+2; %funcao exata
% 
% % AUTOMÁTICO:
% [t,u] = EqDiferencialEuler(F,a,b,ua,h);
% uex=f(t);
% hold on
% plot (t,uex)%para verificar o que esta calculando
% Erro=uex-u;
% Maior_Erro_Relativo=max(abs((uex-u)./uex))
% Maior_Erro_Absoluto=max(abs((uex-u)))
% Erel=(uex-u)./uex;
% disp('Tab= [t   u_aprox   u_exato   Erro_Absoluto    Erro_Relativo]')
% Tab=[t u uex Erro Erel]