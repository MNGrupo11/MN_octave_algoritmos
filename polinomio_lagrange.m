% Esta funci�n realiza la interpolacion Lagrange  
% Realizado por: Elizabeth Corte, Javier Sotamba 
% Fecha de implementacion: 15 de noviembre de 2021
% Par�metros de entrada: 
% xn: Vector, valores en x 
% yn: Vector, valores en y 
% xo: Valor a calcular la aproximaci�n 

% Par�metros de salida:
% y: Ecuacion del polinomio de Lagrange
% ys: Resultado de la aproximaci�n 


function [y,ys] = polinomio_lagrange(xn,yn,xo)
  
n = length(xn); 
m = length(yn); 

y = 0; 
s = 0; 
syms x; % Declaraci�n de variable simb�lica 

if n == m % Comparaci�n de tama�o de vectores  
for i = 1:n

    l=1; 
    producto = yn(i);
    for j = 1:n
        if i ~= j
            l = l*(x-xn(j))/(xn(i)-xn(j)); % C�lculo de productivo, condicion i != j 
            producto = producto*(xo-xn(j))/(xn(i)-xn(j)); 
        end
    end
y = y + l*yn(i);
s = s+producto;
end


y = expand(y); % Polinomio expandido 
 ys = s; % Valor aproximado 
else
   error("Las matrices deben tener el mismo tama�o") 
end
end


