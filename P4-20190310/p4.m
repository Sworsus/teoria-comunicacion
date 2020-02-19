%% P4-Rafael Jose Martin Pelaez
clear all;close all;

%Valores iniciales;
fs=1024;Ts=1/fs;
N=1024;
fc=200;wc=2*pi*fc;
Pc=-20;
fm=16;wm=2*pi*fm;
df=20;dw=2*pi*df;
%fm=input('Frecuencia moduladora:');wm=2*pi*fm;
%df=input('Desviacion de frecuancia:');dw=2*pi*df;
Z=50;

%% ----------Apartado 4----------

%Calulo de la amplitud (despejando A de la ecuacion de la potencia);
Ac=sqrt(2*Z*10^(Pc/10)/1000);
sprintf('La amplitud es: A = %.15gmW',Ac)
%Indice de modulacion;
beta=df/fm;
sprintf('El indice de modulacion es: beta = %.15g',beta)
%Ancho de banda de Carlson;
BW=2*(fm+df);
sprintf('El ancho de banda es: BW = %.15gHz',BW)

%Vector de muestreo
t=0:Ts:N/fs-Ts;

%% ----------Apartado 5----------

%Señal moduladora normalizada;
xn=cos(wm.*t);

%Integral de xn;
phyt=sin(wm.*t);

%Señal FM
yt=Ac.*cos(wc.*t+beta.*phyt);

%% ----------Apartado 6----------

%Señal moduladora;
figure,time_dep(xn,Ts,Z,'Señal moduladora','log');

%Medida de la potencia de la portadora;
P_port=10*log10(powmeter(xn,fs,fc,BW,Z))+30;
sprintf('El valor de potencia de la portadora es: P_port = %.15gdBm',P_port)

%Señal FM;
figure,time_dep(yt,Ts,Z,'Señal FM','log');

for df=20:7.5:50;
    fm=16;wm=2*pi*fm;
    dw=2*pi*df;
    beta=df/fm;
    xn=cos(wm.*t);phyt=sin(wm.*t);
    %Señal FM
    yt=Ac.*cos(wc.*t+beta.*phyt);
    %Señal FM;
    s=sprintf('Señal FM para desviacion de frec %.15g',df);
    figure,time_dep(yt,Ts,Z,s,'log');
end

%% ----------Apartado 7----------

%Medida de la potencia con BW de Carlson;
P_FM=10*log10(powmeter(yt,fs,fc,200-72,Z))+30;
sprintf('El valor de potencia señal FM BW=128 es: P_FM = %.15gmW',P_FM)

%Medida de la potencia con BW de Carlson;
P_FM=10*log10(powmeter(yt,fs,fc,BW,Z))+30;
sprintf('El valor de potencia señal FM BW de Carlson es: P_FM = %.15gmW',P_FM)

%Medida de la potencia con cirterio caida 20dB;
P_FM=10*log10(powmeter(yt,fs,fc,200-168,Z))+30;
sprintf('El valor de potencia señal FM BW criterio caida 20 dB es: P_FM = %.15gmW',P_FM)

%% ----------Apartado 9----------

fs=1024*32;Ts=1/fs;
N=1024*32;
fc=200;wc=2*pi*fc;
fm=16;wm=2*pi*fm;
df=20;

Pc=-20;
Z=50;

%Calulo de la amplitud
Ac=sqrt(2*Z*10^(Pc/10)/1000);
%Indice de modulacion;
beta=df/fm;
%Ancho de banda de Carlson;
BW=2*(fm+df);

%Vector de muestreo
t=0:Ts:N/fs-Ts;

%Señal moduladora normalizada;
xn=cos(wm.*t);
%Integral de xn;
phyt=sin(wm.*t);
%Señal FM
yt=Ac.*cos(wc.*t+beta.*phyt);

figure,time_FM(yt,Ts,'Señal FM con Time_FM');
