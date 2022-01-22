% La siguiente funcion realiza la regresion lineal por minimos cuadrados
% Autores: Elizabeth Corte, Javier Sotamba 
%
% Parámetros de entrada
%x = vector de coeficientes
%y = vector de coeficientes
% Parametros de salida
% m , b = ecuacion resultante
function [m,b] = minimoscuadrados(x,y)
[filas n]= size(x); %Calcular cuantos elementos hay en el arreglo
for i=1:n
    xy(i)=x(i)*y(i); 
    x2(i)=x(i)^2;
end

%sumatoria de los vectores
sumatoriax=0;
sumatoriay=0;
sumatoriaxy=0;
sumatoriax2=0;
for i=1:n
    sumatoriax=sumatoriax+x(i); % sumar todos los elementos del vector x
    sumatoriay=sumatoriay+y(i); % sumar todos los elementos del vector y
    sumatoriaxy=sumatoriaxy+xy(i); % sumar todos los elementos del vector xy
    sumatoriax2=sumatoriax2+x2(i); % sumar todos los elementos del vector x2
end

%calcular el valor de la pendiente y b
m=(sumatoriaxy-(sumatoriax*sumatoriay/n))/(sumatoriax2-(sumatoriax^2/n));
b=(sumatoriay/n)-m*(sumatoriax/n);
end
