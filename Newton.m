% La siguiente funci�n calcula los puntos cr�ticos de una funci�n 
% Autores:
% Elizabeth Corte, Javier Sotamba
% Par�metros de entrada
% xo = valor cercano al punto cr�tico 
% tol = tolerancia minima en el resultado
% max = restricci�n, n�mero m�ximo de iteraciones 
% f = f�ncion a analizar 
% Parametros de salida
% r = respuesta encontrada
% iteraciones = n�mero de iteraciones realizadas por el m�todo 
% band = valor que indica punto m�ximo o minimo 


function [r, iteraciones, band] = Newton(x0, tol, max, f)
  syms x
  band=2;  
  f_op=diff(f,x); %Primera derivada
  f_prima=diff(f_op,x); % Segunda derivada 
  n = 0; % n iteraciones
  er = tol + 1; % Error
  xa = x0; % Inicializac�n de las variables 
while n < max && er > tol
 
    xs = xa - subs(f_op,xa) / subs(f_prima,xa);
    er = abs(xs - xa); % El error se obtiene con la diferencia de los puntos calculados
    xa = xs; % el punto anterior pasa a ser el siguiente punto a evaluar
    n = n + 1; % Suma el n�mero de iteraciones
    
end
f_tres=diff(f_prima,x); % tercera derivada 
e_val=double(subs(f_tres,xs)); 
if n > max
  error ("Se ha superado el numero m�ximo de iteraciones y no se ha encontrado la raiz. \n") 
  
elseif e_val>0
  
  band=0;
  
elseif e_val<0
  
  band=1;
  
end
iteraciones = n;
r = double(xs); % Aproximaci�n del punto m�ximo o m�nimo 
end
