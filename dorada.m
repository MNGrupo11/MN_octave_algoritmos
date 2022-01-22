## Copyright (C) 2022 Zona Info
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} dorada (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Zona Info <Zona Info@DESKTOP-VOBKH0F>
## Created: 2022-01-06

% Método búsqueda de la sección dorada 
% Autores: 
%Elizabeth Corte, Lizbeth Espinoza, Javier Sotamba
% Fecha de implementacion: 07-01-2022
% Esta función encuentra el valor máximo de una función 
% Parámetros de entrada. 
% f: función
% xl: límite inferior  
% xu: límite superior 
% it: número de iteraciones 
% Parametros de salida.
% x: valor en donde la función tiene valor máximo 
% fx: valor en máximo de la función 



function [x, fx] = dorada(f, xl, xu, it)
  
  fl=f(xl); % límite superior evaluación 
  fu=f(xu); % límite inferior evaluación 
  R=(sqrt(5)-1)/2; 
  d=(xu-xl)*R; % intervalo de nueva aproximación 
  x1=xl+d;
  fx1=f(x1); 
  x2=xu-d; 
  fx2=f(x2); 
  i=0;
  while i<it-1
    
    d=d*R; 
    
    if fx1>fx2
      
      xl=x2;
      fxl=fx2;
      x2=x1;
      fx2=fx1;
      x1=xl+d;
      fx1=f(x1);  
      xu=xu;
      fu=fu; 
      
    elseif fx2>fx1
      
      xu=x1;
      fxu=fx1;
      x1=x2;
      fx1=fx2; 
      x2=xu-d;
      fx2=f(x2); 
      xl=xl;
      fl=fl; 
      
    endif
    
    i=i+1;
    
  endwhile
  
  if fx1>fx2
    
    x=x1;
    fx=fx1;
    
  else
    
    x=x2;
    fx=fx2; 
    
  endif
  
endfunction
