%BISECCIOND    Raices de ecuaciones (did�ctica).
%   BISECCIOND(FUN,A,B,T,ITER) llenar
%       [c,datos] = biseccion(fun, a, b, t, iter)
%       c = raiz de la funci�n
%       datos = todas las variables de la ejecuci�n
%       fun = la funci�n a tratar
%       [a,b] intervalo
%       t = tolerancia
%       iter = n�mero m�ximo de iteraciones
%
%   See also SLASH, ... (poner los otros m�todos que se utilizan para 
%   resolver las raices de ecuaciones.

%   Copyright 2013-2014 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2014/11/21 18:48 $
%   Built-in function.
function [c,datos,i] = biseccion(fun,a,b,tol=0.001,iter=1000)
i=1;

#f=@(x) eval(fun); % funciones an�nimas
f=fun;
while 1
    fa=f(a);
    fb=f(b);
    c=(a+b)/2;
    fc=f(c);
    datos(i,1)=a;
    datos(i,2)=b;
    datos(i,3)=c;
    datos(i,4)=fa;
    datos(i,5)=fb;
    datos(i,6)=fc;
    datos(i,7)=abs(c-a);
    if (fa*fb>0)
        fc=NaN;
        c=NaN;
        msgID = 'BISECCION:condicion';
        msg = 'Error: f(a)*f(b)>0';
        #baseException = MException(msgID,msg);
        #throw(baseException);
        error(msgID,msg);
    elseif i>iter
        msgID = 'BISECCION:iteraciones';
        msg = 'Gran n�mero de iteraciones, posiblemente el m�todo divergi�';
        #baseException = MException(msgID,msg);
        #throw(baseException);
        error(msgID,msg)
    else
        if abs(c-a)<tol
            break;
        elseif fc>0
            a=c;
        else
            b=c;
        end
    end
    i=i+1;
end
%ezplot(Fx);%graficamos la funcion
%grid on;