function [ Erel ] = ErroRel( x1,x2 )
% Este algoritmo retorna o erro relativo entre dois valores representados
% por x1 e x2, tendo como valor aproximado o x1 e exato o x2.


if x2==0
    Erel = x1;
else
    Erel = (x1-x2)/x2;
end
end

