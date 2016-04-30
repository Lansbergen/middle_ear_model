function graphs_loop(var,freq,change)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Last changed : 28-5-2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% version      : 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% --- description ---  
%%%     Function file for graphs from looped main script
%%%     Input variation struct-files var containing multiple datasets
%%%     together with the change-profile parameterset.
%%%     
%%%     
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% --- modifications log ---
%%%
%%% * 21-5-2015; file created, based on graphs function
%%% * 21-5-2015; added graph, overview of reactances as function of age
%%% * 23-5-2015; added wall-effect close-up
%%% * 25-5-2015; renamed all final function and main file(s) after
%%% * 25-5-2015; after validation by with Alex 21-5-2015 (version 2)
%%% * 26-5-2015; added marker type/size as an input to the graph-function
%%% * 26-5-2015; added ear-canal: length, diameter and volume and 
%%% * 26-5-2015; middle-ear cavities graphs (adult and 6 M.O.)
%%% * 28-5-2015; optimized input to plot-functions (marker type etc).
%%% * 28-5-2015; added reactance overview age-prof healthy vs. OME graphs
%%% * 1-6-2015; added 95% confidence bound plot
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Pk=parameters(change);   % Load model parameters for graphs

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Reactances total model age profiles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(1)
subplot(2,2,1);
semilogx((freq.fs1:freq.fs2:freq.fs3),var.age.x0,change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.age.x1,change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.age.x2,change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.age.x3,change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.age.x4,change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.age.x5,change.marker2,'LineWidth',change.linw);
grid on
axis([100,max(freq.freq),-2000,1000]);
set(gca,'xtick',[100 250 500 750 1000 1250 1500 2000]);
hleg=legend('adult','1 M.O.','3 M.O.','6 M.O.','12 M.O.','24 M.O.');
set(hleg,'Location','SouthEast');
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('Reactance total model');

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% ratio Cw/Cm wall canal model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,2);
semilogx((freq.fs1:freq.fs2:freq.fs3),var.X_ratcm_ec_1m(1,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_ratcm_ec_1m(2,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_ratcm_ec_1m(3,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_ratcm_ec_1m(4,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_ratcm_ec_1m(5,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_ratcm_ec_1m(6,:),change.marker2,'LineWidth',change.linw);
% plot((freq.fs1:freq.fs2:freq.fs3),var.X_ratcm_ec_1m(1,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_ratcm_ec_1m(2,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_ratcm_ec_1m(3,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_ratcm_ec_1m(4,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_ratcm_ec_1m(5,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_ratcm_ec_1m(6,:),change.marker2,'LineWidth',change.linw);
grid on
axis([100,max(freq.freq),-1000,750]);
set(gca,'xtick',[100 250 500 750 1000 1250 1500 2000]);
hleg=legend('1','1.5','2','2.5','3','3.5');
set(hleg,'Location','SouthEast');
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('Reactance 1 M.O. total model - ratio Cw/Cm wall canal model');


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% resonant frequency wall canal model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,3);
semilogx((freq.fs1:freq.fs2:freq.fs3),var.X_resf_ec_1m(1,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_resf_ec_1m(2,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_resf_ec_1m(3,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_resf_ec_1m(4,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_resf_ec_1m(5,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_resf_ec_1m(6,:),change.marker2,'LineWidth',change.linw);
% plot((freq.fs1:freq.fs2:freq.fs3),var.X_resf_ec_1m(1,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_resf_ec_1m(2,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_resf_ec_1m(3,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_resf_ec_1m(4,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_resf_ec_1m(5,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_resf_ec_1m(6,:),change.marker2,'LineWidth',change.linw);
grid on
axis([100,max(freq.freq),-1000,750]);
set(gca,'xtick',[100 250 500 750 1000 1250 1500 2000]);
hleg=legend('300 Hz','400 Hz','500 Hz','600 Hz','700 Hz','800 Hz');
set(hleg,'Location','SouthEast');
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('Reactance 1 M.O. total model - resonant frequency wall canal model');


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Q-factor wall canal model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,4);
semilogx((freq.fs1:freq.fs2:freq.fs3),var.X_qfact_ec_1m(1,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_qfact_ec_1m(2,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_qfact_ec_1m(3,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_qfact_ec_1m(4,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_qfact_ec_1m(5,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_qfact_ec_1m(6,:),change.marker2,'LineWidth',change.linw);
% plot((freq.fs1:freq.fs2:freq.fs3),var.X_qfact_ec_1m(1,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_qfact_ec_1m(2,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_qfact_ec_1m(3,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_qfact_ec_1m(4,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_qfact_ec_1m(5,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_qfact_ec_1m(6,:),change.marker2,'LineWidth',change.linw);
grid on
axis([100,max(freq.freq),-1000,750]);
set(gca,'xtick',[100 250 500 750 1000 1250 1500 2000]);
hleg=legend('1.5','2','2.5','3','3.5','4');
set(hleg,'Location','SouthEast');
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('Reactance 1 M.O. total model - Q-factor wall canal model');

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% T-Score, 95% Confidence Bounds, Total age variation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

test(1,:)=var.age.x0;
test(2,:)=var.age.x1;
test(3,:)=var.age.x2;
test(4,:)=var.age.x3;
test(5,:)=var.age.x4;
test(6,:)=var.age.x5;

df=6;                               % Degrees of freedom
SEM = std(test)./sqrt(5);           % Standard Error
ts = tinv(0.975,df-1);              % T-Score, 95% Confidence
CI95UCL = mean(test) + ts(1).*SEM;  % Upper confidence interval 
CI95LCL = mean(test) - ts(1).*SEM;  % Lower confidence interval 

figure(2);
semilogx((freq.fs1:freq.fs2:freq.fs3),CI95UCL,'k:',(freq.fs1:freq.fs2:freq.fs3),CI95LCL,'k:','LineWidth',change.linw);
set(gca,'xtick',[100 250 500 750 1000 1250 1500 2000]);
axis([100,max(freq.freq),-2000,750]);
grid on
hleg=legend('95% confidence');
set(hleg,'Location','South');
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('95% Confidence Bounds, Total age variation');


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Reactance adult total model - length ear-canal differences
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(3)
subplot(2,2,1);
% semilogx( (freq.fs1:freq.fs2:freq.fs3),var.X_length_ec(1,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec(2,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec(3,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec(4,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec(5,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec(6,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec(7,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec(8,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec(9,:),change.marker1,'LineWidth',change.linw);
plot((freq.fs1:freq.fs2:freq.fs3),var.X_length_ec(1,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec(2,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec(3,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec(4,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec(5,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec(6,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec(7,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec(8,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec(9,:),change.marker1,'LineWidth',change.linw);
grid on;
axis([500,max(freq.freq)/2,-500,500]);
hleg=legend('0.9cm','1.1cm','1.3cm','1.5cm','1.7cm','1.9cm','2.1cm','2.3cm','2.5cm');
set(hleg,'Location','SouthEast');
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('Reactance adult total model - length ear-canal differences');

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Reactance adult total model - length ear-canal differences
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,2);
% semilogx((freq.fs1:freq.fs2:freq.fs3),var.X_diam_ec(1,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_diam_ec(2,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_diam_ec(3,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_diam_ec(4,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_diam_ec(5,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_diam_ec(6,:),change.marker2,'LineWidth',change.linw);
plot((freq.fs1:freq.fs2:freq.fs3),var.X_diam_ec(1,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_diam_ec(2,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_diam_ec(3,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_diam_ec(4,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_diam_ec(5,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_diam_ec(6,:),change.marker2,'LineWidth',change.linw);
grid on;
axis([500,max(freq.freq)/2,-500,500]);
hleg=legend('0.4cm','0.6cm','0.8cm','1.0cm','1.2cm','1.4cm');
set(hleg,'Location','SouthEast');
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('Reactance adult total model - diameter ear-canal differences');

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Reactance adult total model - length ear-canal differences
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,3);
% semilogx((freq.fs1:freq.fs2:freq.fs3),var.X_vol_ec(1,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_vol_ec(2,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_vol_ec(3,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_vol_ec(4,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_vol_ec(5,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_vol_ec(6,:),change.marker2,'LineWidth',change.linw);
plot((freq.fs1:freq.fs2:freq.fs3),var.X_vol_ec(1,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_vol_ec(2,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_vol_ec(3,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_vol_ec(4,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_vol_ec(5,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_vol_ec(6,:),change.marker2,'LineWidth',change.linw);
grid on;
axis([500,max(freq.freq)/2,-500,500]);
hleg=legend('0.06cc','0.16cc','0.33cc','0.59cc','0.96cc','1.46cc');
set(hleg,'Location','SouthEast');
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('Reactance total model - volume ear-canal lin increase differences');

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Reactance adult total model - cavity differences middle-ear 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,4);
% semilogx((freq.fs1:freq.fs2:freq.fs3),var.X_cav_me(1,:) ,change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_cav_me(2,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_cav_me(3,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_cav_me(4,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_cav_me(5,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_cav_me(6,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_cav_me(7,:),change.marker1,'LineWidth',change.linw);
plot((freq.fs1:freq.fs2:freq.fs3),var.X_cav_me(1,:) ,change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_cav_me(2,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_cav_me(3,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_cav_me(4,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_cav_me(5,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_cav_me(6,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_cav_me(7,:),change.marker1,'LineWidth',change.linw);
grid on;
axis([500,max(freq.freq)/2,-500,500]);
hleg=legend('2cc','4cc','6cc','8cc','10cc','12cc','14cc');
set(hleg,'Location','SouthEast');
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('Reactance total model - differences reactance middle-ear cavities');

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Reactance 1 M.O. total model - length ear-canal differences
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(4)
subplot(2,2,1);
% semilogx((freq.fs1:freq.fs2:freq.fs3),var.X_length_ec_6m(1,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec_6m(2,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec_6m(3,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec_6m(4,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec_6m(5,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec_6m(6,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec_6m(7,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec_6m(8,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec_6m(9,:),change.marker1,'LineWidth',change.linw);
plot((freq.fs1:freq.fs2:freq.fs3),var.X_length_ec_6m(1,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec_6m(2,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec_6m(3,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec_6m(4,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec_6m(5,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec_6m(6,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec_6m(7,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_length_ec_6m(8,:),change.marker2,'LineWidth',change.linw);
grid on;
axis([100,max(freq.freq)/2,-500,500]);
hleg=legend('0.6cm','0.7cm','0.8cm','0.9cm','1.1cm','1.2cm','1.3cm','1.4cm');
set(hleg,'Location','SouthEast');
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('Reactance 1 M.O. total model - length ear-canal differences');

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Reactance 1 M.O. total model - length ear-canal differences
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,2);
% semilogx((freq.fs1:freq.fs2:freq.fs3),var.X_diam_ec_6m(1,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_diam_ec_6m(2,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_diam_ec_6m(3,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_diam_ec_6m(4,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_diam_ec_6m(5,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_diam_ec_6m(6,:),change.marker2,'LineWidth',change.linw);
plot((freq.fs1:freq.fs2:freq.fs3),var.X_diam_ec_6m(1,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_diam_ec_6m(2,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_diam_ec_6m(3,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_diam_ec_6m(4,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_diam_ec_6m(5,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_diam_ec_6m(6,:),change.marker2,'LineWidth',change.linw);
grid on;
axis([100,max(freq.freq)/2,-500,500]);
hleg=legend('0.2cm','0.3cm','0.4cm','0.5cm','0.6cm','0.7cm');
set(hleg,'Location','SouthEast');
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('Reactance 1 M.O. total model - diameter ear-canal differences');

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Reactance 1 M.O total model - length ear-canal differences
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,3);
% semilogx((freq.fs1:freq.fs2:freq.fs3),var.X_vol_ec_6m(1,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_vol_ec_6m(2,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_vol_ec_6m(3,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_vol_ec_6m(4,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_vol_ec_6m(5,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_vol_ec_6m(6,:),change.marker2,'LineWidth',change.linw);
plot((freq.fs1:freq.fs2:freq.fs3),var.X_vol_ec_6m(1,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_vol_ec_6m(2,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_vol_ec_6m(3,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_vol_ec_6m(4,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_vol_ec_6m(5,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_vol_ec_6m(6,:),change.marker2,'LineWidth',change.linw);
grid on;
axis([100,max(freq.freq)/2,-500,500]);
hleg=legend('0.007cc','0.018cc','0.036cc','0.063cc','0.099cc','0.147cc');
set(hleg,'Location','SouthEast');
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('Reactance 1 M.O. total model - volume ear-canal lin increase differences');

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Reactance 1 M.O. total model - cavity differences middle-ear 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,4);
% semilogx((freq.fs1:freq.fs2:freq.fs3),var.X_cav_me_6m(1,:) ,change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_cav_me_6m(2,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_cav_me_6m(3,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_cav_me_6m(4,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_cav_me_6m(5,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_cav_me_6m(6,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_cav_me_6m(7,:),change.marker1,'LineWidth',change.linw);
plot((freq.fs1:freq.fs2:freq.fs3),var.X_cav_me_6m(1,:) ,change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_cav_me_6m(2,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_cav_me_6m(3,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_cav_me_6m(4,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_cav_me_6m(5,:),change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.X_cav_me_6m(6,:),change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.X_cav_me_6m(7,:),change.marker1,'LineWidth',change.linw);
grid on;
axis([100,max(freq.freq)/2,-500,500]);
hleg=legend('1.50cc','1.75cc','2.00cc','2.25cc','2.50cc','2.75cc','3cc');
set(hleg,'Location','SouthEast');
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('Reactance 1 M.O. total model - differences volume middle-ear cavities');

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Reactance overview total model - differences healthy vs. OME
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(5)
subplot(2,3,1);
semilogx((freq.fs1:freq.fs2:freq.fs3),var.age.x0,change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.age.x0_ome,change.marker2,'LineWidth',change.linw);
axis([100,max(freq.freq),-2000,1000]);
set(gca,'xtick',[100 250 500 750 1000 1250 1500 2000]);
grid on;
hleg=legend('Healthy ear','OME ear');
set(hleg,'Location','SouthEast');
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('Reactance adult total model - differences healthy vs. OME');

subplot(2,3,2);
semilogx((freq.fs1:freq.fs2:freq.fs3),var.age.x1,change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.age.x1_ome,change.marker2,'LineWidth',change.linw);
axis([100,max(freq.freq),-2000,1000]);
set(gca,'xtick',[100 250 500 750 1000 1250 1500 2000]);
grid on;
hleg=legend('Healthy ear','OME ear');
set(hleg,'Location','SouthEast');
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('Reactance 1 M.O. total model - differences healthy vs. OME');

subplot(2,3,3);
semilogx((freq.fs1:freq.fs2:freq.fs3),var.age.x2,change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.age.x2_ome,change.marker2,'LineWidth',change.linw);
axis([100,max(freq.freq),-2000,1000]);
set(gca,'xtick',[100 250 500 750 1000 1250 1500 2000]);
grid on;
hleg=legend('Healthy ear','OME ear');
set(hleg,'Location','SouthEast');
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('Reactance 3 M.O. total model - differences healthy vs. OME');

subplot(2,3,4);
semilogx((freq.fs1:freq.fs2:freq.fs3),var.age.x3,change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.age.x3_ome,change.marker2,'LineWidth',change.linw);
axis([100,max(freq.freq),-2000,1000]);
set(gca,'xtick',[100 250 500 750 1000 1250 1500 2000]);
grid on;
hleg=legend('Healthy ear','OME ear');
set(hleg,'Location','SouthEast');
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('Reactance 6 M.O. total model - differences healthy vs. OME');

subplot(2,3,5);
semilogx((freq.fs1:freq.fs2:freq.fs3),var.age.x4,change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.age.x4_ome,change.marker2,'LineWidth',change.linw);
axis([100,max(freq.freq),-2000,1000]);
set(gca,'xtick',[100 250 500 750 1000 1250 1500 2000]);
grid on;
hleg=legend('Healthy ear','OME ear');
set(hleg,'Location','SouthEast');
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('Reactance 12 M.O. total model - differences healthy vs. OME');

subplot(2,3,6);
semilogx((freq.fs1:freq.fs2:freq.fs3),var.age.x5,change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.age.x5_ome,change.marker2,'LineWidth',change.linw);
axis([100,max(freq.freq),-2000,1000]);
set(gca,'xtick',[100 250 500 750 1000 1250 1500 2000]);
grid on;
hleg=legend('Healthy ear','OME ear');
set(hleg,'Location','SouthEast');
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('Reactance 24 M.O. total model - differences healthy vs. OME');

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% G,B and |Y| tympanograms multi-run adult
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sep = 0.0075; %// vertical separation

figure(6);
subplot(1,3,1);
hold all
plot(Pk.p,var.age.pr0.G(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr0.G(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr0.G(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr0.G(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr0.G(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr0.G(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('G adult');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;


subplot(1,3,2);
hold all
plot(Pk.p,var.age.pr0.B(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr0.B(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr0.B(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr0.B(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr0.B(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr0.B(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('B adult');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;

subplot(1,3,3);
hold all
plot(Pk.p,var.age.pr0.Yabs(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr0.Yabs(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr0.Yabs(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr0.Yabs(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr0.Yabs(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr0.Yabs(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('|Y| adult');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% G,B and |Y| tympanograms multi-run 1 M.O.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(7);
subplot(1,3,1);
hold all
plot(Pk.p,var.age.pr1.G(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr1.G(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr1.G(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr1.G(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr1.G(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr1.G(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('G - 1 M.O.');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;


subplot(1,3,2);
hold all
plot(Pk.p,var.age.pr1.B(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr1.B(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr1.B(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr1.B(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr1.B(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr1.B(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('B - 1 M.O');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;

subplot(1,3,3);
hold all
plot(Pk.p,var.age.pr1.Yabs(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr1.Yabs(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr1.Yabs(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr1.Yabs(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr1.Yabs(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr1.Yabs(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('|Y| - 1 M.O.');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% G,B and |Y| tympanograms multi-run 3 M.O.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(8);
subplot(1,3,1);
hold all
plot(Pk.p,var.age.pr2.G(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr2.G(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr2.G(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr2.G(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr2.G(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr2.G(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('G - 3 M.O.');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;


subplot(1,3,2);
hold all
plot(Pk.p,var.age.pr2.B(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr2.B(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr2.B(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr2.B(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr2.B(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr2.B(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('B - 3 M.O');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;

subplot(1,3,3);
hold all
plot(Pk.p,var.age.pr2.Yabs(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr2.Yabs(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr2.Yabs(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr2.Yabs(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr2.Yabs(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr2.Yabs(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('|Y| - 3 M.O.');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% G,B and |Y| tympanograms multi-run 6 M.O.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(9);
subplot(1,3,1);
hold all
plot(Pk.p,var.age.pr3.G(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr3.G(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr3.G(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr3.G(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr3.G(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr3.G(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('G - 6 M.O.');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;


subplot(1,3,2);
hold all
plot(Pk.p,var.age.pr3.B(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr3.B(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr3.B(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr3.B(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr3.B(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr3.B(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('B - 6 M.O');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;

subplot(1,3,3);
hold all
plot(Pk.p,var.age.pr3.Yabs(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr3.Yabs(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr3.Yabs(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr3.Yabs(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr3.Yabs(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr3.Yabs(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('|Y| - 6 M.O.');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% G,B and |Y| tympanograms multi-run 12 M.O.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(10);
subplot(1,3,1);
hold all
plot(Pk.p,var.age.pr4.G(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr4.G(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr4.G(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr4.G(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr4.G(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr4.G(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('G - 12 M.O.');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;


subplot(1,3,2);
hold all
plot(Pk.p,var.age.pr4.B(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr4.B(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr4.B(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr4.B(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr4.B(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr4.B(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('B - 12 M.O');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;

subplot(1,3,3);
hold all
plot(Pk.p,var.age.pr4.Yabs(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr4.Yabs(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr4.Yabs(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr4.Yabs(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr4.Yabs(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr4.Yabs(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('|Y| - 12 M.O.');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% G,B and |Y| tympanograms multi-run adult
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(11);
subplot(1,3,1);
hold all
plot(Pk.p,var.age.pr5.G(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr5.G(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr5.G(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr5.G(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr5.G(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr5.G(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('G - 24 M.O.');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;


subplot(1,3,2);
hold all
plot(Pk.p,var.age.pr5.B(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr5.B(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr5.B(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr5.B(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr5.B(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr5.B(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('B - 24 M.O');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;

subplot(1,3,3);
hold all
plot(Pk.p,var.age.pr5.Yabs(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr5.Yabs(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr5.Yabs(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr5.Yabs(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr5.Yabs(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr5.Yabs(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('|Y| - 24 M.O.');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;
























%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% G,B and |Y| tympanograms multi-run adult
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sep = 0.0075; %// vertical separation

figure(12);
subplot(6,3,1);
hold all
plot(Pk.p,var.age.pr0.G(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr0.G(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr0.G(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr0.G(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr0.G(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr0.G(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('G adult');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
grid off;


subplot(6,3,2);
hold all
plot(Pk.p,var.age.pr0.B(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr0.B(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr0.B(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr0.B(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr0.B(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr0.B(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('B adult');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
grid off;

subplot(6,3,3);
hold all
plot(Pk.p,var.age.pr0.Yabs(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr0.Yabs(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr0.Yabs(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr0.Yabs(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr0.Yabs(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr0.Yabs(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('|Y| adult');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
grid off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% G,B and |Y| tympanograms multi-run 1 M.O.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(6,3,4);
hold all
plot(Pk.p,var.age.pr1.G(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr1.G(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr1.G(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr1.G(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr1.G(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr1.G(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('G - 1 M.O.');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
grid off;


subplot(6,3,5);
hold all
plot(Pk.p,var.age.pr1.B(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr1.B(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr1.B(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr1.B(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr1.B(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr1.B(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('B - 1 M.O');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
grid off;

subplot(6,3,6);
hold all
plot(Pk.p,var.age.pr1.Yabs(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr1.Yabs(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr1.Yabs(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr1.Yabs(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr1.Yabs(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr1.Yabs(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('|Y| - 1 M.O.');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
grid off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% G,B and |Y| tympanograms multi-run 3 M.O.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(6,3,7);
hold all
plot(Pk.p,var.age.pr2.G(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr2.G(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr2.G(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr2.G(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr2.G(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr2.G(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('G - 3 M.O.');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
grid off;


subplot(6,3,8);
hold all
plot(Pk.p,var.age.pr2.B(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr2.B(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr2.B(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr2.B(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr2.B(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr2.B(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('B - 3 M.O');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
grid off;

subplot(6,3,9);
hold all
plot(Pk.p,var.age.pr2.Yabs(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr2.Yabs(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr2.Yabs(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr2.Yabs(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr2.Yabs(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr2.Yabs(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('|Y| - 3 M.O.');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
grid off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% G,B and |Y| tympanograms multi-run 6 M.O.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(6,3,10);
hold all
plot(Pk.p,var.age.pr3.G(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr3.G(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr3.G(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr3.G(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr3.G(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr3.G(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('G - 6 M.O.');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
grid off;


subplot(6,3,11);
hold all
plot(Pk.p,var.age.pr3.B(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr3.B(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr3.B(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr3.B(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr3.B(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr3.B(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('B - 6 M.O');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
grid off;

subplot(6,3,12);
hold all
plot(Pk.p,var.age.pr3.Yabs(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr3.Yabs(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr3.Yabs(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr3.Yabs(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr3.Yabs(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr3.Yabs(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('|Y| - 6 M.O.');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
grid off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% G,B and |Y| tympanograms multi-run 12 M.O.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(6,3,13);
hold all
plot(Pk.p,var.age.pr4.G(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr4.G(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr4.G(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr4.G(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr4.G(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr4.G(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('G - 12 M.O.');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
grid off;


subplot(6,3,14);
hold all
plot(Pk.p,var.age.pr4.B(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr4.B(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr4.B(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr4.B(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr4.B(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr4.B(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('B - 12 M.O');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
grid off;

subplot(6,3,15);
hold all
plot(Pk.p,var.age.pr4.Yabs(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr4.Yabs(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr4.Yabs(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr4.Yabs(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr4.Yabs(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr4.Yabs(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('|Y| - 12 M.O.');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
grid off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% G,B and |Y| tympanograms multi-run adult
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


subplot(6,3,16);
hold all
plot(Pk.p,var.age.pr5.G(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr5.G(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr5.G(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr5.G(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr5.G(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr5.G(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('G - 24 M.O.');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
grid off;


subplot(6,3,17);
hold all
plot(Pk.p,var.age.pr5.B(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr5.B(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr5.B(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr5.B(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr5.B(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr5.B(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('B - 24 M.O');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
grid off;

subplot(6,3,18);
hold all
plot(Pk.p,var.age.pr5.Yabs(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr5.Yabs(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr5.Yabs(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr5.Yabs(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr5.Yabs(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr5.Yabs(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('|Y| - 24 M.O.');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
grid off;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% G,B and |Y| tympanograms multi-run 24 month - OME
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sep = 0.0075; %// vertical separation

figure(13);
subplot(1,3,1);
hold all
plot(Pk.p,var.age.pr0_ome.G(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr0_ome.G(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr0_ome.G(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr0_ome.G(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr0_ome.G(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr0_ome.G(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('G adult - fluid-filled middle-ear');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;


subplot(1,3,2);
hold all
plot(Pk.p,var.age.pr0_ome.B(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr0_ome.B(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr0_ome.B(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr0_ome.B(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr0_ome.B(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr0_ome.B(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('B adult - fluid filled middle-ear');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;

subplot(1,3,3);
hold all
plot(Pk.p,var.age.pr0_ome.Yabs(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr0_ome.Yabs(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr0_ome.Yabs(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr0_ome.Yabs(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr0_ome.Yabs(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr0_ome.Yabs(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('|Y| adult - fluid-filled middle-ear');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% G,B and |Y| tympanograms multi-run 1 M.O. - OME
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(14);
subplot(1,3,1);
hold all
plot(Pk.p,var.age.pr1_ome.G(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr1_ome.G(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr1_ome.G(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr1_ome.G(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr1_ome.G(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr1_ome.G(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('G - 1 M.O. - fluid-filled middle-ear');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;


subplot(1,3,2);
hold all
plot(Pk.p,var.age.pr1_ome.B(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr1_ome.B(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr1_ome.B(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr1_ome.B(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr1_ome.B(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr1_ome.B(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('B - 1 M.O - fluid-filled middle-ear');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;

subplot(1,3,3);
hold all
plot(Pk.p,var.age.pr1_ome.Yabs(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr1_ome.Yabs(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr1_ome.Yabs(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr1_ome.Yabs(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr1_ome.Yabs(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr1_ome.Yabs(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('|Y| - 1 M.O. - fluid-filled middle-ear');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% G,B and |Y| tympanograms multi-run 3 M.O. - OME
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(15);
subplot(1,3,1);
hold all
plot(Pk.p,var.age.pr2_ome.G(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr2_ome.G(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr2_ome.G(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr2_ome.G(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr2_ome.G(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr2_ome.G(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('G - 3 M.O. - fluid-filled middle-ear');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;


subplot(1,3,2);
hold all
plot(Pk.p,var.age.pr2_ome.B(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr2_ome.B(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr2_ome.B(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr2_ome.B(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr2_ome.B(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr2_ome.B(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('B - 3 M.O - fluid-filled middle-ear');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;

subplot(1,3,3);
hold all
plot(Pk.p,var.age.pr2_ome.Yabs(round(226/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,sep+var.age.pr2_ome.Yabs(round(400/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,2*sep+var.age.pr2_ome.Yabs(round(660/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,3*sep+var.age.pr2_ome.Yabs(round(800/freq.fs2),:),change.marker2,'LineWidth',change.linw);
plot(Pk.p,4*sep+var.age.pr2_ome.Yabs(round(1000/freq.fs2),:),change.marker1,'LineWidth',change.linw);
plot(Pk.p,5*sep+var.age.pr2_ome.Yabs(round(1200/freq.fs2),:),change.marker2,'LineWidth',change.linw);
hold off
title('|Y| - 3 M.O. - fluid-filled middle-ear');
axis([-300,300,0,0.05]);
set(gca,'ytick',[]);
hleg=legend('226Hz','400Hz','660Hz','800Hz','1000Hz','1200Hz');
set(hleg,'Location','NorthEast');
grid off;

end
