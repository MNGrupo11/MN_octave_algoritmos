%REGULA_FALSI    Raices de ecuaciones (did�ctica).
%   REGULA_FALSI(F,A,B,T,ITER) llenar
%       [c,date,i] = regula_falsi(fun, a, b, error, iter)
%       c = raiz de la funci�n
%       date = todas las variables de la ejecuci�n
%       f = la funci�n a tratar
%       [a,b] intervalo
%       error = error absoluto
%       iter = n�mero m�ximo de iteraciones
%

function [c,date,i] = regula_falsi(f,a,b,error=0.001,iter=1000)
i=1;

while 1
    fa=f(a);
    fb=f(b);
    c=b- (b-a)*fb/(fb-fa);
    fc=f(c);
    date(i,1)=a;
    date(i,2)=b;
    date(i,3)=c;
    date(i,4)=fa;
    date(i,5)=fb;
    date(i,6)=fc;
    date(i,7)=fa*fc;
    date(i,8)=abs(c-a);
  
    if i>iter
        msgID = 'REGULA FALSI:iteraciones';
        msg = 'Gran n�mero de iteraciones, posiblemente el m�todo divergi�';
        
        error(msgID,msg)
    else
        if abs(c-a)<=error
            break;
        elseif fa*fc<0
            b=c;
        else
            a=c;
        end
    end
    i=i+1;
end
