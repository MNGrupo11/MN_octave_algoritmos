% La siguiente función calcula los puntos críticos de una función 
% Autores:
% Elizabeth Corte, Javier Sotamba
% Parámetros de entrada
% xo = valor cercano al punto crítico 
% tol = tolerancia minima en el resultado
% max = restricción, número máximo de iteraciones 
% f = fúncion a analizar 
% Parametros de salida
% r = respuesta encontrada
% iteraciones = número de iteraciones realizadas por el método 
% band = valor que indica punto máximo o minimo 


function [r, iteraciones, band] = Newton(x0, tol, max, f)
  syms x
  band=2;  
  f_op=diff(f,x); %Primera derivada
  f_prima=diff(f_op,x); % Segunda derivada 
  n = 0; % n iteraciones
  er = tol + 1; % Error
  xa = x0; % Inicializacón de las variables 
while n < max && er > tol
 
    xs = xa - subs(f_op,xa) / subs(f_prima,xa);
    er = abs(xs - xa); % El error se obtiene con la diferencia de los puntos calculados
    xa = xs; % el punto anterior pasa a ser el siguiente punto a evaluar
    n = n + 1; % Suma el número de iteraciones
    
end
f_tres=diff(f_prima,x); % tercera derivada 
e_val=double(subs(f_tres,xs)); 
if n > max
  error ("Se ha superado el numero máximo de iteraciones y no se ha encontrado la raiz. \n") 
  
elseif e_val>0
  
  band=0;
  
elseif e_val<0
  
  band=1;
  
end
iteraciones = n;
r = double(xs); % Aproximación del punto máximo o mínimo 
end
