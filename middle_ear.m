function [kr]=middle_ear(Pk,w)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Last changed : 25-5-2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% version      : 6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% --- description ---  
%%% electrical lumped element network, mathematically modelled as is
%%% discribed by Kringlebotn (1988). The network is chopped into small    
%%% blocks of r-c-l networks (impedances) and linked together in this     
%%% function file. the parameter struct container gives input for the    
%%% different impedance blocks.    
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% --- modifications log ---
%%%
%%% * xx-x-xxxx; fully vectorized
%%% * 25-5-2015; renamed all final function and main file(s) after
%%% * 25-5-2015; after validation by with Alex 21-5-2015 (version 5)
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Kringlebotn middle ear network model, equivalent impedance function as
% input for the Vanhuyse model

% step 1
Z4=me_imp4(Pk,w);
Z5=me_imp5(Pk,w);

% total equivalent impedance step 1
Zeq_step1 = Z4.*Z5 ./ (Z4+Z5);

% step 2
Z3=me_imp3(Pk,w);

% total equivalent impedance step 2
Zeq_step2 = Z3 + Zeq_step1;

% step 3
Z2=me_imp2(Pk,w);

% total equivalent impedance step 3
Zeq_step3 = Z2.*Zeq_step2 ./ (Z2+Zeq_step2);

% step 4
Z1a=me_imp1a(Pk,w);
Z1b=me_imp1b(Pk,w);

% total equivalent impedance step 4
Zeq_step4 = Z1a + Z1b + Zeq_step3;

% total equivalent impedance network model
Zeq = Zeq_step4;
Req = real(Zeq_step4);
Xeq = imag(Zeq_step4);

% put results in struct file
kr.Zeq = Zeq;
kr.Req = Req;
kr.Xeq = Xeq;

end