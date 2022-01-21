%METODO DE HEUN
%   METODO HEUN(F,YO,A,B,H,N_E) llenar
%       [Y,T]=metodo_heun(f,y0,a,b,h)
%       Y = valor aproximado del problema de valor inicial 
%       f = sistema de EE.DD
%       y0 = condicion inicial para y1 y y2
%       a = condicion inicial para x
%       b = valor final x
%       h = tamaño de paso
%       n_e = numero de ecuaciones

function [Y,T]=metodo_heun(f,y0,a,b,h,n_e)
  
n=(b-a)/h; %numero de segmentos en los que se evaluara la funcion
T=[a:h:b]; %valores que tomara la variable  x 
Y=zeros(n_e,n+1);
Y(:,1)=y0;

if a>b                            
  msgID = 'METODO_HEUN:condicion';
  msg = 'Error';
  
  error(msgID,msg)
  
else
  
for i=1:n
  % coeficientes del método de Heun 
  k1=f(T(i),Y(:,i)); 
  k2=f(T(i)+h,Y(:,i)+k1*h); 
  Y(:,i+1)=Y(:,i)+(k1+k2)*h/2;
end

end 
end