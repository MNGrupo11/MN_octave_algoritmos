% Metodo de Gauss
% Autores: Elizabeth Corte, Javier Sotamba 
% Fecha de implementacion: 21/10/2021
% Función Gauss, para realizar el método numérico de Gauss 
% Parametros de entrada y salida
% a: matriz cuadrada de orden n
% b: matriz rectangular de orden nx1
% R: solucion 

function [R] = gauss(a, b)
  [A1,A2]= size(a);
  [b1,b2]=size(b);
  
  if A2 == b1
    M=[a,b]; % Matriz ampliada de a con b
    R = b; % R sera una matriz donde se reemplazaran por las soluciones
    n = size(M,1); % n sera la dimension fila de M
    for j = 1:n-1
        for i = j+1:n -1
            M(i,:) = M(i,:) + M(j,:) * (- M(i,j) / M(j,j)); % En esta parte se hacen ceros los elementos bajo la diagonal principal
        end
    end
    for i = n:-1:1
        R(i) = M(i,n+1);
        for j = i + 1:n
            R(i) = R(i) - R(j) * M(i, j); % Se empieza desde la ultima fila y la ultima variable y se despeja para encontrar la solución
        end
    end
  else
    error("Las matrices deben ser de igual tamanio")
    end
end