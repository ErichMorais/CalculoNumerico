function [ Erel ] = ErroRelVet( u,v )

if norm(v) == 0
    Erel = norm(u);
    
else
Erel = norm(u-v)/norm(v); %norma euclidiana
%Erel = norm(u-v, inf)/norm(v, inf); %norma infinita

end

