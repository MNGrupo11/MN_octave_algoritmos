%APROXIMACION POR DIFERENCIAS FINITAS 
%   INTER_SPLINE_LINEAL (X,Y) llenar
%      derivnum=diferencias_finitas(x,f,xi,h)
%       derivnum matriz de resultados  
%       x = lista 1 a tratar 
%       y = lista 2 a tratar
%       xi valor inicial 
%       h tamaño de paso

function derivnum=diferencias_finitas(x,f,xi,h)
  
n=length(x);

if n!=length(f)
  msgID = 'DIFERENCIAS FINITAS  :condicion';
  msg = 'Error: No tiene la misma dimension ';
  
  error(msgID,msg)
else
for i=1:n
  if x(i)==xi
    dr=(3*f(i)-4*f(i-1)+f(i-2))/2*h;
    dr2= (2*f(i)-5*f(i-1)+4*f(i-2)-f(i-3))/h^2;
    dp=(-f(i+2)+4*f(i+1)-3*f(i))/2*h;
    dp2= (-f(i+3)+4*f(i+2)-5*f(i+1)+2*f(i))/h^2;
    dc= (-f(i+2)+8*f(i+1)-8*f(i-1)+f(i-2))/12*h;
    dc2= (-f(i+2)+16*f(i+1)-30*f(i)+16*f(i-1)-f(i-2))/12*h^2;
   end
end   
derivnum=[dr,dr2,dp,dp2,dc,dc2];
end
end