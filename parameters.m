function [Pk]=parameters(change)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Last changed : 28-5-2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% version      : 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% --- description ---  
%%%     Parameter container function
%%%     Kringlebotn, Vanhuyse and Keefe model parameters struct together
%%%     with maturational process parameters and pressure function.
%%%     Input change gives age-profile parameters.
%%%     
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% --- modifications log ---
%%%
%%% * xx-x-xxxx; - version 1; add the Pk struct containing all parameters 
%%% * xx-x-xxxx; copied from the impedance function files v3.
%%% * xx-x-xxxx; - version 2; same as V1 with addition of the Keefe model 
%%% * xx-x-xxxx; parameters.
%%% * xx-x-xxxx; - version 3; based on v1 and v2 with an input side to 
%%% * xx-x-xxxx; change parameters from the main script. The capacitance  
%%% * xx-x-xxxx; of the middle-ear cavities are changed from fixed to a  
%%% * xx-x-xxxx; variable volume parameter.
%%% * 19-5-2015; - started log from this point on.
%%% * xx-x-xxxx; added change-input parameter.
%%% * 19-5-2015; added full description.
%%% * 19-5-2015; added extended header information.
%%% * 25-5-2015; renamed all final function and main file(s) after
%%% * 25-5-2015; after validation by with Alex 21-5-2015 (version 3)
%%% * 28-5-2015; added factor Otitis Media (pathology) to the total
%%% * 28-5-2015; middle-ear cavity compliance
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% General
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Pk.rho = 1.2040e-3;      % g/cm^3 @  0daPa   @ 25 degC / density air
Pk.c = 35188;            % cm/sec @ 25 degC / speed of sound

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Ear canal dimensions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Pk.l = change.ec_l;            % l -> length ear canal in cm
Pk.d = change.ec_d;            % d -> ear canal cross sectional diameter in cm
Pk.Vec = (pi*(Pk.d)^2*Pk.l)/8;   % volume of tappered ear-canal

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Kringlebotn
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% parameters block Z1a
%fixed La value or coupled to cavity volume
switch change.mec_Lsw % switch parameter for La
    case 0
        Pk.La = change.mec_L;        % fixed value
    case 1
        Pk.La = Pk.rho*change.mec_v; % coupled to volume      
end
Ctot  = (change.mec_v/(Pk.rho.*(Pk.c)^2)).* change.pat_fact;  % total compliance of the ear-canal cavities
Pk.Ca = 0.925*Ctot;   % compliance / factor .925 for Ca
Pk.Ct = 0.075*Ctot;   % compliance / factor .075 for Ct
Pk.Ra = change.mec_R; % resistance

% parameters block Z1b 
Pk.Ld = 7.5e-3;     % inertance
Pk.Ls = 66e-3;      % resistance
Pk.Cs = 0.3e-6;     % compliance
Pk.Rs = 20;         % resistance
Pk.Cr = 1.3e-6;     % compliance
Pk.Rr = 120;        % resistance

% parameters block Z2
Pk.Cm = 0.38e-6;    % compliance
Pk.Rm = 120;        % resistance

% parameters block Z3
Pk.Lo = 22e-3;      % inertance
Pk.Co = inf;        % compliance
Pk.Ro = 20;         % resistance

% parameters block Z4
Pk.Ci = 0.3e-6;     % compliance
Pk.Ri = 6000;       % resistance

% parameters block Z5
Pk.Lc = 46e-3;      % inertance
Pk.Cc = 0.56e-6;    % compliance
Pk.Rc = 330;        % resistance

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Keefe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Pk.fw = change.fw;       % resonant frequency
Pk.Ww = 2*pi*Pk.fw;      % resonant omega
Pk.Qw = change.Qw;       % Q-factor
Pk.fCC = change.fCC;     % factor Cw/Cm
Pk.onoff = change.onoff; % neglect wall admittance 1 = yes
Pk.addC = change.addC;
Pk.fixR_onoff = change.fixR_onoff;
Pk.fixR = change.fixR;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Pressure function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Pk.p  = -300:300;      % pressure span -300daPa to 300daPa, step = 1
Pk.wp = 2.5;           % width reactance parabol

end