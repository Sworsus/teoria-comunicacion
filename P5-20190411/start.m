echo off;

%
% START ...............	Initialization of global variables used by the
%			Communication System Toolbox routines.

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
%	o   Added "checking" by START_OK 11.30.1992 MZ
%	o	Tested (and modified) under MATLAB 4.0/4.1 08.16.1993 MZ
%===========================================================================

START_OK = 1;
global START_OK;

disp(' ');
disp('********************************************************************');
disp('*                                                                  *');
disp('*             Laboratorio de Señales y Comunicaciones              *');
disp('*                                                                  *');
disp('*                      Versión Modificada por                      *');
disp('*                     Javier Ramos,  Marzo 1998                    *');
disp('*                       Autores del Freeware:                                             *');
disp('*                     M. ZEYTINOGLU  and  B. MA                    *');
disp('*         Department of Electrical & Computer & Computer Engineering          *');
disp('*                  Ryerson Polytechnic University                  *');
disp('*                     Toronto, Ontario, CANADA                     *');
disp('*                                                                  *');
disp('********************************************************************');
disp(' ');
disp('Bienvenido al laboratorio. Antes de que empiece con las');
disp('simulaciones, se deben inicializar un numero de variables.');
disp('');
disp(' ');

table_index = 3;

disp(' ');
disp(' ');

if( isempty(table_index) )
   error('Experiment number must be between 1 and 8.');
elseif( (table_index <= 0) | (table_index > 8) )
   error('Experiment number must be between 1 and 8.');
end

table = [ 10 100 10 10 8 100 40 8 ];

SAMPLING_CONSTANT  = table(table_index);
BINARY_DATA_RATE   = 1000;
SAMPLING_FREQ      = BINARY_DATA_RATE * SAMPLING_CONSTANT;

CARRIER_FREQUENCY  = [ 1000000 4000000 ];

NYQUIST_BLOCK   = 8;		% Number of blocks for Nyquist pulse generation
NYQUIST_ALPHA   = 0.5;		% Default value of "Excessive BW factor"
DUOBINARY_BLOCK = 8;		% Number of blocks for Duobinary pulse.

global START_OK;
global SAMPLING_CONSTANT;
global SAMPLING_FREQ;
global BINARY_DATA_RATE;
global CARRIER_FREQUENCY;
global NYQUIST_BLOCK;
global NYQUIST_ALPHA;
global DUOBINARY_BLOCK;

fprintf('====================================================================');
fprintf('\n\n');
fprintf('   In this MATLAB session default sampling frequency is set at \n\n');
fprintf('\t\t %6.2f [kHz].\n\n',SAMPLING_FREQ/1000);
fprintf('   Highest frequency component that can be processed by all \n');
fprintf('   MATLAB routines is less than or equal to: \n\n');
fprintf('\t\t %6.2f [kHz].\n',SAMPLING_FREQ/2000); 
fprintf('\n');
fprintf('====================================================================');
fprintf('\n\n');
disp('These values will remain in effect until the "SAMPLING_FREQ" or the');
disp('"BINARY_DATA_RATE" variables are changed.  If you specify Rb as the');
disp('new binary data rate, then the sampling frquency will be set to:');
fprintf('\n\t\t(%4.0f)Rb [Hz].\n',SAMPLING_CONSTANT);
fprintf('\n');

%
% The next two variables are for error messages only
%

BELL    = 'fprintf(''\007\007\007'')';
WARNING = 'fprintf(''\n\t * NOT SUFFICIENT INPUT ARGUMENTS \t * USAGE:\n'')';

global BELL;
global WARNING;

clear table table_index;
