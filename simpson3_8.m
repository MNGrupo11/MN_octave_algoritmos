% La siguiente funcion realiza el metodo de simpson3_8 para encontrar la 
% solucion de una integral definida
% Autores
% Elizabeth Corte, Javier Sotamba
% Fecha de implementacion: 04/11/2021
% Parimetros de entrada
% f: Función que se evaluara
% li: limite inferior de la integral
% ls: limite superior de la integral
% max: Iterasiones máximas

%parametros de salida
% s: resultado de la integral encontrada por el método




function [s]= simpson3_8(f,ls,li,max)
  k=max;
  n=3*k;%numero de iteraciones
  s=0;% valor inicial del resultado de la integral
  h=(ls-li)/n;%encontrar el punto medio entre los limites
  for i=1:k% recorrer el bucle dependiendo del numero maximo de iteraciones
    s=s+(3*h/8)*(f(li)+3*f(li+h)+3*f(li+2*h)+f(li+3*h));% aplicacion de la formula
    li=li+3*h;% actualizar el limite inferior
  end
  integral = s;%resultado de la integral
end
