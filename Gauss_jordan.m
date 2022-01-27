%Funcion para la resolucion de un sistemas lineal de ecuaciones
%mediante el metodo de gauss-jordan
%Autores
%Elizabeth Corte, Javier Sotamba
%fecha de implementacion : 04/11/2021
%Parametros de entrada
%a= matriz ampliada con los valores de las incognitas y los coeficientes independientes
%Parametros de salida
% Matriz identidad
%solucion = Matriz con los nuevos terminos independientes

function solucion = Gauss_jordan(a)
  for m= 1: rows(a) %recorrer la filas de la matriz a
  k =a(m,m); %identificar la posicion en la matriz
  a(m, :)= a(m, :)/k; %aplicar el concepto de gauss-jordan
    for n =1 : rows(a);% recorrer la fila para obtener ceros
      if n != m %comparacion de valores 
      k= a(n,m);% ubicarse en la posicion n,m de la matriz
      a(n,:) = a(n,:)-k*a(m,:);% operacion para obtener los valores de ceros
      end
    end 
  end
 solucion = a(:,columns(a));% mostrar la solucion obtenida
end
