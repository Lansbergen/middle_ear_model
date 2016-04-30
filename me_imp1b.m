function [Z1b]=imp1b(Pk,w)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Last changed : 25-5-2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% version      : 6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% --- description ---  
%%%
%%%     Zeq - impedance block 1b
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
Ld = Pk.Ld;

Ls = Pk.Ls;
Cs = Pk.Cs;
Rs = Pk.Rs;

Cr = Pk.Cr;
Rr = Pk.Rr;

% part 1
Xl1 = w.*Ls;
Xc1 = 1./(w.*Cs);

Xeq_1 = Xl1 - Xc1;  
Req_1 = Rs;

% part 2
Xl2 = 0;
Xc2 = 1./(w.*Cr);

Xeq_2 = Xl2 - Xc2;  
Req_2 = Rr;

% total equivalent impedance
Z1 = complex(Req_1,Xeq_1);
Z2 = complex(Req_2,Xeq_2);

Zeq = Z1.*Z2 ./ (Z1+Z2);

Req = real(Zeq);
Xeq = imag(Zeq);

% part 3
Xl3 = w.*Ld;
Xc3 = 0;

Xeq_3 = Xl3 - Xc3;

Rtot = Req;
Xtot = Xeq + Xeq_3;

% total equivalent impedance
Z1b = complex(Rtot,Xtot);

end