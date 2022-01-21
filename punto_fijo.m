%PUNTO_FIJO    solucion  de ecuaciones no lineales (did�ctica).
%   PUNTO_FIJO(F,A,B,ERROR,ITER) llenar
%       [x_nueva,datos,i] = punto_fijo(f, a, b, error, iter)
%       x_nueva = raiz de la funci�n
%       date = todas las variables de la ejecuci�n
%       f = la funci�n a tratar
%       a valor inicial
%       error = error abssoluto
%       iter = n�mero m�ximo de iteraciones
%

function [x_nueva,date,i] = punto_fijo(f,x,error=0.001,iter=1000)
i=1;

while 1
    x_nueva=x;
    x =f(x_nueva);
    date(i,1)=x;
    date(i,2)=x_nueva;
    date(i,3)=f(x);
    date(i,4)=f(x_nueva);
    date(i,5)=abs(x_nueva-x);
   
    if i>iter
        msgID = 'PUNTOFIJO:iteraciones';
        msg = 'Gran n�mero de iteraciones, posiblemente el m�todo divergi�';
       
        error(msgID,msg)
    elseif abs(x_nueva-x)<error
        break;
     
    end
    i=i+1;
end
