% function run_ttest()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables general
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
freq.fs1=1;                             % Start frequency
freq.fs2=1;                             % Step       
freq.fs3=2500;                            % End frequency
freq.freq=freq.fs1:freq.fs2:freq.fs3;   % range and step Omega
w=2.*pi.*freq.freq;
change.pat_fact=1;


sample_factor = -0.3:0.1:0.3;
for i = 1:7

    if ~sample_factor(i)
change.ec_l = 2.5;     % length ear-canal cm
change.ec_d = 1.4;     % diameter ear-canal cm
change.mec_v = 12;     % middle-ear cavity volume cc/ml/cm^3
change.mec_L = 0;      % middle-ear cavity L-value (Henry), when coupled -> n/a
change.mec_Lsw = 1;    % middle-ear cavity L-value coupled to volume on/off, 1=on
change.mec_R = 60;     % middle-ear cavity resistance
change.onoff = 1;      % neglect wall admittance 1 = yes
change.fw = 0;         % resonant frequency wall canal model
change.Qw = 0;         % Q-factor wall canal model
change.fCC = 0;        % ratio Cw/Cm wall canal model
change.addC = 100;     % add acoustic ohm to reactance
change.fixR_onoff = 1; % 0=off,1=on
change.fixR = 100;     % fixed R-value        
    else
change.ec_l = 2.5 * sample_factor(i);     % length ear-canal cm
change.ec_d = 1.4 * sample_factor(i);     % diameter ear-canal cm
change.mec_v = 12 * sample_factor(i);     % middle-ear cavity volume cc/ml/cm^3
change.mec_L = 0;      % middle-ear cavity L-value (Henry), when coupled -> n/a
change.mec_Lsw = 1;    % middle-ear cavity L-value coupled to volume on/off, 1=on
change.mec_R = 60 * sample_factor(i);     % middle-ear cavity resistance
change.onoff = 1;      % neglect wall admittance 1 = yes
change.fw = 0;         % resonant frequency wall canal model
change.Qw = 0;         % Q-factor wall canal model
change.fCC = 0;        % ratio Cw/Cm wall canal model
change.addC = 100;     % add acoustic ohm to reactance
change.fixR_onoff = 1; % 0=off,1=on
change.fixR = 100;     % fixed R-value
    end

[~,~,ke,~]=total_model(w,change); % healthy ear
sample(i,:) = ke.Xk;

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% graphs function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

change.linw = 3;       % line width graphs in function file
change.marker1 = ':';  % marker type/size first line
change.marker2 = '-';  % marker type/size second line

% graphs(kr,vh,ke,pr,freq,change)

df = 7;

SEM = std(sample)./sqrt(df-1);               % Standard Error
ts = tinv([0.025  0.975],df-1);                                % T-Score, 95% Confidence
CI95UCL = mean(sample) + ts(1).*SEM;                  % Upper confidence interval 
CI95LCL = mean(sample) + ts(2).*SEM;                  % Lower confidence interval 

figure(2);
semilogx((freq.fs1:freq.fs2:freq.fs3),CI95UCL,'r',(freq.fs1:freq.fs2:freq.fs3),CI95LCL,'r',...
    (freq.fs1:freq.fs2:freq.fs3),sample(4,:),'LineWidth',change.linw);
axis([100,1500,-2000,1000]);
set(gca,'xtick',[100 250 500 750 1000 1250 1500]);
grid on
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('95% Confidence Bounds healthy Adult ear -30% to + 30%');







% end