%RUNGE_KUTTA_TERCER_ORDEN
%   RUNGE_KUTTA3(F,W,N,C) llenar
%       sol=runge_kutta3(f,y0,a,b,h)
%       sol = valor aproximado del problema de valor inicial
%       v_real = valor real del problema de valor inicial
%       e_a  = error absoluto
%       f = EE.DD
%       fun = solucion de EE.DD
%       y0 = condicion inicial para y
%       a = condicion inicial para x
%       b = valor final p

function [sol,v_real,e_a]=runge_kutta3(f,fun,y0,a,b,h)
format long;
syms x y;
n=(b-a)/h; %numero de segmentos en los que se evaluara la funcion
Y(1)=y0;
T=[a:h:b]; %valores que tomara la variable  x 

if a>b                            
  msgID = 'RUNGE_KUTTA_3:condicion';
  msg = 'Error';
  error(msgID,msg)
  
else
for i=1:n
  % coeficientes del método de Runge-Kutta 
  k1=subs(f,[x y],[T(i) Y(i)]); 
  k2=subs(f,[x y],[T(i)+h/2,Y(i)+(h*k1/2)]); 
  k3=subs(f,[x y],[T(i)+h,Y(i)-k1*h+2*k2*h]);
  Y(i+1)=Y(i)+double(k1+4*k2+k3)*h/6;
  v_real=double(subs(fun,x,T(i+1))); %valor real de la solucion de EE.DD
  e_a=abs((v_real-Y(i+1))/v_real*100); %error absoluto
end
sol=double(Y(n+1)); % valor aproximado de la solucion de EE.DD

end 
end