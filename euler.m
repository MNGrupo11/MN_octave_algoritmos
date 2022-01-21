
% M�todo de Euler  
% Autores:
% Javier Sotamba, Elizabeth Corte, Lisbeth Espinoza 
% Fecha de implementacion: 13/12/2021

% Par�metros de entrada:
%-----------------------------------------------------------
% f: funci�n a integrar                                     |
% a: condici�n inicial para x                               |
% yo:condici�n inicial para y                               |
% n: n�mero de intervalos para evaluar la ecuaci�n          |
% fin: valor en x, en donde se va a obtener la aproximaci�n |
% f: ecuaci�n diferencial                                   |
%-----------------------------------------------------------

% Par�metros de salida:
%--------------------------------------------------------------
% difal: resultados de aproximaci�n de la ecuaci�n diferencial | 
%--------------------------------------------------------------

function difal=eulerdiferencial(a, yo, n, fin, f)
  
  %Xn= a + n*(/\x)
  %delta=(b-a)/n
  %yn=y{n-1}+delta*f(x{n-1},y{n-1})
  syms x;
  syms y; 
  delta=(fin-a)/n; % Corresponde n_intervalo a avanzar 
  
  x_n=[]; % Almacena las condiciones inicales para x 
  for i=1:n+1
    x_n(i)= a+(i-1)*delta; 
  endfor
  
  ini=yo;
  fy1=subs(f,x,a); % Se obtiene las condiciones iniciales en la funci�n 
  fyt=subs(fy1,y,yo);
  
  for j=1:n % Se evalua la funci�n de acuerdo a los n_intervalos creados 
    
    yn=ini+delta*fyt; % Aproximaci�n de la ecuaci�n diferencial 
    
    xi=subs(f,x,x_n(j+1));
    fi=subs(xi,y,yn); 
    
    ini=yn;
    fyt=fi; 
    
    
  endfor
  difal=double(yn); 
endfunction