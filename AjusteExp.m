function [a,b,SQE] = AjusteExp(x,y)
%x e y são vetores coluna dos nodos
% f(x)=a*exp(b*x) é o ajuste encontrado

figure
plot(x,y,'*'), grid
hold on

z = log(y);
[X]=MVander(x,1);
A=X'*X;
d=X'*z;
[B]=SLGauss(A,d);
a=exp(B(2));
b=B(1);
f= a*exp(b*x);
SQE = norm(f-y)^2;

xx=min(x):0.01:max(x);
f=@(xx) a*exp(b*xx);
yy = f(xx);
plot(xx,yy,'r')
hold off

end

