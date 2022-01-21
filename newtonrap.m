%BISECCIOND    Raices de ecuaciones (didáctica).
%   BISECCIOND(FUN,A,B,T,ITER) llenar
%       [c,datos] = biseccion(fun, a, b, t, iter)
%       c = raiz de la función
%       datos = todas las variables de la ejecución
%       fun = la función a tratar
%       [a,b] intervalo
%       t = tolerancia
%       iter = número máximo de iteraciones
%
%   See also SLASH, ... (poner los otros métodos que se utilizan para 
%   resolver las raices de ecuaciones.

%   Copyright 2013-2014 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2014/11/21 18:48 $
%   Built-in function.

function [xi,datos,i] = newtonrap(fun,der,x,tol=0.001,iter=1000)

i=1;

#f=@(x) eval(fun); % funciones anónimas
f=fun;
while 1
    xi=x;
    x=xi-(f(xi)/der(xi));
    datos(i,1)=x;
    datos(i,2)=xi;
    datos(i,4)=f(x);
    datos(i,5)=f(xi);
    datos(i,6)=der(x);
    datos(i,6)=der(xi);
    datos(i,7)=abs(xi-x);
     if i>iter
        msgID = 'PUNTOFIJO:iteraciones';
        msg = 'Gran número de iteraciones, posiblemente el método divergió';
       
        error(msgID,msg)
    elseif abs(xi-x)<tol
        break;
     
    end
    i=i+1;
end



