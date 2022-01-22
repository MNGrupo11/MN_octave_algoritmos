% Método de diferencias finitas para la ecuación de onda
% Autores:
% Javier Sotamba, Elizabeth Corte, Lizbeth Espinoza 
% Fecha de implementacion:23/Dic/2021
%-----------------------------------------------------------
% f: función
% g: funcion2
% a: extremo derecho [0,a]
% b; extremo derecho [0,b]
% c: constante de la ecuacion de la onda
% n,m: numero de puntos en la malla
% U: Matriz solucion 
%-----------------------------------------------------------

function U = diffinitaOnda(f,g,a,b,c,n,m)

h = a/(n-1);
k = b/(m-1);
r = c*k/h;
r2=r^2;
r22=r^2/2;
s1=1-r^2;
s2=2-2*r^2;
U=zeros(n,m);
for i=2:n-1
    U(i,1)=f(h*(i-1));
    U(i,2)=s1*f(h*(i-1))+k*g(h*(i-1))+r22*(f(h*i)+f(h*(i-2)));
end
for j=3:m
    for i=2:(n-1)
        U(i,j)=s2*U(i,j-1)+r2*(U(i-1,j-1)+U(i+1,j-1))-U(i,j-2);
    end
end

endfunction