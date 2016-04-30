function [kr,vh,ke,pr]=total_model(w,change)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Last changed : 25-5-2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% version      : 8
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% --- description ---  
%%%
%%%     Complete middle ear and ear canal model.
%%%     Calls the Kringlebotn model v5 than the Vanhuyse model v5 and the
%%%     Keefe model v4 and finally the pressure function v1 and collects 
%%%     variables.   
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% --- modifications log ---
%%%
%%% * xx-x-xxxx; fully vectorized
%%% * xx-x-xxxx; added Keefe middle ear model and pressure function
%%% * 14-5-2015; added extended header information.
%%% * 21-5-2015; changed Keefe ear-canal input
%%% * 25-5-2015; renamed all final function and main file(s) after
%%% * 25-5-2015; after validation by with Alex 21-5-2015 (version 7)
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% opens parameter struct file
Pk=parameters(change);

% middle-ear model Kringlebotn
% impedance/admittance at TM
[kr]=middle_ear(Pk,w);  

% ear-canal model article Vanhuyse
% impedance/admittance at probe Vanhuyse
[vh]=ec_vanhuyse(Pk,kr,w);

% ear-canal model article Keefe
% impedance/admittance at probe Keefe
[ke]=ec_keefe(Pk,kr,vh,w);

% add pressure relation to impedance/admittance at probe Keefe
[pr]=pressure(Pk,ke.Rk,ke.Xk);

end