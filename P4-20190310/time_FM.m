function time_FM(x,T,s)
%
% function time_FM(x,T,s)
%
% Esta función representa la señal FM en el dominio del tiempo.
%
% Parametros de entrada:
% ......................
%x: señal a analizar (real)
%T: periodo de muestreo
%s: título que se quiere aparezca
% 06/02/07



a = length(x);
% no muestras de la señal
ciclos = 2;
% no de ciclos que se verán en el osciloscopio
y = 2*(x>0)-1;
% señal cuadrada (+1,-1) con el signo de x
z = y(2:a)-y(1:a-1);
% marca con 1 cuando y va a cambiar de -1 a +1
z = z>1;
% convierte z en variable lógica (sincronismo)
I = find(z);
% índice (posición) de los elementos no-cero
NI = length(I);
% no elementos no-cero (elementos del vector I)
vector = I(1:ciclos:NI-2*ciclos-1);% seleccionamos elementos en I
MM = 12*ciclos*16;
% muestras de señal en el no de ciclos
matriz = zeros(length(vector),MM);
% matriz con las señales que se visualizarán:
%* se inicializa con ceros
%* hay "length(vector)" señales (barridos de osciloscopio)
%* cada barrido tiene MM muestras de señal
for jota = 1:length(vector) % se rellena con los valores de la señal
matriz(jota,1:MM) = x(vector(jota)+1:vector(jota)+MM);
end
plot((0:MM-1)*T,matriz','b')
% se genera el eje con los instantes de muestreo, y se pinta
xlabel('t (sg)'), ylabel('V (voltios)')
title(s)
% Fin de la función time_FM
