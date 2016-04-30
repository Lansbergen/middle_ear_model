function [vh]=vanhuyse(Pk,kr,w)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Last changed : 25-5-2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% version      : 6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% --- description ---  
%%%     Vanhuyse ear-canal model, see paper Vanhuyse(1975)
%%%     
%%%     
%%%     
%%%     
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% --- modifications log ---
%%%
%%% * xx-x-xxxx; 
%%% * xx-x-xxxx; 
%%% * xx-x-xxxx; 
%%% * xx-x-xxxx; 
%%% * xx-x-xxxx; 
%%% * 19-5-2015; added extended header information.
%%% * 25-5-2015; renamed all final function and main file(s) after
%%% * 25-5-2015; after validation by with Alex 21-5-2015 (version 5)
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% local variables
vh.S = pi*(Pk.d/2)^2;   % cross sectional area ear-canal cm^2
k = w./Pk.c;
a = Pk.rho*Pk.c/vh.S;   % characteristic impedance ear-canal
b = tan(k.*Pk.l);
ab = a.*b;
x = kr.Xeq + ab;

% relations
Gv = ((1 + b.^2).*kr.Req) ./ (x.^2 + kr.Req.^2);
Bv = (b./a) - (((1 + b.^2).*x) ./ (x.^2 + kr.Req.^2));
Yv = complex(Gv,Bv);

Zv = a.*( (kr.Req + (kr.Xeq + a.*b).*1i) ./ (a - b.*kr.Xeq + (b.*kr.Req).*1i));
Rv=real(Zv);
Xv=imag(Zv);

% put results in struct file
vh.Zv = Zv;
vh.Rv = Rv;
vh.Xv = Xv;
vh.Yv = Yv;
vh.Bv = Bv;
vh.Gv = Gv;
vh.x  = x;

end