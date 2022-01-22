% La siguiente funcion realiza la interpolacion spline cubico
% Autores
% Elizabeth Corte, Javier Sotamba 
% Fecha de implementacion: 11/12/2021
% Parametros de entrada
% X: vectores para la interpolacion 

%parametros de salida 
% a: coeficientes de los polinomios cúbicos que interpolan a los datos
% b: coeficientes de los polinomios cúbicos que interpolan a los datos
% c: coeficientes de los polinomios cúbicos que interpolan a los datos
% d: coeficientes de los polinomios cúbicos que interpolan a los datos
% grafica del trazador cubico
% y : ecuacion spline cubico de manera simbolica
function [a,b,c,d,y]=Spline_cubico(x1,y1,k)
o=length(x1); %longitud del vector x
p=length(y1); % longitud del vector y
if o==p % condicion para que se ejecute el programa
X=[x1;y1]; % unir en una matriz los vectores x y y
n=length(X(1,:)); %longitud de la matriz
for i=1:n;
    a(i)=X(2,i);% recorrer la fila 2 de la matriz
end

for i=1:n-1;
    h(i)=X(1,i+1)-X(1,i);% recorrer la fila 1 y restar el valor anterior
end

for i=2:n-1; %recorrer la matriz
    alfa(i)=3/h(i)*(a(i+1)-a(i))-3/h(i-1)*(a(i)-a(i-1));
end
% resolver un sistema tridiagonal
l(1)=1;
mu(1)=0;
z(1)=0;

for i=2:n-1;
    l(i)=2*(X(1,i+1)-X(1,i-1))-h(i-1)*mu(i-1);
    mu(i)=h(i)/l(i);
    z(i)=(alfa(i)-h(i-1)*z(i-1))/l(i);
end

l(n)=1;
z(n)=0;
c(n)=0;

for i=n-1:-1:1;
    c(i)=z(i)-mu(i)*c(i+1);
    b(i)=(a(i+1)-a(i))/h(i)-h(i)*(c(i+1)+2*c(i))/3;
    d(i)=(c(i+1)-c(i))/(3*h(i));
end
%graficar spline cubico
figure(k)
for i=1:n-1;
    x=X(1,i):0.1:X(1,i+1);% encontrar los valores de x para la grafica
    polinomio=a(i)+b(i)*(x-X(1,i))+c(i)*(x-X(1,i)).^2+d(i)*(x-X(1,i)).^3; %encontrar los valores de y para la gráfica
    hold on
    plot(x,polinomio,'b')%mandar a graficar
end
% spline cúbico de forma simbolica
syms("x");
for i=1:n-1;
    y=a(i)+b(i)*(x-X(1,i))+c(i)*(x-X(1,i)).^2+d(i)*(x-X(1,i)).^3; %encontrar los valores de y para la gráfica
end

else
error("Los vectores deben ser del mismo tamanio")
end
 end