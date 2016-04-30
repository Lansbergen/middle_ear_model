function [Z1a]=imp1a(Pk,w)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Last changed : 25-5-2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% version      : 6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% --- description ---  
%%%
%%%     Zeq - impedance block 1a
%%%     
%%%     
%%%     
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% --- modifications log ---
%%%
%%% * 25-5-2015; added extended header information.
%%% * 25-5-2015; renamed all final function and main file(s) after
%%% * 25-5-2015; after validation by with Alex 21-5-2015 (version 5)
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% parameter values
La = Pk.La;
Ca = Pk.Ca;
Ra = Pk.Ra;
Ct = Pk.Ct;

% part 1
Xl1 = w.*La;
Xc1 = 1./(w.*Ca);

Xeq_1 = Xl1 - Xc1;  
Req_1 = Ra;

% part 2
Xl2 = 0;
Xc2 = 1./(w.*Ct);

Xeq_2 = Xl2 - Xc2;  
Req_2 = 0;

% total equivalent impedance
Z1 = complex(Req_1,Xeq_1);
Z2 = complex(Req_2,Xeq_2);

Z1a = Z1.*Z2 ./ (Z1+Z2);

end