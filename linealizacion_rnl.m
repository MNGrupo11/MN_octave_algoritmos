% Funci�n para ajuste de relaciones no lineales 
% Autores: Javier Sotamba, David Tello, Jonnathan Ram�n 
% Fecha de implementaci�n: 11 de noviembre de 2021
% Par�metro de entrada:
% x: datos en x
% y: datos en y
% t: tipo de funci�n 
% Par�metros de salida:
%xo: transformaci�n en x
%yo: transformaci�n en y
%m: pendiente de recta linealizada
%b: intersecci�n de recta linealizada 
function [fun, xo, yo, m, b] = linealizacion_rnl(x,y,t) % Funci�n de ajuste
  
  function [m, b] = minimos_cuadrados(x1,y1) % Funci�n de regresi�n lineal 
  
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
  
if(t==1) % funci�n  exponencial 
  
  xo=x;
  yo=reallog(y);
  [m,b]= minimos_cuadrados(xo,yo);
  fun= @(z)e.^(b+m*z);
  
elseif(t==2) % funci�n potencial 
  
  xo=log10(x);
  yo=log10(y);
  [m,b]= minimos_cuadrados(xo,yo);
  fun= @(z)(10.^b)*z.^(m);
  
else % funci�n de crecimiento
   
  xo=x.^(-1);
  yo=y.^(-1);
  [m,b]= minimos_cuadrados(xo,yo);
  
endif
 
  endfunction