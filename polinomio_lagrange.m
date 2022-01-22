% Esta función realiza la interpolacion Lagrange  
% Realizado por: Elizabeth Corte, Javier Sotamba 
% Fecha de implementacion: 15 de noviembre de 2021
% Parámetros de entrada: 
% xn: Vector, valores en x 
% yn: Vector, valores en y 
% xo: Valor a calcular la aproximación 

% Parámetros de salida:
% y: Ecuacion del polinomio de Lagrange
% ys: Resultado de la aproximación 


function [y,ys] = polinomio_lagrange(xn,yn,xo)
  
n = length(xn); 
m = length(yn); 

y = 0; 
s = 0; 
syms x; % Declaración de variable simbólica 

if n == m % Comparación de tamaño de vectores  
for i = 1:n

    l=1; 
    producto = yn(i);
    for j = 1:n
        if i ~= j
            l = l*(x-xn(j))/(xn(i)-xn(j)); % Cálculo de productivo, condicion i != j 
            producto = producto*(xo-xn(j))/(xn(i)-xn(j)); 
        end
    end
y = y + l*yn(i);
s = s+producto;
end


y = expand(y); % Polinomio expandido 
 ys = s; % Valor aproximado 
else
   error("Las matrices deben tener el mismo tamaño") 
end
end


