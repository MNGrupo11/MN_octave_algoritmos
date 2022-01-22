%BUSQUEDA_INTERPOLACION_CUADRATICA
%   INTERPOLACION_CUADRATICA(F,W,N,C) llenar
%       [xbar,datos,i]=interpolacion_cuadratica(f,x1,x3,tol,iter)
%       xbar = punto minimo
%       datos = todas las variables de la ejecución
%       i = numero de iteraciones
%       f = funcion a tratar
%       [x1,x3] = intervalo
%       tol = tolerancia
%       iter = número máximo de iteraciones

function [xbar,datos,i]=bus_interpolacion_cuadratica(f,x1,x3,tol,iter)
x0bar = 1e99;
x2 = 0.5*(x1 + x3);
f1 =f(x1);
f2 = f(x2);
f3 = f(x3);
z1 = (x2 - x3)*f1;
z2 = (x3 - x1)*f2;
z3 = (x1 - x2)*f3;
z4 = (x2 + x3)*z1+(x3 + x1)*z2+(x1 + x2)*z3;
xbar = z4/(2*(z1 + z2 + z3));
fbar = f(xbar);

i=1;

while 1
    datos(i,1)=x1;
    datos(i,2)=xbar;
    datos(i,3)=x3;
    datos(i,4)=f1;
    datos(i,5)=fbar;
    datos(i,6)=f3;
    datos(i,7)=abs(x0bar - xbar);
    
    if i>iter
        msgID = 'INTERPOLACION CUADRATICA:iteraciones';
        msg = 'Gran número de iteraciones, posiblemente el método divergió';
        error(msgID,msg)
   
        
     else
        if abs(x0bar - xbar)<=tol
           break
           
        elseif x1 < xbar && xbar < x2
           if fbar <= f2
              x3 = x2;
              f3 = f2;
              x2 = xbar;
              f2 = fbar;
           else
             x1 = xbar;
             f1 = fbar;
             
           end
    
       else

          if ((x2 < xbar) && (xbar < x3))
             if (fbar <= f2)
                x1 = x2;
                f1 = f2;
                x2 = xbar;
                f2 = fbar;
               
             else
                x3 = xbar;
                f3= fbar;
                
             end
          end
      end 
     x0bar=xbar;
     z1 = (x2 - x3)*f1;
     z2 = (x3 - x1)*f2;
     z3 = (x1 - x2)*f3;
     z4 = (x2 + x3)*z1 + (x3 + x1)*z2 + (x1 + x2)*z3;
     xbar = z4/(2*(z1 + z2 + z3));
     fbar = f(xbar);
     
    end
    i=i+1;   
end
    
    
    