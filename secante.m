%SECANTE   solucion  de ecuaciones no lineales  (didáctica).
%   SECANTE(F,A,B,ERROR,ITER) llenar
%       [c,date,i] = secante(f, a, b, error, iter)
%       c = raiz de la función
%       date = todas las variables de la ejecución
%       f = la función a tratar
%       a,b valores iniciales
%       error = error absoluto
%       iter = número máximo de iteraciones
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
        msg = 'Gran número de iteraciones, posiblemente el método divergió';
        
        error(msgID,msg)
    else
        if abs(c-a)<=error
            break;
        end
    end
    i=i+1;
end
