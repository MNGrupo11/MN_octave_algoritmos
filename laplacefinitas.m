% Diferencias finitas, ecuación de Laplace 
% Autores: 
% Elizabeth Corte, Lizbeth Espinoza, Javier Sotamba
% Fecha de implementacion: 02-01-2022
% Esta función calcula la EDP de Laplace a través,
% del método de diferencias finitas.
% Parámetros de entrada. 
% ua: Datos iniciales horizontal 
% ub: Datos iniciales
% uc: Datos iniciales en vertical  
% ud: Datos iniciales 
% n: número de clumnas 
% m: número de filas 
% iter: número máximo de iteraciones 
% err: toleracion máxima 
% Salida.
% r: matríz resultado   
function r=laplacefinitas(ua, ub, uc, ud, n, m, iter, err, fi)
  
  for i=1:n+2 % Se crea una matriz y se rellena los lados horizontales, columnas  
    u(i,1)=uc;
    u(i,m+2)=ud;
  endfor
  
  for j=1:m+2 % Se rellena la matriz lados verticales, filas 
    u(1,j)=ua;
    u(n+2,j)=ub;
  endfor
  
  p=(ua+ub+uc+ud)/4; % Promedio de todas las condiciones iniciales 
  
  for i=2:n+1 % Se rellena los puntos interiores de la matriz 
    for j=2:m+1
      u(i,j)=p;
    endfor
  endfor
  
  k=0; % Parametro que controla el numero de iteraciones
  conv=0; % Parametro que controla el error 
  while k<iter & conv==0
    k=k+1;
    t=u;
     for i=2:n+1
       for j=2:m+1
         u(i,j)=0.25*(u(i-1,j)+u(i+1,j)+u(i,j+1)+u(i,j-1)); % Se rellena la matriz desde (2,2) con la formula para el termino central  
       endfor
     endfor
     
     if norm((u-t),inf)/norm(u,inf)<err % Aproxima el error y compara con el maximo permitido, si val==TRUE el bucle while termina  
       conv=1;
     endif
     
  endwhile
  
  if conv==1 % Muestra las figuras de la discretizacion de los datos 
    figure(fi)
    disp(u)
    disp(k)
    [x,y]=meshgrid(1:m+2,1:n+2); % Asignacion de vectores 
    surf(x,y,u) % Grafica de una superficie 3D 
    shading flat 
    
  else
    disp('Esta ecuacion no converge')
  endif
  
endfunction