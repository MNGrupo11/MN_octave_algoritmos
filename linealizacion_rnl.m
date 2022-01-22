% Función para ajuste de relaciones no lineales 
% Autores: Javier Sotamba, David Tello, Jonnathan Ramón 
% Fecha de implementación: 11 de noviembre de 2021
% Parámetro de entrada:
% x: datos en x
% y: datos en y
% t: tipo de función 
% Parámetros de salida:
%xo: transformación en x
%yo: transformación en y
%m: pendiente de recta linealizada
%b: intersección de recta linealizada 
function [fun, xo, yo, m, b] = linealizacion_rnl(x,y,t) % Función de ajuste
  
  function [m, b] = minimos_cuadrados(x1,y1) % Función de regresión lineal 
  
  sumax=sum(x1);
  sumay=sum(y1);
  n=length(x1);
  cuadrado=sum(x1.^(2)); 
  mul=[];
 for i=1:n
   
  mul(i)=x1(i)*y1(i); 
end 
  mul=sum(mul)
  m = (mul-(sumax*sumay)/n)/(cuadrado-(sumax.^2)/n);
  b = (sumay/n) - (m*sumax/n);
 
  endfunction
  
if(t==1) % función  exponencial 
  
  xo=x;
  yo=reallog(y);
  [m,b]= minimos_cuadrados(xo,yo);
  fun= @(z)e.^(b+m*z);
  
elseif(t==2) % función potencial 
  
  xo=log10(x);
  yo=log10(y);
  [m,b]= minimos_cuadrados(xo,yo);
  fun= @(z)(10.^b)*z.^(m);
  
else % función de crecimiento
   
  xo=x.^(-1);
  yo=y.^(-1);
  [m,b]= minimos_cuadrados(xo,yo);
  
endif
 
  endfunction