% Funcion para aplicar el metodo de Interpolacion de newton
% Autores: Elizabeth Corte, Javier Sotamba 
% Fecha de implementacion: 12/11/21
% Parametros de entrada y salida
% x: Vector con los valores de x
% y: Vector con los valores de x
% xi: Valor en x a interpolar
% polinomio: el polinomio calculado con dif divididas
% yi: Valor en y interpolado

function [yi, Px]= interpolacionnewton(x,y,xi)
%Verificar que no haya error en el tamaño de x y y
  n= length(x); %longitud del vector x
  m= length(y); %longitud del vector y
  if n==m
     b= zeros(n);  %Crear matriz en donde estaran la diferencias 
  else 
     error ("Los coeficientes de x y y deben ser del mismo tamaño")
  end
  %Calcular la tabla de diferencias
  n= length(x); %Cantidad de coeficientes ingresados en x 
  b(:,1)=y(:);  %Agregar a la matriz de diferencias los coeficientes de y en la columna 1 
  for j=2:n     %Recorrer las columnas o valores de y
    for i=1:n-j+1 %Recorrer cada uno de las filas
      b(i,j)=(b(i+1,j-1)-b(i,j-1))/(x(i+j-1)-x(i)); %Tabla de diferencias con la formula
    end
  end
a=b % matriz de coeficientes
c=a^-1 % Inversa de la matriz de coeficietes
A=c*y' % Solucion del sistema de ecuaciones
%Calcular el dato interpolado
  xt=1; %Variable auxiliar para multiplicar los elementos
  yi=b(1,1); %Valor inicial para empezar a interpolar 
  for j=1:n-1 %Recorrer la matriz
    %Aplicacion del concepto
    xt= xt.*(xi-x(j))% multiplicar el valor que se quiere interpolar por cada una de las x
    yi=yi+b(1,j+i)*xt; % sumar cada termino al anterior y multiplicar por los ternimos ya multiplicados
  end
 % Construccion de la ecuacion polinomial 
    syms x y 
    B=A'; % Transpuesta del sistema de ecuaciones
    XX(1,1)=x^0;
    for i=2:n
        XX(1,i)=x.^(i-1); %Elevar cada termino de x a la ^(i-1)
    end
    ZZ=XX; 
    P=(B.*ZZ);
    Px=(sum(P))
 end