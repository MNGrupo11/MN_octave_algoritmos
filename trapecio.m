% La siguiente funci�n realiza la regla del trapecio 
% Autores
% Elizabeth Corte, Javier Sotamba 
% Fecha de implementacion: 05/01/2021
% Parametros de entrada
% g: funci�n en la que se aplicara la regla del trapecio 
% a: l�mite inferior de la integral
% b: l�mite superior de la integral
% n: cantidad de trapecios a utilizar

% Par�metros de salida 
% r: aproximaci�n al resultado real


function r = trapecio(g,a,b,n)  

h=(b-a)/n; % condici�n inicial para la divisi�n de intervalos equidistantes
 
in=subs(g,a); % valor inicial de la funci�n 

fin=subs(g,b); % valor final de la funci�n 

dos=a+h:h:b-h; % vector con valores intermedios de x  

inter=2*sum(subs(g,dos)); % evaluaci�n de los valores intermedios en la funci�n 

t=(h/2)*(in+fin+inter); % multiplicaci�n y sumatoria final 

r=double(t); % paso de variable simbolica a real 

end
