%PUNTO_FIJO    solucion  de ecuaciones no lineales (didáctica).
%   PUNTO_FIJO(F,A,B,ERROR,ITER) llenar
%       [x_nueva,datos,i] = punto_fijo(f, a, b, error, iter)
%       x_nueva = raiz de la función
%       date = todas las variables de la ejecución
%       f = la función a tratar
%       a valor inicial
%       error = error abssoluto
%       iter = número máximo de iteraciones
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
        msg = 'Gran número de iteraciones, posiblemente el método divergió';
       
        error(msgID,msg)
    elseif abs(x_nueva-x)<error
        break;
     
    end
    i=i+1;
end
