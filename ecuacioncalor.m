%Diferencias finitas, ecuación de Laplace 
% Autores: 
%Elizabeth Corte, Lizbeth Espinoza, Javier Sotamba
% Fecha de implementacion: 02-01-2022
% Esta función resuelve la ecuacion del calor a través
% del método de diferencias finitas.
% Parámetros de entrada. 
% f: función
% a1: valor inicial 
% a2: valor inicial
% a: variación de x
% b; variación de t
% n,m: cantidad de particiones 

function U=ecuacioncalor(f, a1, a2, a, b, c, n, m)
  
h=a/(n-1);
k=b/(m-1);
r=c^2*(k/h^2);
s=1-2*r; 
U=zeros(n,m);
U(1,1:m)=a1;
U(n,1:m)=a2;
U(2:n-1,1)=(f(h:h:(n-2)*h))';
  
for j=2:m
  for i=2:n-1
      U(i,j)=s*U(i,j-1)+r*(U(i-1,j-1)+U(i+1,j-1));
   endfor
endfor
  
U=U';

endfunction
  