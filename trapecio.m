% La siguiente función realiza la regla del trapecio 
% Autores
% Elizabeth Corte, Javier Sotamba 
% Fecha de implementacion: 05/01/2021
% Parametros de entrada
% g: función en la que se aplicara la regla del trapecio 
% a: límite inferior de la integral
% b: límite superior de la integral
% n: cantidad de trapecios a utilizar

% Parámetros de salida 
% r: aproximación al resultado real


function r = trapecio(g,a,b,n)  

h=(b-a)/n; % condición inicial para la división de intervalos equidistantes
 
in=subs(g,a); % valor inicial de la función 

fin=subs(g,b); % valor final de la función 

dos=a+h:h:b-h; % vector con valores intermedios de x  

inter=2*sum(subs(g,dos)); % evaluación de los valores intermedios en la función 

t=(h/2)*(in+fin+inter); % multiplicación y sumatoria final 

r=double(t); % paso de variable simbolica a real 

end
