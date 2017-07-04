xg1 = 0:0.1:1;
xg2 = 0:1;
ug = 0:0.2:1;
[xx1,xx2]=ndgrid(xg1,xg2);
[xu1,xu2,uu]=ndgrid(xg1,xg2,ug);

ctogo = (1-xx1).*10;

n=10;
for t=n:-1:1
    % model
    [xp1,xp2,cst,in] = model(xu1,xu2,uu,t);
    % interpolation
    cxu = interpn(xx1,xx2,ctogo,xp1,xp2) + cst;
    % optimisation
    [ctogo,ustar] = min(cxu,[],3);
end
ctogo

function [xp1,xp2,cst,in]=model(x1,x2,u,t)
    xp1 = 1.0.*x1 + 0.0.*x2 + 0.2.*u + 0.0.*t;
    xp2 = x2;
    cst = 0.0.*x1 + 0.0.*x2 + 1.0.*u + 0.0.*t;
    in  = 0.0.*x1 + 0.0.*x2 + 0.0.*u + 0.0.*t;
end
