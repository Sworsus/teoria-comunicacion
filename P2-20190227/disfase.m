function H=disfase(N, pot)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%   Introduce una dist. lineal modelada como una deformación
%   de la respuesta en fase ideal. Tal deformación se representa 
%   como una potenciación de la recta ideal: angle(H(W))=-W^pot.

%   *N: Longitud de H
%   *fs: Frecuencia de muestreo del sistema simulado
%   *pot: potencia a la que se eleva la recta -W
%
%   *H: Función de transferencia entre 0 y 2pi (Vector fila)
%

delta=2*pi/N;
omega=0:delta:2*pi-delta;
Nmed=floor(N/2)+1;
phi=[-omega(1:Nmed).^pot/(pi^(pot-1))];
phi=[phi abs(omega(Nmed+1:N)-2*pi).^pot/(pi^(pot-1))];
H=exp(i*phi); %vector fila

%fin de la función 
end

