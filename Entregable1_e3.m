clear all;
close all;

syms t;

m=0.5; %indice de modulacion

A=2;
mt=sinc(4*t);

fc=10^4;wc=2*pi*fc;
xn=cos(wc*t);

yt=A*(1+m*mt)*xn

Yw=fourier(yt)

w=19500*pi:1:20500*pi;
Yf=subs(Yw,'w',w/(2*pi));
subplot(2,1,1);plot(w,real(Yf))
subplot(2,1,2);plot(w,imag(Yf))