%-------------------------------------------------------------------------%
% Initialisation
clear all       % Clear all variables in workspace
close all       % Close all current windows with figures (plots)
clc             % Clear Command window
echo off        % No echoing of commands lines in script/function files 
%-------------------------------------------------------------------------%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Last changed : 28-5-2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% version      : 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% --- description ---  
%%%
%%%     main script with profile selection.
%%%     gives age dependend parameters to parameter struct
%%%     and gets back all model parameters as an input to
%%%     the graph function-file.
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% --- modifications log ---
%%%
%%% * 14-5-2015; added extended header information.
%%% * 18-5-2015; added profile selection, adult, 1 m.o., 6 m.o.
%%% * 19-5-2015; added more profiles to selection and fitted parameters
%%% * 19-5-2015; finished parameter fitting for all profiles 1st attempt
%%%   (before Alex 21-5-2015).
%%% * 20-5-2015; added linewidth variable to change-parameter set
%%% * 21-5-2015;
%%%
%%%
%%% * 23-5-2015; changed graph-input
%%% * 23-5-2015; added custom selction input
%%% * 24-5-2015; pass step and range parameters to graph function
%%% * 25-5-2015; renamed all final function and main file(s) after
%%% * 25-5-2015; after validation by with Alex 21-5-2015 (version 3)
%%% * 26-5-2015; added marker type/size as an input to the graph-function
%%% * 28-5-2015; added Otitis Media pathology option to the model
%%% * 1-6-2015;  finalized parameter settings regarding age profiles
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables general
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
freq.fs1=1;                             % Start frequency
freq.fs2=1;                             % Step       
freq.fs3=2500;                            % End frequency
freq.freq=freq.fs1:freq.fs2:freq.fs3;   % range and step Omega
w=2.*pi.*freq.freq;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% normal/pathology selection
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Simulate otitis media?'); 
disp('no = 0,   yes = 1,'); 
change.pat=input('fixed at 0.01 = 2, :'); 
switch change.pat
    case 0
change.pat_fact=1;
    case 1
change.pat_fact=input('Change middle-ear cavity compliance by factor :');
    case 2
change.pat_fact=0.01;        
    otherwise
change.pat_fact=1;
end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Profile selection
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp(' Adult =0,  1 M.O.=1,'); 
disp(' 3 M.O.=2,  6 M.O.=3,');
disp('12 M.O.=4, 24 M.O.=5,');
disp('   All =x, Custom =7.');
sw=input(':');
% sw=1;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables Adult
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
switch sw
    case 0
change.ec_l = 2.5;     % length ear-canal cm
change.ec_d = 1.4;     % diameter ear-canal cm
change.mec_v = 12;     % middle-ear cavity volume cc/ml/cm^3
change.mec_L = 0;      % middle-ear cavity L-value (Henry), when coupled -> n/a
change.mec_Lsw = 1;    % middle-ear cavity L-value coupled to volume on/off, 1=on
change.mec_R = 60;     % middle-ear cavity resistance
change.onoff = 1;      % neglect wall admittance 1 = yes
change.fw = 0;         % resonant frequency wall canal model
change.Qw = 0;         % Q-factor wall canal model
change.fCC = 0;        % ratio Cw/Cm wall canal model
change.addC = 100;     % add acoustic ohm to reactance
change.fixR_onoff = 1; % 0=off,1=on
change.fixR = 100;     % fixed R-value

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables 1 M.O.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 1
change.ec_l = 0.9;     % length ear-canal cm
change.ec_d = 0.44;    % diameter ear-canal cm
change.mec_v = 2;      % middle-ear cavity volume cc/ml/cm^3
change.mec_L = 0;      % middle-ear cavity L-value (Henry)
change.mec_Lsw = 1;    % middle-ear cavity L-value coupled to volume on/off, 1=on
change.mec_R = 160;    % middle-ear cavity resistance
change.onoff = 0;      % neglect wall admittance 1 = yes
change.fw = 350;       % resonant frequency wall canal model
change.Qw = 2.5;       % Q-factor wall canal model
change.fCC = 2.25;     % ratio Cw/Cm wall canal model
change.addC = 150;     % add acoustic ohm to reactance
change.fixR_onoff = 1; % 0=off,1=on
change.fixR = 125;     % fixed R-value

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables 3 M.O. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 2
change.ec_l = 1.15;    % length ear-canal
change.ec_d = 0.54;    % diameter ear-canal
change.mec_v = 4;      % middle-ear cavity volume cc/ml/cm^3
change.mec_L = 0;      % middle-ear cavity L-value (Henry)
change.mec_Lsw = 1;    % middle-ear cavity L-value coupled to volume on/off, 1=on
change.mec_R = 140;    % middle-ear cavity resistance
change.onoff = 0;      % neglect wall admittance 1 = yes
change.fw = 450;       % resonant frequency wall canal model
change.Qw = 2;         % Q-factor wall canal model
change.fCC = 1.25;     % ratio Cw/Cm wall canal model
change.addC = 125;     % add acoustic ohm to reactance
change.fixR_onoff = 1; % 0=off,1=on
change.fixR = 120;     % fixed R-value

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables 6 M.O. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 3
change.ec_l = 1.25;    % length ear-canal cm
change.ec_d = 0.63;    % diameter ear-canal cm
change.mec_v = 6;      % middle-ear cavity volume cc/ml/cm^3
change.mec_L = 0;      % middle-ear cavity L-value (Henry)
change.mec_Lsw = 1;    % middle-ear cavity L-value coupled to volume on/off, 1=on
change.mec_R = 120;    % middle-ear cavity resistance
change.onoff = 0;      % neglect wall admittance 1 = yes
change.fw = 600;       % resonant frequency wall canal model
change.Qw = 2;         % Q-factor wall canal model
change.fCC = 0.5;      % ratio Cw/Cm wall canal model
change.addC = 125;     % add acoustic ohm to reactance
change.fixR_onoff = 1; % 0=off,1=on
change.fixR = 120;     % fixed R-value


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables 12 M.O. - done 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 4
change.ec_l = 1.3;     % length ear-canal cm
change.ec_d = 0.7;     % diameter ear-canal cm
change.mec_v = 8;      % middle-ear cavity volume cc/ml/cm^3
change.mec_L = 0;      % middle-ear cavity L-value (Henry)
change.mec_Lsw = 1;    % middle-ear cavity L-value coupled to volume on/off, 1=on
change.mec_R = 80;     % middle-ear cavity resistance
change.onoff = 1;      % neglect wall admittance 1 = yes
change.fw = 0;         % resonant frequency wall canal model
change.Qw = 0;         % Q-factor wall canal model
change.fCC = 0;        % ratio Cw/Cm wall canal model
change.addC = 105;     % add acoustic ohm to reactance
change.fixR_onoff = 1; % 0=off,1=on
change.fixR = 115;     % fixed R-value

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables 24 M.O. - done 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 5
change.ec_l = 1.4;     % length ear-canal cm
change.ec_d = 0.77;    % diameter ear-canal cm
change.mec_v = 10;     % middle-ear cavity volume cc/ml/cm^3
change.mec_L = 0;      % middle-ear cavity L-value (Henry)
change.mec_Lsw = 1;    % middle-ear cavity L-value coupled to volume on/off, 1=on
change.mec_R = 60;     % middle-ear cavity resistance
change.onoff = 1;      % neglect wall admittance 1 = yes
change.fw = 0;         % resonant frequency wall canal model
change.Qw = 0;         % Q-factor wall canal model
change.fCC = 0;        % ratio Cw/Cm wall canal model
change.addC = 100;     % add acoustic ohm to reactance
change.fixR_onoff = 1; % 0=off,1=on
change.fixR = 110;     % fixed R-value

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables - Custom
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 7
disp('');
disp('*** Custom input ***');
% disp('length ear-canal in cm');
% change.ec_l=input(':');
change.ec_l = 0.9;     % length ear-canal cm
% disp('diameter ear-canal in cm');
% change.ec_d=input(':');
change.ec_d = 0.44;    % diameter ear-canal cm
disp('middle-ear cavity volume cc/ml/cm^3 in');
change.mec_v=input(':');
% change.mec_v = 2;     % middle-ear cavity volume cc/ml/cm^3
change.mec_L = 0;      % middle-ear cavity L-value (Henry)
change.mec_Lsw = 1;    % middle-ear cavity L-value coupled to volume on/off, 1=on
change.mec_R = 160;    % middle-ear cavity resistance
change.onoff = 0;      % neglect wall admittance 1 = yes
disp('resonant frequency wall canal model in Hz');
change.fw=input(':');
% change.fw = 0;         % resonant frequency wall canal model
disp('Q-factor wall canal model');
change.Qw=input(':');
% change.Qw = 0;         % Q-factor wall canal model
disp('ratio Cw/Cm wall canal model');
change.fCC=input(':');
% change.fCC = 0;        % ratio Cw/Cm wall canal model
change.addC = 100;     % add acoustic ohm to reactance
change.fixR_onoff = 1; % 0=off,1=on
change.fixR = 125;     % fixed R-value

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Otherwise - Adult - done 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    otherwise
disp('invalid input. Start adult simulation');
change.ec_l = 2.5;     % length ear-canal cm
change.ec_d = 1.4;     % diameter ear-canal cm
change.mec_v = 12;     % middle-ear cavity volume cc/ml/cm^3
change.mec_L = 0;      % middle-ear cavity L-value (Henry), when coupled -> n/a
change.mec_Lsw = 1;    % middle-ear cavity L-value coupled to volume on/off, 1=on
change.mec_R = 60;     % middle-ear cavity resistance
change.onoff = 1;      % neglect wall admittance 1 = yes
change.fw = 0;         % resonant frequency wall canal model
change.Qw = 0;         % Q-factor wall canal model
change.fCC = 0;        % ratio Cw/Cm wall canal model
change.addC = 100;     % add acoustic ohm to reactance
change.fixR_onoff = 1; % 0=off,1=on
change.fixR = 100;     % fixed R-value

%%
end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Middle-ear, Vanhuyse ear-canal and Keefe ear-canal model
%%% and Pressure function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tic

[kr,vh,ke,pr]=total_model(w,change);


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% graphs function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

change.linw = 3;       % line width graphs in function file
change.marker1 = ':';  % marker type/size first line
change.marker2 = '-';  % marker type/size second line

graphs(kr,vh,ke,pr,freq,change)

time = toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&
%%% End
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

