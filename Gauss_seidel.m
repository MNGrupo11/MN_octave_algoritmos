% La siguiente funcion realiza el metodo de Gauss_seidel para encontrar la solucion
% de un sistema de ecuaciones lineales
% Autores
% Elizabeth Corte, Javier Sotamba
% Fecha de implementacion: 4/11/2021
% Parametros de entrada
% A: matriz de coeficientes
% b: vector de terminos independientes
% x0: vector inicial del sistemas
% tol: tolerancia del resultado
% max: numero maximo de iteraciones

% parametros de salida
% x: el vector de solucion
% er: error relativo cometido
% it: el numero de iteraciones que se han ocupado 

function [x,it]= Gauss_seidel(A,b,x0,tol,max)
  [A1,A2]=size(A);
  [b1,b2]=size(b);
  if A2 == b1
  [n,n]=size(A); % asignar el tamaño de la matriz A 
  if nargin('Gauss_seidel') < 3 % condicion para entrar en el bucle
    x0=zeros(n,1); % declarar e inicializar la variable x0
    tol= 1.e-3; % decalrar la tolerancia del sistema
    max=1000; %declarar el numero maximo de iteraciones
  end
  it=0; % inicializar la iteraciones
  er=100.0;% declarar el error
  D=diag(diag(A));% obtener la matriz diagonal
  D1=inv(D);% obtener la inversa de la matriz
  E=-tril(A,-1); % obtener la matriz triangular inferior
  F=-triu(A,+1);% obtener la matriz triangular superior
  res= norm(A*x0 - b);
  er= res/norm(b); % obtener el error relativo
  
  while it<max || er >tol %bucle para resolver el sistema lineal
    it=it+1;% aumentar la iteracion
    x=(D-E)\(F*x0+b); % aplicar el metodo
    res= norm(A*x - b);
    er= res/norm(b);%calcular el error
    x0=x;% actualizar el resultado
  end
else
  error("Las dimensiones de las matrices no son iguales")
  end
end

