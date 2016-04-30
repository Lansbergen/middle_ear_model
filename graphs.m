function graphs(kr,vh,ke,pr,freq,change)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Last changed : 26-5-2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% version      : 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% --- description ---  
%%%     Function file for graphs
%%%     Input Kringlebotn, Vanhuyse, Keefe and pressure struct-files
%%%     together with the change-profile parameter set.
%%%     
%%%     
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% --- modifications log ---
%%% * 19-5-2015; started log from this point on.
%%% * 19-5-2015; added phase angle graphs (figure 6) 
%%%              and normalized reactance graph (figure 5).
%%% * 19-5-2015; added extended header information.
%%% * 23-5-2015; -removed phase angle and normalized reactance graph
%%% * 24-5-2015; added step and range parameters to function            
%%% * 25-5-2015; renamed all final function and main file(s) after
%%% * 25-5-2015; after validation by with Alex 21-5-2015 (version 2)
%%% * 26-5-2015; added marker type/size to G/B graph and to R/X-graph.
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%%
Pk=parameters(change);   % Load model parameters for graphs

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% G,B and |Y| tympanograms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

range_prG    = round(max(max(pr.G))*10000)/10000;
range_maxprB = round(max(max(pr.B))*10000)/10000;
range_minprB = round(min(min(pr.B))*10000)/10000;
range_prY    = round(max(max(pr.Yabs))*10000)/10000;

figure(1)
subplot(6,4,1);
plot(Pk.p,pr.B(round(226/freq.fs2),:),'LineWidth',change.linw);
title('B @ 226Hz');
axis([-300,300,range_minprB,range_maxprB]);
grid on;
subplot(6,4,2);
plot(Pk.p,pr.G(round(226/freq.fs2),:),'LineWidth',change.linw);
title('G @ 226Hz');
axis([-300,300,0,range_prG]);
grid on;
subplot(6,4,3);
plot(Pk.p,pr.Yabs(round(226/freq.fs2),:),'LineWidth',change.linw);
title('|Y| @ 226Hz');
axis([-300,300,0,range_prY]);
grid on
subplot(6,4,4);
plot(Pk.p,pr.Rp(round(226/freq.fs2),:),Pk.p,pr.Xp(round(226/freq.fs2),:),Pk.p,-pr.Rp(round(226/freq.fs2),:),'--','LineWidth',change.linw);
axis([-300,300,-1500,750]);
title('R(p) and X(p) @ 226Hz');
grid on;

subplot(6,4,5);
plot(Pk.p,pr.B(round(400/freq.fs2),:),'LineWidth',change.linw);
title('B @ 400Hz');
axis([-300,300,range_minprB,range_maxprB]);
grid on;
subplot(6,4,6);
plot(Pk.p,pr.G(round(400/freq.fs2),:),'LineWidth',change.linw);
title('G @ 400Hz');
axis([-300,300,0,range_prG]);
grid on;
subplot(6,4,7);
plot(Pk.p,pr.Yabs(round(400/freq.fs2),:),'LineWidth',change.linw);
title('|Y| @ 400Hz');
axis([-300,300,0,range_prY]);
grid on
subplot(6,4,8);
plot(Pk.p,pr.Rp(round(400/freq.fs2),:),Pk.p,pr.Xp(round(400/freq.fs2),:),Pk.p,-pr.Rp(round(400/freq.fs2),:),'--','LineWidth',change.linw);
axis([-300,300,-1500,750]);
title('R(p) and X(p) @ 400Hz');
grid on;

subplot(6,4,9);
plot(Pk.p,pr.B(round(660/freq.fs2),:),'LineWidth',change.linw);
title('B @ 660Hz');
axis([-300,300,range_minprB,range_maxprB]);
grid on;
subplot(6,4,10);
plot(Pk.p,pr.G(round(660/freq.fs2),:),'LineWidth',change.linw);
title('G @ 660Hz');
axis([-300,300,0,range_prG]);
grid on;
subplot(6,4,11);
plot(Pk.p,pr.Yabs(round(660/freq.fs2),:),'LineWidth',change.linw);
title('|Y| @ 660Hz');
axis([-300,300,0,range_prY]);
grid on
subplot(6,4,12);
plot(Pk.p,pr.Rp(round(660/freq.fs2),:),Pk.p,pr.Xp(round(660/freq.fs2),:),Pk.p,-pr.Rp(round(660/freq.fs2),:),'--','LineWidth',change.linw);
axis([-300,300,-1500,750]);
title('R(p) and X(p) @ 660Hz');
grid on;

subplot(6,4,13);
plot(Pk.p,pr.B(round(800/freq.fs2),:),'LineWidth',change.linw);
title('B @ 800Hz');
axis([-300,300,range_minprB,range_maxprB]);
grid on;
subplot(6,4,14);
plot(Pk.p,pr.G(round(800/freq.fs2),:),'LineWidth',change.linw);
title('G @ 800Hz');
axis([-300,300,0,range_prG]);
grid on;
subplot(6,4,15);
plot(Pk.p,pr.Yabs(round(800/freq.fs2),:),'LineWidth',change.linw);
title('|Y| @ 800Hz');
axis([-300,300,0,range_prY]);
grid on
subplot(6,4,16);
plot(Pk.p,pr.Rp(round(800/freq.fs2),:),Pk.p,pr.Xp(round(800/freq.fs2),:),Pk.p,-pr.Rp(round(800/freq.fs2),:),'--','LineWidth',change.linw);
axis([-300,300,-1500,750]);
title('R(p) and X(p) @ 800Hz');
grid on;

subplot(6,4,17);
plot(Pk.p,pr.B(round(1000/freq.fs2),:),'LineWidth',change.linw);
title('B @ 1000Hz');
axis([-300,300,range_minprB,range_maxprB]);
grid on;
subplot(6,4,18);
plot(Pk.p,pr.G(round(1000/freq.fs2),:),'LineWidth',change.linw);
title('G @ 1000Hz');
axis([-300,300,0,range_prG]);
grid on;
subplot(6,4,19);
plot(Pk.p,pr.Yabs(round(1000/freq.fs2),:),'LineWidth',change.linw);
title('|Y| @ 1000Hz');
axis([-300,300,0,range_prY]);
grid on
subplot(6,4,20);
plot(Pk.p,pr.Rp(round(1000/freq.fs2),:),Pk.p,pr.Xp(round(1000/freq.fs2),:),Pk.p,-pr.Rp(round(1000/freq.fs2),:),'--','LineWidth',change.linw);
axis([-300,300,-1500,750]);
title('R(p) and X(p) @ 1000Hz');
grid on;

subplot(6,4,21);
plot(Pk.p,pr.B(round(1200/freq.fs2),:),'LineWidth',change.linw);
title('B @ 1200Hz');
grid on;
axis([-300,300,range_minprB,range_maxprB]);
subplot(6,4,22);
plot(Pk.p,pr.G(round(1200/freq.fs2),:),'LineWidth',change.linw);
title('G @ 1200Hz');
axis([-300,300,0,range_prG]);
grid on;
subplot(6,4,23);
plot(Pk.p,pr.Yabs(round(1200/freq.fs2),:),'LineWidth',change.linw);
title('|Y| @ 1200Hz');
axis([-300,300,0,range_prY]);
grid on
subplot(6,4,24);
plot(Pk.p,pr.Rp(round(1200/freq.fs2),:),Pk.p,pr.Xp(round(1200/freq.fs2),:),Pk.p,-pr.Rp(round(1200/freq.fs2),:),'--','LineWidth',change.linw);
axis([-300,300,-1500,750]);
title('R(p) and X(p) @ 1200Hz');
grid on;

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Resistance (R) and Reactance (X) @ Probe tip Vanhuyse - Keefe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(2)
subplot(1,2,1);
semilogx((freq.fs1:freq.fs2:freq.fs3),kr.Xeq,change.marker1,(freq.fs1:freq.fs2:freq.fs3),vh.Xv,change.marker2,(freq.fs1:freq.fs2:freq.fs3),kr.Req,change.marker1,(freq.fs1:freq.fs2:freq.fs3),vh.Rv,change.marker2,'LineWidth',change.linw);
grid on
axis([100,max(freq.freq),-2000,1000])
hleg=legend('X_m_i_d_d_l_e_-_e_a_r','X_p_r_o_b_e','R_m_i_d_d_l_e_-_e_a_r','R_p_r_o_b_e');
set(hleg,'Location','SouthEast');
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('Req and Xeq and X and R Vanhuyse');

subplot(1,2,2);
semilogx((freq.fs1:freq.fs2:freq.fs3),kr.Xeq,':',(freq.fs1:freq.fs2:freq.fs3),ke.Xk,(freq.fs1:freq.fs2:freq.fs3),kr.Req,':',(freq.fs1:freq.fs2:freq.fs3),ke.Rk,'LineWidth',change.linw);
grid on
axis([100,max(freq.freq),-2000,1000])
hleg=legend('X_m_i_d_d_l_e_-_e_a_r','X_p_r_o_b_e','R_m_i_d_d_l_e_-_e_a_r','R_p_r_o_b_e');
set(hleg,'Location','SouthEast');
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('Req and Xeq and X and R Keefe');

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Conductance (G) and Susceptance (B) @ Probe tip
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

range_Bk = round((max(ke.Bk)*1000))/1000;
figure(3)
% semilogx((freq.fs1:freq.fs2:freq.fs3),ke.Gk,(freq.fs1:freq.fs2:freq.fs3),ke.Bk,'LineWidth',change.linw);
plot((freq.fs1:freq.fs2:freq.fs3),ke.Gk,change.marker2,(freq.fs1:freq.fs2:freq.fs3),ke.Bk,change.marker2,'LineWidth',change.linw);
% axis([100,max(freq.freq)/2,-range_Bk,range_Bk]);
axis([100,max(freq.freq)/2,-1e-2,1.5e-2]);
hleg=legend('Conductance G','Susceptance B');
set(hleg,'Location','SouthEast');
grid on;
title('Conductance and Susceptance @ Probe tip');

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Admittance total model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

range_Yk = round((max(abs(ke.Yk))*10000))/10000;
figure(4)
G=ke.Gk;
B=ke.Bk;
plotv([G(round(266/freq.fs2)),G(round(300/freq.fs2)),G(round(400/freq.fs2)),G(round(500/freq.fs2)),G(round(660/freq.fs2)),G(round(800/freq.fs2)),G(round(1000/freq.fs2)),G(round(1200/freq.fs2)) ; 
    B(round(226/freq.fs2)),B(round(300/freq.fs2)),B(round(400/freq.fs2)),B(round(500/freq.fs2)),B(round(660/freq.fs2)),B(round(800/freq.fs2)),B(round(1000/freq.fs2)),B(round(1200/freq.fs2))],'-')
% axis([0,range_Yk,-range_Yk,range_Yk]);
grid on
xlabel('Acoustic Conductance (Ga)');
ylabel('Acoustic Susceptance (Ba)');
title('Admittance total model @ Probe tip');
hleg=legend('226Hz','300Hz','400Hz','500Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','BestOutside');


%%
end