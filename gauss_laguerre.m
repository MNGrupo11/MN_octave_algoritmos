% La siguiente funcion realiza el M�todo de Gauss-Laguerre
% Autores
% Elizabeth Corte, Javier Sotamba
% Fecha de implementacion: 10/11/2021
% Parametros de entrada
% R: funci�n en la que se aplicara Gauss-Laguerre
% R1: funci�n multiplicada por exp(-x)
% n: n�mero de nodos

% Parametros de salida 
% r: aproximaci�n al resultado real
% err_prct: error porcentual del m�todo

function [r,err_prct] = gauss_laguerre(R,R1,n)

%for i=1:n
    syms t
    % uso del polinomio de laguerre y aplicaci�n de la formula para
    % determinar el polinomio con el que se determinaran los argumentos 
    % de la funci�n
    F = ((exp(t)/factorial(n))*(diff((t^n)*(exp(-t)),n)));
    F = simplify(F);
    % c�lculo de las raices del polinomio 
    ec = F==0;
    a = vpasolve(ec,t);
% end

% aplicaci�n de la formula para determinar la derivada n+1 del
% polinomio de laguerre
K = ((exp(t)/factorial(n+1))*(diff((t^(n+1))*(exp(-t)),(n+1))));
K = simplify(K);
deri = diff (K);
m = inline(deri,'t');

c = 0;  % inicializaci�n de variable
funt_int = int(R1,0,Inf);   % c�lculo de la integral en el intervalo
R = inline(R,'x');   % convertir entrada en una funci�n de linea

for i=1:n
    raices = a(i);   
    L = (m(raices))^2;
    A = 1/(raices*L);  % c�lculo de Ai o el factor de multiplicaci�n en la sumatoria
    z = (A*R(raices));
    c = c + z;
end
r=c;   % salida de la integral
err_prct = abs(abs(funt_int - r)/funt_int) * 100;  % error porcentual del m�todo
end

