%% P3-Rafael Jose Martin Pelaez
clear all;

%Volores iniciales;
fs=1024;Ts=1/fs;
N=1024;
fc=128;wc=2*pi*fc;
Pc=-20;
fm=16;wm=2*pi*fm;
Z=50;

%Indice de modulacion;
% while 1
%     m=input('Indice de modulacion (0<m<1):');
%     if (m<=1 && m>=0)
%         break;
%     end;
% end;
m=0.5;
%Lo pongo directamente para hacer el publish más comodo;

t=0:Ts:N/fs-Ts;

%Calulo de la amplitud (despejando A de la ecuacion de la potencia);
A=sqrt(2*Z*10^(Pc/10)/1000);

%Señal moduladora normalizada;
xn=cos(wm.*t);

%Señal modulada con un tono y(t);
yt=A.*(1+m.*xn).*cos(wc.*t);

%Representacion de la señal AM m=0.5
time_dep(yt,Ts,Z,'Señal AM','log');

%Medida de la potencia de la portadora
B=10;
P_port=10*log10(powmeter(yt,fs,fc,B,Z))+30;
if P_port==Pc
    sprintf('El valor de potencia de portadora obtenido %.15g dBm coincide con el teorico %.15g dBm',P_port,Pc)
end

%Medida de la potencia de la banda lateral superior
B=10;
P_dbu=10*log10(powmeter(yt,fs,fc+fm,B,Z))+30;
sprintf('Valor de potencia banda lateral superior obtenido %.15g dBm',P_dbu)

%Potencia total de la AM
B=2*fm;
P_AM=10*log10(powmeter(yt,fs,fc,B,Z))+30;
P_AMn=10^(P_AM/10);
sprintf('Valor de potencia total de la señal AM obtenido %.15g mW',P_AMn)

%Calulo de PEP
PEP=A^2*(1+m)^2/2*Z;
sprintf('Valor PEP obtenido %.15g W',PEP)

%Medida diferencia P_port y P_dbu, y calcular m
Dif=P_AM-P_dbu;
m1=round(2/(10^(Dif/20)),1);

if m1==m
    sprintf('El valor obtenido %.15g coincide con el teorico %.15g',m1,m)
end

%Apartado 6

%En m cercanas al 0, en el tiempo vemos que la señal practicamente no ha 
%sufrido apenas modulacion, en cambio, cuanto más nos acercamos al 1 (100%) 
%vemos que la señal sufre cambios en la amplitud mucho mayores y mas 
%rapido, por otro lado, en frecuencia, cuanto mas aumentemos m, mas
%potencia tienen las deltas laterales, tiene sentido ya que esta
%directamente relacionado.

%% Apartado 7
m=round(rand(),1)-0.1;

t=0:Ts:N/fs-Ts;

A=sqrt(2*Z*10^(Pc/10)/1000);

xn=cos(wm.*t);

yt=A.*(1+m.*xn).*cos(wc.*t);

time_dep(yt,Ts,Z,'Señal AM','log');

%Medida de la potencia de la banda lateral superior
B=10;
P_dbu=10*log10(powmeter(yt,fs,fc+fm,B,Z))+30;

%Potencia total de la AM
B=2*fm;
P_AM=10*log10(powmeter(yt,fs,fc,B,Z))+30;

m1=round(2/(10^((P_AM-P_dbu)/20)),1);
    
if m1==m
    sprintf('El valor obtenido %.15g coincide con el generado %.15g',m1,m)
end     
    