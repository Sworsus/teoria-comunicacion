function time_dep(x,T,Z,s,lin_log)
%
% function time_dep(x,T,Z,s,lin_log)
%
% Esta funci�n representa en la parte superior la se�al en el dominio
% del tiempo, y en la parte inferior la d.e.p.
%
% Parametros de entrada:
% ......................
%
%x: se�al a analizar (real)
%T: periodo de muestreo
%Z: impedancia (ohmios)
%s: t�tulo que se quiere aparezca
%lin_log: representaci�n lineal ('lin') o logaritmica ('log')
%
% 06/02/07
%
a=length(x);
q=(0:a-1)*T;
subplot(211),grid on;plot(q,x,'b')
xlabel('t (sg)'),ylabel('V (voltios)')
title(s)

x1=fft(x)/a;
y=x1.*conj(x1);
y=[y(1) 2*y(2:a/2)]/real(Z);
eje=(1/T)*(0:a/2-1)/a;
aux=(lin_log(1:3) =='lin');

if sum(aux)==3
subplot(2,1,2),grid on;plot(eje,y*1e3,'b')
ylabel('mw')
else
subplot(2,1,2),grid on;plot(eje,10*log10(y*1e3+eps),'b');
ylabel('dBm')
end
grid,xlabel('Hz')
%pause
% Fin de la funci�n time_dep
