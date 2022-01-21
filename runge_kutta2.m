%RUNGE_KUTTA_SEGUNDO_ORDEN (Método de Heun)
%   RUNGE_KUTTA2(F,W,N,C) llenar
%       sol=runge_kutta2(f,y0,a,b,h)
%       sol = valor aproximado del problema de valor inicial
%       v_real = valor real del problema de valor inicial
%       e_a  = error absoluto
%       f = EE.DD
%       fun = solucion de EE.DD
%       y0 = condicion inicial para y
%       a = condicion inicial para x
%       b = valor final p

function [sol,v_real,e_a]=runge_kutta2(f,fun,y0,a,b,h)
format long;
syms x y;
n=(b-a)/h; %numero de segmentos en los que se evaluara la funcion
Y(1)=y0;
T=[a:h:b]; %valores que tomara la variable  x 

if a>b                            
  msgID = 'RUNGE_KUTTA2:condicion';
  msg = 'Error';
  error(msgID,msg)
  
else
for i=1:n
  % coeficientes del método de Runge-Kutta 
  k1=subs(f,[x y],[T(i) Y(i)]); 
  k2=subs(f,[x y],[T(i)+h,Y(i)+h*k1]); 
  Y(i+1)=Y(i)+double(k1/2+k2/2)*h;
  v_real=double(subs(fun,x,T(i+1))); %valor real de la solucion de EE.DD
  e_a=abs((v_real-Y(i+1))/v_real*100); %error absoluto
end
sol=double(Y(n+1)); % valor aproximado de la solucion de EE.DD
end 
end