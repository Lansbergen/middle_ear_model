%-------------------------------------------------------------------------%
% Initialisation
clear all       % Clear all variables in workspace
close all       % Close all current windows with figures (plots)
clc             % Clear Command window
echo off        % No echoing of commands lines in script/function files 
%-------------------------------------------------------------------------%
tic
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Last changed : 28-5-2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% version      : 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% --- description ---  
%%%
%%%     main script with profile selection in loop structure.
%%%     gives age dependend parameters to parameter struct
%%%     and gets back all model parameters as an input to
%%%     the graph function-file.
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% --- modifications log ---
%%%
%%% * 21-5-2015; file created, based on main script without loop function
%%% * 23-5-2015; added loop wall-effect close-up
%%% * 26-5-2015; added marker type/size as an input to the graph-function
%%% * 26-5-2015; added ear-canal: length, diameter and volume and  
%%% * 26-5-2015; middle-ear cavities, optimized loops on other parameters
%%% * 28-5-2015; added Otitis Media pathology option to the model
%%% * 1-6-2015;  finalized parameter settings regarding age profiles
%%% * 9-6-2015;  changed values in loops to get correct span in parameter
%%%              variation.
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables general
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
change.linw = 3;    % line width graphs in function file
change.marker1 = '-'; % marker type/size first line
change.marker2 = '--'; % marker type/size second line

freq.fs1=1;                             % Start frequency
freq.fs2=1;                             % Step       
freq.fs3=2500;                          % End frequency
freq.freq=freq.fs1:freq.fs2:freq.fs3;   % range and step Omega
w=2.*pi.*freq.freq;

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% *** switch; age-profiles ***
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 0:5
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables Adult
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
switch i
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

change.pat_fact=1;     % fixed OME-effect factor
[~,~,ke,pr]=total_model(w,change); % healthy ear
var.age.ke0 = ke;
var.age.x0 = ke.Xk;
var.age.r0 = ke.Rk;
var.age.pr0 = pr;

change.pat_fact=0.1;  % fixed OME-effect factor
[~,~,ke,pr]=total_model(w,change); % OME ear
var.age.ke0_ome = ke;
var.age.x0_ome = ke.Xk;
var.age.r0_ome = ke.Rk;
var.age.pr0_ome = pr;
change.pat_fact=1;     % fixed OME-effect factor for next loop
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
change.Qw = 2.5;        % Q-factor wall canal model
change.fCC = 2.25;     % ratio Cw/Cm wall canal model
change.addC = 150;     % add acoustic ohm to reactance
change.fixR_onoff = 1; % 0=off,1=on
change.fixR = 125;     % fixed R-value

[~,~,ke,pr]=total_model(w,change); % healthy ear
var.age.ke1 = ke;
var.age.x1 = ke.Xk;
var.age.r1 = ke.Rk;
var.age.pr1 = pr;

change.pat_fact=0.1;  % fixed OME-effect factor
[~,~,ke,pr]=total_model(w,change); % OME ear
var.age.ke1_ome = ke;
var.age.x1_ome = ke.Xk;
var.age.r1_ome = ke.Rk;
var.age.pr1_ome = pr;
change.pat_fact=1;     % fixed OME-effect factor for next loop
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

[~,~,ke,pr]=total_model(w,change); % healthy ear
var.age.ke2 = ke;
var.age.x2 = ke.Xk;
var.age.r2 = ke.Rk;
var.age.pr2 = pr;

change.pat_fact=0.1;  % fixed OME-effect factor
[~,~,ke,pr]=total_model(w,change); % OME ear
var.age.ke2_ome = ke;
var.age.x2_ome = ke.Xk;
var.age.r2_ome = ke.Rk;
var.age.pr2_ome = pr;
change.pat_fact=1;     % fixed OME-effect factor for next loop
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

[~,~,ke,pr]=total_model(w,change); % healthy ear
var.age.x3 = ke.Xk;
var.age.pr3 = pr;

change.pat_fact=0.1;  % fixed OME-effect factor
[~,~,ke,pr]=total_model(w,change); % OME ear
var.age.x3_ome = ke.Xk;
var.age.pr3_ome = pr;
change.pat_fact=1;     % fixed OME-effect factor for next loop
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables 12 M.O.
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

[~,~,ke,pr]=total_model(w,change); % healthy ear
var.age.x4 = ke.Xk;
var.age.pr4 = pr;

change.pat_fact=0.1;  % fixed OME-effect factor
[~,~,ke,pr]=total_model(w,change); % OME ear
var.age.pr4_ome = pr;
var.age.x4_ome = ke.Xk;
change.pat_fact=1;     % fixed OME-effect factor for next loop
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables 24 M.O.
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

[~,~,ke,pr]=total_model(w,change); % healthy ear
var.age.x5 = ke.Xk;
var.age.pr5 = pr;

change.pat_fact=0.1;  % fixed OME-effect factor
[~,~,ke,pr]=total_model(w,change); % OME ear
var.age.x5_ome = ke.Xk;
var.age.pr5_ome = pr;
change.pat_fact=1;     % fixed OME-effect factor for next loop
%%
end
end
%%
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% *** loop; wall-effect close-up ***
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables 1 M.O. - wall effect loop - ratio Cw/Cm wall canal model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
change.ec_l = 0.9;     % length ear-canal cm
change.ec_d = 0.44;    % diameter ear-canal cm
change.mec_v = 2;      % middle-ear cavity volume cc/ml/cm^3
change.mec_L = 0;      % middle-ear cavity L-value (Henry)
change.mec_Lsw = 1;    % middle-ear cavity L-value coupled to volume on/off, 1=on
change.mec_R = 160;    % middle-ear cavity resistance
change.onoff = 0;      % neglect wall admittance 1 = yes
change.fw = 350;       % resonant frequency wall canal model
change.Qw = 2.5;       % Q-factor wall canal model
change.addC = 150;     % add acoustic ohm to reactance
change.fixR_onoff = 1; % 0=off,1=on
change.fixR = 125;     % fixed R-value

var.X_ratcm_ec_1m=zeros(6,length(w));

for i=0:5
add = i/2;
change.fCC = 1 + add;        % ratio Cw/Cm wall canal model
[~,~,ke,~]=total_model(w,change);
var.X_ratcm_ec_1m(i+1,:)=ke.Xk;
end

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables 1 M.O. - wall effect loop - resonant frequency wall canal model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
change.ec_l = 0.9;     % length ear-canal cm
change.ec_d = 0.44;    % diameter ear-canal cm
change.mec_v = 2;      % middle-ear cavity volume cc/ml/cm^3
change.mec_L = 0;      % middle-ear cavity L-value (Henry)
change.mec_Lsw = 1;    % middle-ear cavity L-value coupled to volume on/off, 1=on
change.mec_R = 160;    % middle-ear cavity resistance
change.onoff = 0;      % neglect wall admittance 1 = yes
change.Qw = 2.5;       % Q-factor wall canal model
change.fCC = 2.25;     % ratio Cw/Cm wall canal model
change.addC = 150;     % add acoustic ohm to reactance
change.fixR_onoff = 1; % 0=off,1=on
change.fixR = 125;     % fixed R-value

var.X_resf_ec_1m=zeros(6,length(w));

for i=0:5
add = i*100;
change.fw = 300 + add;       % resonant frequency wall canal model
[~,~,ke,~]=total_model(w,change);
var.X_resf_ec_1m(i+1,:)=ke.Xk;
end

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables 1 M.O. - wall effect loop - Q-factor wall canal model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
change.ec_l = 0.9;     % length ear-canal cm
change.ec_d = 0.44;    % diameter ear-canal cm
change.mec_v = 2;      % middle-ear cavity volume cc/ml/cm^3
change.mec_L = 0;      % middle-ear cavity L-value (Henry)
change.mec_Lsw = 1;    % middle-ear cavity L-value coupled to volume on/off, 1=on
change.mec_R = 160;    % middle-ear cavity resistance
change.onoff = 0;      % neglect wall admittance 1 = yes
change.fw = 350;       % resonant frequency wall canal model
change.fCC = 2.25;     % ratio Cw/Cm wall canal model
change.addC = 150;     % add acoustic ohm to reactance
change.fixR_onoff = 1; % 0=off,1=on
change.fixR = 125;     % fixed R-value

var.X_qfact_ec_1m=zeros(6,length(w));

for i=0:5
add = i/2;
change.Qw = 1.5 + add;       % Q-factor wall canal model
[~,~,ke,~]=total_model(w,change);
var.X_qfact_ec_1m(i+1,:)=ke.Xk;
end

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% *** loop; adult variations close-up ***
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables - ear-canal length - adult values
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

var.X_length_ec=zeros(9,length(w));

for i=0:2:16
add = i/10;
change.ec_l = 0.9 + add;     % length ear-canal cm
[~,~,ke,~]=total_model(w,change);
var.X_length_ec(((i/2)+1),:)=ke.Xk;
end


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables - ear-canal diameter - adult values
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
change.ec_l = 2.5;     % length ear-canal cm
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

var.X_diam_ec=zeros(6,length(w));

for i=0:2:10
add = i/10;
change.ec_d = 0.4 + add;     % diameter ear-canal cm
[~,~,ke,~]=total_model(w,change);
var.X_diam_ec(((i/2)+1),:)=ke.Xk;
end


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables - total volume ear-canal, lin increase - maturational effect
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

var.X_vol_ec=zeros(6,length(w));

for i=0:2:10
add = i/10;
change.ec_l = 0.9 + add;     % length ear-canal cm
change.ec_d = 0.4 + add;     % diameter ear-canal cm
[~,~,ke,~]=total_model(w,change);
var.X_vol_ec(((i/2)+1),:)=ke.Xk;
end



%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables - cavity compliance differences middle-ear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
change.ec_l = 2.5;     % length ear-canal cm
change.ec_d = 1.4;     % diameter ear-canal cm
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

var.X_cav_me=zeros(7,length(w));

for i=0:2:12
change.mec_v = 2 + i;     % middle-ear cavity volume cc/ml/cm^3
[~,~,ke,~]=total_model(w,change);
var.X_cav_me(((i/2)+1),:)=ke.Xk;
end


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% *** loop; 1 M.O. variations close-up ***
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables 1 M.O. - ear-canal length
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
change.fixR_onoff = 1; % 0=off,1=on0
change.fixR = 125;     % fixed R-value

var.X_length_ec_6m=zeros(8,length(w));

for i=0:1:7
add = i/10;
change.ec_l = 0.6 + add;     % length ear-canal cm
[~,~,ke,~]=total_model(w,change);
var.X_length_ec_6m(((i)+1),:)=ke.Xk;
end


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables 1 M.O. - ear-canal diameter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
change.ec_l = 0.9;     % length ear-canal cm
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

var.X_diam_ec_6m=zeros(6,length(w));

for i=0:1:5
add = i/10;
change.ec_d = 0.2 + add;     % diameter ear-canal cm
[~,~,ke,~]=total_model(w,change);
var.X_diam_ec_6m((i+1),:)=ke.Xk;
end

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables 1 M.O. - total volume ear-canal, lin increase - maturational effect
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

var.X_vol_ec_6m=zeros(6,length(w));

for i=0:1:5
add = i/10;
change.ec_l = 0.7 + add;     % length ear-canal cm
change.ec_d = 0.2 + add;     % diameter ear-canal cm
[~,~,ke,~]=total_model(w,change);
var.X_vol_ec_6m((i+1),:)=ke.Xk;
end

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables 1 M.O. - cavity differences middle-ear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
change.ec_l = 0.9;     % length ear-canal cm
change.ec_d = 0.44;    % diameter ear-canal cm
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

var.X_cav_me_6m=zeros(7,length(w));

for i=0:1:6
add = i / 4;
change.mec_v = 1.5 + add;     % middle-ear cavity volume cc/ml/cm^3
[~,~,ke,~]=total_model(w,change);
var.X_cav_me_6m((i+1),:)=ke.Xk;
end

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% graphs function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

graphs_loop(var,freq,change)


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&
%%% End
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

totaltime = toc;
