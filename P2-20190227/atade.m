function y=atade(x, a, d)
%
% function y=atade(x, a, d)
% Esta funci�n simula un bloque atenuador y retardador.
% El n�mero de muestras de y es igual al n�mero de muestras de x.
% Datos que se le pasan:
%
%   *x: Secuencia de entrada al bloque en vector fila.
%   *a: Atenuaci�n expresada en veces.
%   *d: Retardo expresado en veces.
%

N=length(x);
if (d>N)
    y=zeros(1, N);
else
    y=zeros(1, d);
    y(1, d+1:N)=x(1:N-d)/a;
end;

% Fin de la funci�n atade