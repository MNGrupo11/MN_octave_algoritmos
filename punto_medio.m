%PUNTO_MEDIO
%   PUNTO_MEDIO(F,W,N,C) llenar
%       sol=unto_medio(f,y0,a,b,h)
%       sol = valor aproximado del problema de valor inicial
%       v_real = valor real del problema de valor inicial
%       e_a  = error absoluto
%       f = EE.DD
%       fun = solucion de EE.DD
%       y0 = condicion inicial para y
%       a = condicion inicial para x
%       b = valor final para x
%       h = tamaño de paso

function [sol,v_real,e_a]=punto_medio(f,fun,y0,a,b,h)
format long;
syms x y;
n=(b-a)/h; %numero de segmentos en los que se evaluara la funcion
Y(1)=y0;
T=[a:h:b]; %valores que tomara la variable  x 
v_real=0;
e_a=0;
if a>b                            
  msgID = 'PUNTO_MEDIO:condicion';
  msg = 'Error';
  error(msgID,msg)
  
else

for i=1:n
  k1=subs(f,[x y],[T(i) Y(i)]); %pendiente al principio del intervalo [T  Y]
  k2=subs(f,[x y],[T(i)+h/2,Y(i)+(h*k1/2)]); %pendiente en el punto medio del intervalo
  Y(i+1)=Y(i)+h*double(k2);
  v_real=double(subs(fun,x,T(i+1))); %valor real de la solucion de EE.DD
  e_a=abs((v_real-Y(i+1))/v_real*100); %error absoluto
end
sol=double(Y(n+1)); % valor aproximado de la solucion de EE.DD
end 
end