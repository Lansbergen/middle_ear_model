change.linw = 3;    % line width graphs in function file
change.marker1 = 'k-'; % marker type/size second line
change.marker2 = 'g--'; % marker type/size first line
change.marker3 = 'b-'; % marker type/size second line
change.marker4 = 'r--'; % marker type/size second line

% figure(1)
% semilogx((freq.fs1:freq.fs2:freq.fs3),var.age.r0,change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.age.r0_ome,change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.age.x0,change.marker3,(freq.fs1:freq.fs2:freq.fs3),var.age.x0_ome,change.marker4,'LineWidth',change.linw);
% axis([100,1500,-2000,750]);
% set(gca,'xtick',[100 250 500 750 1000 1250 1500]);
% grid on;
% hleg=legend('Resistance healthy ear ','Resistance 90% fluid-filled','Reactance healthy ear ','Reactance 90% fluid-filled');
% set(hleg,'Location','SouthEast');
% xlabel('Frequency (Hz)');
% ylabel('Impedance (Acoustic Ohm)');
% title('Reactance adult total model - differences healthy vs. OME');
% 
figure(1)
semilogx((freq.fs1:freq.fs2:freq.fs3),var.age.r2,change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.age.r2_ome,change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.age.x2,change.marker3,(freq.fs1:freq.fs2:freq.fs3),var.age.x2_ome,change.marker4,'LineWidth',change.linw);
axis([100,1500,-3000,2000]);
set(gca,'xtick',[100 250 500 750 1000 1250 1500]);
grid on;
hleg=legend('Resistance healthy ear ','Resistance 90% fluid-filled','Reactance healthy ear ','Reactance 90% fluid-filled');
set(hleg,'Location','SouthEast');
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('Reactance 3 M.O. total model - differences healthy vs. OME');

% range_Bk = round((max(var.age.ke0.Bk)*1000))/1000;
% figure(1)
% plot((freq.fs1:freq.fs2:freq.fs3),var.age.ke0.Gk,change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.age.ke0_ome.Gk,change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.age.ke0.Bk,change.marker3,(freq.fs1:freq.fs2:freq.fs3),var.age.ke0_ome.Bk,change.marker4,'LineWidth',change.linw);
% axis([100,max(freq.freq)/1,-1e-2,1.5e-2]);
% hleg=legend('Conductance healthy ear','Conductance healty ear','Susceptance 90% fluid-filled','Susceptance 90% fluid-filled');
% set(hleg,'Location','SouthEast');
% grid on;
% xlabel('Frequency (Hz)');
% ylabel('Admittance (Acoustic mho)');
% title('Resistance and Reactance Model Predictions - Adult');

% range_Bk = round((max(var.age.ke1.Bk)*1000))/1000;
% figure(2)
% plot((freq.fs1:freq.fs2:freq.fs3),var.age.ke2.Gk,change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.age.ke2_ome.Gk,change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.age.ke2.Bk,change.marker3,(freq.fs1:freq.fs2:freq.fs3),var.age.ke2_ome.Bk,change.marker4,'LineWidth',change.linw);
% axis([100,max(freq.freq)/2/1,-1e-2,1.5e-2]);
% hleg=legend('Conductance healthy ear','Conductance 90% fluid-filled','Susceptance healthy ear','Susceptance 90% fluid-filled');
% set(hleg,'Location','SouthEast');
% grid on;
% xlabel('Frequency (Hz)');
% ylabel('Admittance (Acoustic mho)');
% title('Conductance and Susceptance, Model Predictions - Young Infant');

% range_Bk = round((max(var.age.ke1.Bk)*1000))/1000;
% figure(2)
% plot((freq.fs1:freq.fs2:freq.fs3),var.age.ke1.Gk,change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.age.ke1_ome.Gk,change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.age.ke1.Bk,change.marker3,(freq.fs1:freq.fs2:freq.fs3),var.age.ke1_ome.Bk,change.marker4,'LineWidth',change.linw);
% axis([100,max(freq.freq)/2/1,-1e-2,1.5e-2]);
% hleg=legend('Conductance healthy ear','Conductance 90% fluid-filled','Susceptance healthy ear','Susceptance 90% fluid-filled');
% set(hleg,'Location','SouthEast');
% grid on;
% xlabel('Frequency (Hz)');
% ylabel('Admittance (Acoustic mho)');
% title('Conductance and Susceptance, Model Predictions - Neonate');

% range_Bk = round((max(var.age.ke1.Bk)*1000))/1000;
% figure(2)
% plot((freq.fs1:freq.fs2:freq.fs3),var.age.ke0.Gk,change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.age.ke0_ome.Gk,change.marker2,(freq.fs1:freq.fs2:freq.fs3),var.age.ke0.Bk,change.marker3,(freq.fs1:freq.fs2:freq.fs3),var.age.ke0_ome.Bk,change.marker4,'LineWidth',change.linw);
% axis([100,max(freq.freq)/2/1,-1e-2,1.5e-2]);
% hleg=legend('Conductance healthy ear','Conductance 90% fluid-filled','Susceptance healthy ear','Susceptance 90% fluid-filled');
% set(hleg,'Location','SouthEast');
% grid on;
% xlabel('Frequency (Hz)');
% ylabel('Admittance (Acoustic mho)');
% title('Conductance and Susceptance, Model Predictions - Adult');

figure(1)
semilogx((freq.fs1:freq.fs2:freq.fs3),var.age.x0,change.marker1,(freq.fs1:freq.fs2:freq.fs3),var.age.x1,change.marker2,'LineWidth',change.linw);
grid on
axis([100,max(freq.freq),-2000,1000]);
set(gca,'xtick',[100 250 500 750 1000 1250 1500 2000]);
hleg=legend('adult','1 M.O.');
set(hleg,'Location','SouthEast');
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('Reactance total model');