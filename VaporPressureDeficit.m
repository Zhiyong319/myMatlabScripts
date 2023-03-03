function [vpd]=VaporPressureDeficit(T,RH,opt)

%VaporPressureDeficit Calculate the vapor pressure deficit(kPa) as a
%function of temperature (degrees Celsius) and relative humidity (%)
%Useage:
%    [vpd]=VaporPressureDeficit(T,RH,opt)
%
%Reference: 
% opt 1: eq. (26) in Shi et al. (2008), Comparison of methods for estimating 
%   evapotranspiration rate of dry forest canopy: Eddy covariance, Bowen ratio energy balance, and
%   Penman-Monteith equation. JOURNAL OF GEOPHYSICAL RESEARCH, 113,D19116.
% opt 2: http://www.shodor.org/os411/courses/_master/tools/calculators/satmixratio/index.html
%
%designed by Zhiyong Wu, Mar 07, 2016
%
%see also SaturationVaporPressure, VaporPressure

switch (opt)
    case {1}
        
        a=0.611;  % kPa
        b=17.502; % 
        c=240.97; % degree C

        es=a*exp(b*T./(T+c));
        e=es.*RH/100;
        vpd=es-e;
        
    case {2}
        
        a=0.611;  % kPa
        b=7.5;    % 
        c=237.3;  % degree C

        es=a*10.^(b*T./(T+c));
        e=es.*RH/100;
        vpd=es-e;
        
    otherwise
        disp('The opt value MUST be 1 or 2');
end