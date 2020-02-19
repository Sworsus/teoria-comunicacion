function y=muestras(x,delay)

global SAMPLING_FREQ;

ret=round(delay*SAMPLING_FREQ);
y=x(ret:10:length(x));

end;