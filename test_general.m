
change.linw = 3;    % line width graphs in function file

sample(1,:)=var.age.x0;
sample(2,:)=var.age.x1;
sample(3,:)=var.age.x2;
sample(4,:)=var.age.x3;
sample(5,:)=var.age.x4;
sample(6,:)=var.age.x5;

sample_ome(1,:)=var.age.x0_ome;
sample_ome(2,:)=var.age.x1_ome;
sample_ome(3,:)=var.age.x2_ome;
sample_ome(4,:)=var.age.x3_ome;
sample_ome(5,:)=var.age.x4_ome;
sample_ome(6,:)=var.age.x5_ome;

df=6;                                                 % Degrees of freedom
SEM = std(sample)./sqrt(5);                           % Standard Error
ts = tinv(0.975,df-1);                                % T-Score, 95% Confidence
CI95UCL = mean(sample) + ts(1).*SEM;                  % Upper confidence interval 
CI95LCL = mean(sample) - ts(1).*SEM;                  % Lower confidence interval 
SEM_ome = std(sample_ome)./sqrt(5);                   % Standard Error ome ear
ts_ome = tinv(0.975,df-1);                            % T-Score, 95% Confidence ome ear
CI95UCL_ome = mean(sample_ome) + ts_ome(1).*SEM_ome;  % Upper confidence interval ome ear
CI95LCL_ome = mean(sample_ome) - ts_ome(1).*SEM_ome;  % Lower confidence interval ome ear

figure(2);
semilogx((freq.fs1:freq.fs2:freq.fs3),CI95UCL,'k',(freq.fs1:freq.fs2:freq.fs3),CI95UCL_ome,'r:',(freq.fs1:freq.fs2:freq.fs3),CI95LCL,'k',(freq.fs1:freq.fs2:freq.fs3),CI95LCL_ome,'r:','LineWidth',change.linw);
axis([100,1500,-2000,1000]);
set(gca,'xtick',[100 250 500 750 1000 1250 1500]);
grid on
hleg=legend('95% confidence bounds, normal ME','95% confidence bounds, fluid-filled ME');
set(hleg,'Location','SouthEast');
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('95% Confidence Bounds healthy v.s fluid-filled - Total age variation');

