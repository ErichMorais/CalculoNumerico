function [C] = coefspline3(x,y)


n=length(x);
h=zeros(n-1,1);
p=zeros(n-1,1);
for k=1:n-1
    h(k)=x(k+1)-x(k);
    p(k)=(y(k+1)-y(k))/h(k);
end
H=zeros(n,n);
P=zeros(n,1);
H(1,1)=1;
P(1)=0;
for k=2:n-1
    H(k,k-1)=h(k-1);
    H(k,k)=2*(h(k-1)+h(k));
    H(k,k+1)=h(k);
    P(k)=6*(p(k)-p(k-1));
end
H(n,n)=1;
P(n)=0;
m=SLGauss(H,P);
C=zeros(n-1,4);
for k=1:n-1
    C(k,1)=(m(k+1)-m(k))/(6*h(k));
    C(k,2)=m(k)/2;
    C(k,3)=p(k)-((2*m(k)+m(k+1))*h(k))/6;
    C(k,4)=y(k);
end
%plot(x,y,'*'),grid,hold on
%t=min(x):0.01:max(x);
%v=ispline3(x,y,t);
%plot(t,v,'r')
%hold off
%S(x) = {C(1,1)*(x-x(1,1))^3+C(1,2)*(x-x(1,1))^2+C(1,3)*(x-x(1,1))^1+C(1,4)
%x(1,1)<=x<=X(2,1)
%       {C(2,1)*(x-x(1,2))^3+C(2,2)*(x-x(1,2))^2+C(2,3)*(x-x(1,2))^1+C(2,4)
%x(2,1)<=x<=X(3,1)
end

