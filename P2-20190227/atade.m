function y=atade(x, a, d)
%
% function y=atade(x, a, d)
% Esta función simula un bloque atenuador y retardador.
% El número de muestras de y es igual al número de muestras de x.
% Datos que se le pasan:
%
%   *x: Secuencia de entrada al bloque en vector fila.
%   *a: Atenuación expresada en veces.
%   *d: Retardo expresado en veces.
%

N=length(x);
if (d>N)
    y=zeros(1, N);
else
    y=zeros(1, d);
    y(1, d+1:N)=x(1:N-d)/a;
end;

% Fin de la función atade