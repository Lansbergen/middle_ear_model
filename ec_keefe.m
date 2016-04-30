function [ke]=keefe(Pk,kr,vh,w)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Last changed : 28-5-2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% version      : 5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% --- description ---  
%%%     Keefe ear-canal model
%%%     Based on the ear-canal model described in an article by Keefe. 
%%%     The model of the ear-canal is actually based on the modelling of 
%%%     the vocal tract by Guelke and Bunn (1981).
%%%     Through a switch case the wall-effect can be simulated. 
%%%		The impedances of the different stages are parallel to each other.
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% --- modifications log ---
%%% * xx-x-xxxx; version 1 - 3; input kringlebotn version 5 and parameters 
%%% 			 version 2 struct files together with omega. The function 
%%%  			 returns a struct with the shunt, wall and middle-ear 
%%%  			 admittance.
%%% * xx-x-xxxx; admittance add-up changed
%%% * xx-x-xxxx; reversed every step in terms of impedance and
%%% * xx-x-xxxx; calculated Z_wall and Z_shunt || to yield Z and 
%%% * xx-x-xxxx; again calculated Z_ke as Z || to Z_wall
%%% * xx-x-xxxx; for no wall effect just Z_shut in || to Z
%%% * 19-5-2015; added extended header information.
%%% * 21-5-2015; added shunt-compliance relation from Keefe.
%%% * 21-5-2015; rewrote the addition of impedences by combining
%%%              the shunt-imp and the TM-imp. Wall-effect is 
%%%				 parallel to the combined impedance.
%%%  			 will not work with previous function of complete model
%%%			     only. Added fixed total R switch 
%%% * 25-5-2015; renamed all final function and main file(s) after
%%% * 25-5-2015; after validation by with Alex 21-5-2015 (version 4)
%%% * 28-5-2015; added header information 
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

Lv  = Pk.rho*Pk.Vec;                      % Inertance ear-canal
Cv = 1./(w.*( ((Pk.rho*Pk.c) ./ (pi*(Pk.d/2)^2)) .*(2./(w./Pk.c).*Pk.l))); % (article keefe), tappered
Lm = kr.Xeq./w;					   	      % inertance middle-ear
Cm = -1./ (w.*kr.Xeq);				   	  % compliance middle-ear

% wall admittance (step1/step2)
Bm = -kr.Xeq ./ (kr.Req.^2 + kr.Xeq.^2);  % susceptance middle-ear 
Cm_s = Bm ./ w;                           % compliance from susceptance middle-ear
Cw=Pk.fCC.*Cm_s;                		  % compliance of ear-canal wall
step1 = Cw.*w.*(1 - (w./Pk.Ww).^2).*1i + (Pk.Ww.*Cw)./Pk.Qw; % (step 1)
step2 = ((1 - (w./Pk.Ww).^2).^2) + (w./(Pk.Ww.*Pk.Qw)).^2;	 % (step 2)

% ear-canal model -> shunt impedance of the ear-canal 
Xcv = abs(-1./(w.*Cv));		     % Compliance ear-canal
Rv=0;                    		 % Resistance ear-canal, neglect setting it to 0
Xlv=Lv.*w;             		     % Inductance ear-canal
Xv=Xlv-Xcv;          			 % Reactance ear-canal

Zv=complex(Rv,Xv);				 % impedance ear-canal

% combined impedances ear-canal and middle-ear
totC = Cm + Cv;       		 	 % combined compliance ear-canal and middle-ear
totL = Lm + Lv;		     		 % combined inertance ear-canal and middle-ear
totXc = 1./(w.*totC);       
totXl = totL.*w;                  

% totX = ke.totXl - ke.totXc;	 % combined reactance
totX = -totXc;                   % combined reactance, neglect inertance component (See Keefe)
totR = kr.Req + Rv;			     % combined resistance	

% wall effect
Yw = step1./step2;               % wall admittance
Gw = real(Yw);	                 % wall conductance
Bw = imag(Yw);  	             % wall susceptance
Rw =  Gw ./ (Gw.^2 + Bw.^2);  	 % wall resistance
Xw = -Bw ./ (Gw.^2 + Bw.^2); 	 % wall reactance
Zw = complex(Rw,Xw);             % wall impedance

% total impedance ear-canal and middle-ear

switch Pk.onoff
    case 0      % with compliant wall effect
		Z = complex(totR,totX); 
        ke.Zk = Z.*Zw ./ (Z + Zw);  			     % Impedance wall-effect and impedance combined in parallel     
		ke.Xk = imag(ke.Zk)+Pk.addC; 				 % Reactance from total model       
		switch Pk.fixR_onoff
		case 0 % off
	    ke.Rk = real(ke.Zk);    					 % Resistance from total model                
        case 1 % on
        tijd = ones(1,length(w));
		ke.Rk = tijd.*Pk.fixR; % Resistance fixed parameter parameter
end
    case 1      % neglect compliant wall effect
        ke.Zk = complex(totR,totX);                  % Impedance combined imp
		ke.Xk = imag(ke.Zk)+Pk.addC;    			 % Reactance from total model      
		switch Pk.fixR_onoff
		case 0 % off
		ke.Rk = real(ke.Zk);		    			 % Resistance from total model
		case 1 % on
        tijd = ones(1,length(w));
		ke.Rk = tijd.*Pk.fixR; % Resistance fixed parameter parameter
		end
end

ke.Gk = ke.Rk ./ (ke.Xk.^2 + ke.Rk.^2);				 % conductance complete model
ke.Bk = -ke.Xk ./ (ke.Xk.^2 + ke.Rk.^2);			 % susceptance complete model	
ke.Yk = complex(ke.Gk,ke.Bk);						 % admittance complete model

end