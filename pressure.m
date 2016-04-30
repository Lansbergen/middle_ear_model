function [pr]=pressure(Pk,R_input,X_input)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Last changed : 25-5-2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% version      : 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% --- description ---  
%%% this function adds pressure to known reactance and resistance values
%%% at zero pressure variation. the function adds pressure variation
%%% according to the Vanhuyse theoretical and mathematical framework. the
%%% relations for both reactance and resistance to pressure variation where
%%% found by trail and error method. 
%%%     
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% --- modifications log ---
%%%
%%% * xx-x-xxxx; vectorized input version 3, no for-end loops
%%% * 25-5-2015; added extended header information.
%%% * 25-5-2015; renamed all final function and main file(s) after
%%% * 25-5-2015; after validation by with Alex 21-5-2015 (version 3)
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% vectorized pressure function Resistance
a=R_input';
b=ones(1,length(Pk.p));  
c=a*b;
d=300*exp(-(Pk.p-100)./600) - 354.4;
e=ones(length(R_input),1);
f=e*d;
g=f+c;
pr.Rp = g;

% vectorized pressure function Reactance
a1=X_input';
b1=ones(1,length(Pk.p));  
c1=a1*b1;
d1=-(((Pk.p)./Pk.wp).^2);
e1=ones(length(X_input),1);
f1=e1*d1;
g1=f1+c1;
pr.Xp = g1;

pr.Z=complex(pr.Rp,pr.Xp);
pr.Y=1./pr.Z;
pr.Yabs=abs(pr.Y);
pr.G=real(pr.Y);
pr.B=imag(pr.Y);

end