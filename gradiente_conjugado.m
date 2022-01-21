%GRADIENTE CONJUGADO
%   GRADIENTE_CONJUGADO(FUN,X0,ITER,TOL) llenar
%       [datos,i,x,fx]=gradiente_conjugado(fun,x0,iter,tol)
%       datos = todas las variables de la ejecución
%       i = numero de iteraciones
%       x = solucion  x 
%       f(x) = solucion x evaluada en la funcion
%       fun = funcion a evaluar
%       x0 = vector inicial
%       iter = numero maximo de iteraciones
%       tol = error tolerancia

function [datos,i,x,fx]=gradiente_conjugado(fun,x0,iter,tol)

f= matlabFunction(fun); 
fx= @(x) f(x(:,1),x(:,2));

grad= gradient(fun);%Encontrar el gradiente de la funcion

G=matlabFunction(grad); 
gradx= @(x) G(x(:,1),x(:,2));

H1= hessian(fun); %Calcular la matriz Hessian
Hx= matlabFunction(H1);

i=1; %contador
X=[]; %Matriz donde se guardaran los puntos solución en cada iteración

S=0;   %Direccion de busqueda inicial
G_pr= -gradx(x0); %Gradiente inicial

while 1  
    X=[X;x0]; %Guardar los vectores de cada iteración

    G_i= -gradx(x0); %Calcular gradiente en x0
    H= Hx(x0); %Calcular matriz Hessian en x0
    bet = norm(G_i).^2/norm(G_pr).^2; %calcula beta
    S = G_i + bet.*S; % Encuentra la direción de busqueda
    lam = G_i'*G_i/(S'*H*S); % calcula lambda
    Xi_1= x0+lam.*S'; %Calcular xi+1 
    
    datos(i,1)=Xi_1(1);
    datos(i,2)=Xi_1(2);
    datos(i,3)=fx(Xi_1);
    datos(i,4)=norm(gradx(x0));
    
    if i>iter
        msgID = 'GRADIENTE_CONJUGADO :iteraciones';
        msg = 'Gran número de iteraciones, posiblemente el método divergió';

        error(msgID,msg)
    else
        if norm(gradx(x0))<tol
            break;
        else
            x0=Xi_1;
            G_pr=G_i;
        end
    end
    i=i+1; 
end
x=x0;
end
