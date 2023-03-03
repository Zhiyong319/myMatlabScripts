function [RH]=DewPoint2RH(T,DPT,opt)

%DewPoint2RH Convert dew point temperature (DPT, degree C) to relative humidity (%)
%Useage:
%    [RH]=DewPoint2RH(T,DPT,opt)
%
%Reference: 
% opt 1: eq. (26) in Shi et al. (2008), Comparison of methods for estimating 
%   evapotranspiration rate of dry forest canopy: Eddy covariance, Bowen ratio energy balance, and
%   Penman-Monteith equation. JOURNAL OF GEOPHYSICAL RESEARCH, 113,D19116.
% opt 2: http://www.shodor.org/os411/courses/_master/tools/calculators/satmixratio/index.html
%
%designed by Zhiyong Wu, Apr 2019
%
%see also SaturationVaporPressure, VaporPressureDeficit

switch (opt)
    case {1}
        
        a=0.611;  % kPa
        b=17.502; % 
        c=240.97; % degree C

        e=a*exp(b*DPT./(DPT+c));
        es=a*exp(b*T./(T+c));
        RH=e./es*100;
        
    case {2}
        
        a=0.611;  % kPa
        b=7.5;    % 
        c=237.3;  % degree C

        e=a*10.^(b*DPT./(DPT+c));
        es=a*10.^(b*T./(T+c));
        RH=e./es*100;
        
    otherwise
        disp('The opt value MUST be 1 or 2');
end