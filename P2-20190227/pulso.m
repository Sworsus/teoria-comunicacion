function [Xp,t,Ts,Fs] = pulso()
%%%%%%%%%%%%%%%%%%%%
% Generar un pulso
%%%%%%%%%%%%%%%%%%%%

Fs=6*10^(6);         %Frecuencia de muestreo
Ts=(1/Fs);           %Período de muestreo
Tpulso=4*10^(-6);    %Longitud del pulso
Tmax=42.66*10^(-6);  %Longitud de la ventana

%Generar el eje de tiempo
round((Tmax/Ts)+1);
t=0:Ts:Tmax;

%Calculo del numero de muestras de la ventana
N=length(t);

%Calculo del numero de muestras del pulso
P=round((Tpulso/Ts)+1);

%Generación del vector del pulso
Desp=20;                %Desplazamiento
Xp=[zeros(1, Desp) ones(1, P) zeros(1, N-(Desp+P))];

%Solución
%plot(t, Xp)



