function x=conv_a(y,z)

global SAMPLING_FREQ;
x=conv(y,z)/SAMPLING_FREQ;

end;