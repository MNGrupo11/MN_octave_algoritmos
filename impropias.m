% Autores:
% Javier Sotamba, Elizabeth Corte, Lisbeth Espinoza 
% Fecha de implementacion: 10/12/2021
% Parámetros de entrada:
% f: función a integrar 
% a: límite inferior
% b: límite superior 
% Parámetros de salida:
% r: resultado de aproximación de la integral 

function [r]=impropias(f, a, b)
  function [ri]=cadevar(a1, a2, f1)
    syms t; 
    ao=1/a2; %Cambio de variable del límite superior 
    bo=1/a1; %Cambio de variable del límite inferior 
    f2=subs(f1,1/t); %Cambio de variable en la función 
    fi=(1/(t.^2))*f2; %Nueva función a evaluar 
    h=1/8; %(b-a)/n
    peval=ao+h/2:h:bo-h/2; %Intervalos en para evaluar la función  
    resul=double(subs(fi,peval)); %Evaluación de la nueva función en los intervalos y transformación de simbolico a real  
    ri=(1/8)*sum(resul); %Operaciones finales para la integral aproximada
  end 
   
  
  function rel= gausslegendretres(g, a, b)
   w=[0.5555556 0.8888889 0.5555556]; % Vector con constantes determinadas para w de tres
   z=[-0.7745967 0 0.7745967]; % Vector con constantes determinadas para z de tres
   m=(b-a)/2; 
   m2=(a+b)/2;
   def=1;
   intrl=w(1)*subs(g,m*z(1)+m2)+w(2)*subs(g,m*z(2)+m2)+w(3)*subs(g,m*z(3)+m2); % sumatoria y evaluación de cada punto en la función 
   rel= double(m*intrl); % tranformación de variable simbólica a real  
  endfunction
  %Contempla tres casos, en cada uno de ellos es necesario hacer un cambio de variable 
  if a*b>0
    rins=cadevar(a, b, f);
    r=rins; 
  elseif a==-inf
    s=-2;
    ro=cadevar(a, s, f);
    ra=gausslegendretres(f, s, b);
    r=ro+ra; 
  elseif a<0
    s=2;
    ro=cadevar(s, b, f); 
    ra=gausslegendretres(f, a, s);
    r=ro+ra; 
  endif
  end
 