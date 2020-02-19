function time_FM(x,T,s)
%
% function time_FM(x,T,s)
%
% Esta funci�n representa la se�al FM en el dominio del tiempo.
%
% Parametros de entrada:
% ......................
%x: se�al a analizar (real)
%T: periodo de muestreo
%s: t�tulo que se quiere aparezca
% 06/02/07



a = length(x);
% no muestras de la se�al
ciclos = 2;
% no de ciclos que se ver�n en el osciloscopio
y = 2*(x>0)-1;
% se�al cuadrada (+1,-1) con el signo de x
z = y(2:a)-y(1:a-1);
% marca con 1 cuando y va a cambiar de -1 a +1
z = z>1;
% convierte z en variable l�gica (sincronismo)
I = find(z);
% �ndice (posici�n) de los elementos no-cero
NI = length(I);
% no elementos no-cero (elementos del vector I)
vector = I(1:ciclos:NI-2*ciclos-1);% seleccionamos elementos en I
MM = 12*ciclos*16;
% muestras de se�al en el no de ciclos
matriz = zeros(length(vector),MM);
% matriz con las se�ales que se visualizar�n:
%* se inicializa con ceros
%* hay "length(vector)" se�ales (barridos de osciloscopio)
%* cada barrido tiene MM muestras de se�al
for jota = 1:length(vector) % se rellena con los valores de la se�al
matriz(jota,1:MM) = x(vector(jota)+1:vector(jota)+MM);
end
plot((0:MM-1)*T,matriz','b')
% se genera el eje con los instantes de muestreo, y se pinta
xlabel('t (sg)'), ylabel('V (voltios)')
title(s)
% Fin de la funci�n time_FM
