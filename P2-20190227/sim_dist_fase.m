
H=disfase(length(yf), 3);
H_mod=abs(H);
H_ang=angle(H);
plot(H_mod), title('MODULO DE H'), pause

plot(H_ang), title('FASE DE H'), pause

yf=fft(yf);
y_out=yf.*H;
y_out=real(ifft(y_out, length(y_out)));
plot(y_out)