function y=lpf(x, fs, fc, n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%
%   *x: Secuencia de entrada en vector fila
%   *fs: Frecuencia de muestreo del sistema simulado
%   *fc: Frecuencia de corte del filtrado
%   *n: Orden del filtro
%

N=length(x);
N2=round(N/2);
if N2==N/2   %Si x es de longitud par
    f=0:fs/N:fs/2;
else         %Pero si es de longitud impar
    f=0:fs/N:fs/2-fs/N;
end;
F=(sqrt(ones(1, length(f))+(f/fc).^(2*n))).^(-1);
F=[F F(N2:-1:2)];
X=fft(x, N);
Y=X.*F;
y=real(ifft(Y, N));

%fin de la función end
end

