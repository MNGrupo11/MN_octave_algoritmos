% Funcion que implemeta el metodo de descompocizión LU para un sistema 
% de ecuaciones lineales
% Autores: Javier Sotamba - David Tello - Jonnathan Ramon 
%Fecha de implementaci�n: 28 de octubre de 2021
function [L,U,x] = descomposicion_LU(A, b)
[A1,A2]= size(A);
[b1,b2]= size(b);

if A2 == b1
[n, n] =size(A); % Determina el tamaño de A
L = eye(n); % Matriz identidad para L
U = eye(n); % Matriz identidad para U
for k = 1:n
    L(k, k) = 1;
    U(1, k) = A(1, k);
    for i = k:n
        U(k, i) = A(k, i) - L(k, 1:k - 1) * U(1:k-1, i);
    end
    for i = k + 1:n
        L(i, k) = (A(i, k) - L(i, 1:k -1) * U(1:k - 1, k)) / U(k, k);
    end
end
z = inv(L) * b; % Primera parte de la solución
x = inv(U) * z; % Solución
else
error("Las matrices deben ser cuadradas")
end
