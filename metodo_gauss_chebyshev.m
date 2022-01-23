% Metodo de cuadratura de Gauss-Chebyshev
% Autores
% Elizabeth Corte, Javier Sotamba
% Fecha de implementacion: 14/11/2021
% Parametros de entrada:
% funcion: funcion parte de la integral
% n: numero de nodos
% c: valor entre el intervalo -1 a 1
% Parametros de salida:
% integral: integral numerica
% error_trunc: error de truncamiento
function [integral, error_trun] = metodo_gauss_chebyshev(funcion, n, c)
syms x;
w = pi / (n + 1); % Peso de la sumatoria
sumatoria = 0; 
f = (1:n); % Matriz con los valores de sumatoria
for i = 1:n + 1 % Se realiza la sumatoria 
    x_i = cos(((2 * (i - 1) + 1) / (2 * n + 2)) * pi);
    f(1, i) = double(subs(funcion, x, x_i));
    sumatoria = sumatoria + f(1, i);
end
integral = sumatoria * w; % Resultado de la integral numerica
diferencial = diff(funcion, 2 * n + 2); % Diferencial (2n + 2) de la funcion
error_trun = ((2 * pi) / factorial((2^(2 * n + 2)) * (2 * n + 2))) * (subs(diferencial, x, c)); % Calculo del error de truncamiento
end
