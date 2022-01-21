%Metodo para sistemas de ecuaciones diferenciales
%Autores: Elizabeth Corte, Lizbeth Espinoza, Javier SOtamba

%ARGUMENTOS
  % f = dy/dx
  % g = funcion numero de pasos
  % t0, x0, y0 = condiciones inciales
  % tf = condiciones finales
  % n = parametro para calculo del paso
  % x, y  funciones del sistema 

function [t,x,y] =sis_euler(f,g,t0,tf,x0,y0,n)

  h=(tf-t0)/n;
  t=t0:h:tf;
  x=zeros(n+1,1); 
  y=zeros(n+1,1);
  x(1)=x0; y(1)=y0;
  
  for i=1:n

    k1=h*f(t(i),x(i),y(i));
    l1=h*g(t(i),x(i),y(i));
    
    k2=h*f(t(i)+h/2,x(i)+k1/2,y(i)+l1/2);
    l2=h*g(t(i)+h/2,x(i)+k1/2,y(i)+l1/2);
    
    k3=h*f(t(i)+h/2,x(i)+k2/2,y(i)+l2/2);
    l3=h*g(t(i)+h/2,x(i)+k2/2,y(i)+l2/2);
    
    k4=h*f(t(i)+h,x(i)+k3,y(i)+l3);
    l4=h*g(t(i)+h,x(i)+k3,y(i)+l3);  
    
    x(i+1)=x(i)+(k1+2*k2+2*k3+k4)/6;
    y(i+1)=y(i)+(l1+2*l2+2*l3+l4)/6;        
  end
  
end