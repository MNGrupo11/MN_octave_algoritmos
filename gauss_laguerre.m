% La siguiente funcion realiza el Método de Gauss-Laguerre
% Autores
% Elizabeth Corte, Javier Sotamba
% Fecha de implementacion: 10/11/2021
% Parametros de entrada
% R: función en la que se aplicara Gauss-Laguerre
% R1: función multiplicada por exp(-x)
% n: número de nodos

% Parametros de salida 
% r: aproximación al resultado real
% err_prct: error porcentual del método

function [r,err_prct] = gauss_laguerre(R,R1,n)

%for i=1:n
    syms t
    % uso del polinomio de laguerre y aplicación de la formula para
    % determinar el polinomio con el que se determinaran los argumentos 
    % de la función
    F = ((exp(t)/factorial(n))*(diff((t^n)*(exp(-t)),n)));
    F = simplify(F);
    % cálculo de las raices del polinomio 
    ec = F==0;
    a = vpasolve(ec,t);
% end

% aplicación de la formula para determinar la derivada n+1 del
% polinomio de laguerre
K = ((exp(t)/factorial(n+1))*(diff((t^(n+1))*(exp(-t)),(n+1))));
K = simplify(K);
deri = diff (K);
m = inline(deri,'t');

c = 0;  % inicialización de variable
funt_int = int(R1,0,Inf);   % cálculo de la integral en el intervalo
R = inline(R,'x');   % convertir entrada en una función de linea

for i=1:n
    raices = a(i);   
    L = (m(raices))^2;
    A = 1/(raices*L);  % cálculo de Ai o el factor de multiplicación en la sumatoria
    z = (A*R(raices));
    c = c + z;
end
r=c;   % salida de la integral
err_prct = abs(abs(funt_int - r)/funt_int) * 100;  % error porcentual del método
end

