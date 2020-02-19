function waveplot(in)

% WAVEPLOT ..... Plot the waveforms that represent binary signalling formats.
%
%	WAVEPLOT(X) plots waveform represented by the samples in the input
%		vector X generated by a previous call to the waveform 
%		generation function WAVE_GEN.
%
%	See also WAVE_GEN.

%	AUTHORS : M. Zeytinoglu & N. W. Ma
%             Department of Electrical & Computer Engineering
%             Ryerson Polytechnic University
%             Toronto, Ontario, CANADA
%
%	DATE    : August 1991.
%	VERSION : 1.0

%===========================================================================
% Modifications history:
% ----------------------
% 	o   the time scale starts at zero.
%	o   Added "checking"  11.30.1992 MZ
%	o	Tested (and modified) under MATLAB 4.0/4.1 08.16.1993 MZ
%===========================================================================

global START_OK;
global SAMPLING_CONSTANT;
global SAMPLING_FREQ;
global BINARY_DATA_RATE;
global CARRIER_FREQUENCY;
global NYQUIST_BLOCK;
global NYQUIST_ALPHA;
global DUOBINARY_BLOCK;
global BELL;
global WARNING;

check;

if (nargin ~= 1), 
   error(eval('eval(BELL),eval(WARNING),help waveplot'));
   return;
end
binary_data_period = 1/BINARY_DATA_RATE;
Ts = 1/SAMPLING_FREQ;

%------------------------------------------------------------------------------
%	Set up parameters
%------------------------------------------------------------------------------

in = in(:);
no_sample = length(in);				% Number of input samples
amplitude = max(abs(in));			% Maximum input value
if(amplitude == 0) amplitude = 1; end
time      = [1:(no_sample)]*Ts;	    % Default sampling instances

%------------------------------------------------------------------------------
%	We will use the array ``FOO'' to test whether the input array
%	represents a binary linecode or some other continuous amplitude
%	waveform.  If (FLAG == 0) --> binary --> use plotting function STAIR;
%	              (FLAG ~= 0) --> other  --> use plotting function PLOT.
%	It is not completely foolproof, but until something better comes up
%	let us use it.
%------------------------------------------------------------------------------

foo = in;
foo(in ==  amplitude) = zeros(length(in(in ==  amplitude)),1);
foo(in == -amplitude) = zeros(length(in(in == -amplitude)),1);
flag = mean(abs(foo));

%------------------------------------------------------------------------------
%	Let us plot the input waveform
%------------------------------------------------------------------------------


if (flag == 0)    % check whether the input is a digital signal

   ax = [min(time) max(time) -2*amplitude 2*amplitude];

   if(no_sample <= 2*SAMPLING_CONSTANT)	
     ax = [-2*Ts 2*binary_data_period -2*amplitude 2*amplitude];
     tax = [-2*Ts:Ts:2*binary_data_period];
     line = zeros(1,length(tax));
     idx=find( ~((tax>max(time)) | (tax<min(time))) );
     line(idx) = in;
     stair(tax,line);
     xlabel('Time [sec]'),  ...
     ylabel('V'),           ...
     grid on,               ...
     if( strcmp(axis('state'),'auto') ), axis( ax ), end
   else
     stair(time,in),        ...
     xlabel('Time [sec]'),  ...
     ylabel('V'),           ...
     grid on,               ...
     if( strcmp(axis('state'),'auto') ), axis( ax ), end
     %axis( ax )
   end


elseif (flag ~= 0)

   time = [0 time];
   ax = [min(time) max(time) -2*amplitude 2*amplitude];
   slope = in(2)- in(1);     % estimate the first point of the 
   first = in(1) - slope;    % input waveform
   if(((first < 0) & (in(1)>0)) | ((first>0) & (in(1)<0))) first = 0; end   
   in = [first;in]; 

   if(no_sample <= 2*SAMPLING_CONSTANT)
      ax = [-2*Ts 2*binary_data_period -2*amplitude 2*amplitude];
      tax = [-2*Ts:Ts:2*binary_data_period];
      line = zeros(1,length(tax));
      idx=find( ~((tax>max(time)) | (tax<min(time))) );
      line(idx) = in;
      plot(tax,line),        ...
      xlabel('Time [sec]'),  ...
      ylabel('V'),           ...
      grid on,               ...
     if( strcmp(axis('state'),'auto') ), axis( ax ), end
     %axis( ax )
   else
      plot(time,in),         ...
	  xlabel('Time [sec]'),  ...
      ylabel('V'),           ...
      grid on,               ...
     if( strcmp(axis('state'),'auto') ), axis( ax ), end
     %axis( ax )
   end

end
