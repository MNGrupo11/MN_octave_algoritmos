%SECANTE   solucion  de ecuaciones no lineales  (did�ctica).
%   SECANTE(F,A,B,ERROR,ITER) llenar
%       [c,date,i] = secante(f, a, b, error, iter)
%       c = raiz de la funci�n
%       date = todas las variables de la ejecuci�n
%       f = la funci�n a tratar
%       a,b valores iniciales
%       error = error absoluto
%       iter = n�mero m�ximo de iteraciones
%

function [c,date,i] = secante(f,a,b,error=0.001,iter=1000)
i=1;

while 1
    fa=f(a);
    fb=f(b);
    c= b-(fb*(a-b))/(fa-fb);
    fc=f(c);
    a=b;
    b=c;
    date(i,1)=a;
    date(i,2)=b;
    date(i,3)=c;
    date(i,4)=fa;
    date(i,5)=fb;
    date(i,6)=fc;
    date(i,7)=abs(c-a);
    
   if i>iter
        msgID = 'SECANTE:iteraciones';
        msg = 'Gran n�mero de iteraciones, posiblemente el m�todo divergi�';
        
        error(msgID,msg)
    else
        if abs(c-a)<=error
            break;
        end
    end
    i=i+1;
end
