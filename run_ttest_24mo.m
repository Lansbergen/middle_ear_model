function [sample, CI95UCL, CI95LCL]=run_ttest_24mo(max_range,min_range)
%[sample, CI95UCL, CI95LCL] = run_ttest_1mo (max_range,min_range)
%
%
%   parameters:
%       - 24 months
%
%
%   (c) Simon Lansbergen, May 2016.
%


switch nargin  % set input varibles 
    case 2
        if isa(max_range,'char')
        max_range = str2double(max_range);
        min_range = str2double(min_range);         
        end
        disp(' *** Got manual input ***');disp(' ');  
    case 0
        max_range = 1.5;
        min_range = 0.5;
        disp(' ');disp(' *** No manual input ***');
        disp(' *** Range set to + and - 50% ** *');disp(' ');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Variables general
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
freq.fs1=1;                             % Start frequency
freq.fs2=1;                             % Step       
freq.fs3=2500;                            % End frequency
freq.freq=freq.fs1:freq.fs2:freq.fs3;   % range and step Omega
w=2.*pi.*freq.freq;
change.pat_fact=0.1;


% set sample range 
sample_factor = min_range:0.1:max_range;

% data acquisition loop - resonant freq
for i = 1:numel(sample_factor)
    
change.ec_l = 1.4 * sample_factor(i);     % length ear-canal cm
change.ec_d = 0.77 * sample_factor(i);     % diameter ear-canal cm
change.mec_v = 10 * sample_factor(i);     % middle-ear cavity volume cc/ml/cm^3
change.mec_L = 0;      % middle-ear cavity L-value (Henry), when coupled -> n/a
change.mec_Lsw = 1;    % middle-ear cavity L-value coupled to volume on/off, 1=on
change.mec_R = 60 * sample_factor(i);     % middle-ear cavity resistance
change.onoff = 1;      % neglect wall admittance 1 = yes
change.fw = 0;       % resonant frequency wall canal model
change.Qw = 0;        % Q-factor wall canal model
change.fCC = 0;     % ratio Cw/Cm wall canal model
change.addC = 100 * sample_factor(i);     % add acoustic ohm to reactance
change.fixR_onoff = 1; % 0=off,1=on
change.fixR = 110;     % fixed R-value       
    
[~,~,ke,pr]=total_model(w,change); % healthy ear
sample(i,:) = pr.Xp(:,300);

end


% controle - original values.
change.ec_l = 1.4;     % length ear-canal cm
change.ec_d = 0.77;     % diameter ear-canal cm
change.mec_v = 10;     % middle-ear cavity volume cc/ml/cm^3
change.mec_L = 0;      % middle-ear cavity L-value (Henry), when coupled -> n/a
change.mec_Lsw = 1;    % middle-ear cavity L-value coupled to volume on/off, 1=on
change.mec_R = 60;     % middle-ear cavity resistance
change.onoff = 1;      % neglect wall admittance 1 = yes
change.fw = 0;       % resonant frequency wall canal model
change.Qw = 0;        % Q-factor wall canal model
change.fCC = 0;     % ratio Cw/Cm wall canal model
change.addC = 100;     % add acoustic ohm to reactance
change.fixR_onoff = 1; % 0=off,1=on
change.fixR = 110;     % fixed R-value       

[~,~,ke,pr]=total_model(w,change); % healthy ear

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Ttest, 95& CI interval and graph
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

change.linw = 4;       % line width graphs in function file
change.marker1 = ':';  % marker type/size first line
change.marker2 = '-';  % marker type/size second line



% calculate 95% CI interval bounds
df = numel(sample_factor);
[CI95UCL, CI95LCL] = ci_interval(sample,df);


% plot 95% CI interval bounds together with original profile.
figure;
semilogx((freq.fs1:freq.fs2:freq.fs3),CI95UCL,'r',(freq.fs1:freq.fs2:freq.fs3),CI95LCL,'r',...
    'LineWidth',change.linw);
axis([100,2000,-2000,1000]);
set(gca,'xtick',[100 250 500 750 1000 1250 1500]);
grid on
xlabel('Frequency (Hz)');
ylabel('Impedance (Acoustic Ohm)');
title('95% Confidence Bounds healthy 24 M.O. ear');
hold on
semilogx((freq.fs1:freq.fs2:freq.fs3),pr.Xp(:,300),'--k','LineWidth',2.5)
hold off

end