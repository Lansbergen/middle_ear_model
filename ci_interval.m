function [CI95UCL, CI95LCL]=ci_interval(sample,df)
%calculate 95% CI interval bounds: input is sample and df
%
%   Program calculates 95% coinfidence interval (two-tailed)
%   Uses tinv function from statistical toolbox.
%
%
%   (c) Simon Lansbergen, May 2016.
%


% calculate 95% CI interval bounds
SEM = std(sample)./sqrt(df-1);       % Standard Error
ts = tinv([0.025  0.975],df-1);      % T-Score, 95% Confidence
CI95UCL = mean(sample) + ts(1).*SEM; % Upper confidence interval 
CI95LCL = mean(sample) + ts(2).*SEM; % Lower confidence interval 

end