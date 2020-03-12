function [x,k,Erel]=ZeroSecante(f,a,b,tol,kmax)
    k =0;
    fa=f(a);
    fb=f(b);
    Erel=tol+1;

    while k<kmax  &&  a~=b  && abs(Erel)>=tol
        x= b - (fb)*(a-b)/(fa-fb);
        k=k+1 ;     
        a=b;
        b=x;
        fa=fb;
        fb=f(b);
        Erel=(a-x)/x;
    end
end