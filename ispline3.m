function [v] = ispline3(x,y,u)
% Função de ajuste por splines cúbicos (capitulo 6)

[C] = coefspline3(x,y);
n=length(x);
r=length(u);
v=zeros(r,1);
for i=1:r
    k=1;
    while u(i)>x(k+1) && k<n-1
        k=k+1;
    end
    t=u(i)-x(k);
    v(i)=((C(k,1)*t+C(k,2))*t+C(k,3))*t+C(k,4);
end
end

